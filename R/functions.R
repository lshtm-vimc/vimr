

#' Creates .data.batch for running multiple birth cohorts (Gavi runs)
#'
#' Creates .data.batch which is used when running/looping over multiple birth cohorts ( runCohort() ) at once.
#'     Similar to RegisterBatchData, but for when we make runs for Gavi.
#'
#' .data.batch is based on the data.table (DT) coverage_data, which is a DT with columns country_code (ISO3),
#'     year (of vaccination), age_first (age at vaccination), age_last (age at vaccination),
#'     coverage (in proportion, for all the age groups specified).
#'
#' @param gavi_coverage data table with coverage estimates as downloaded from VIMC montagu
#' @param gavi_template data table with reporting template as downloaded from VIMC montagu
#' @param use_campaigns logical, whether campaigns as stated in coverage files should be modelled
#' @param use_routine logical, whether routine vaccination as stated in coverage file should be modelled
#' @param restrict_to_coverage_data logical, whether the first birth-cohort should be the first cohort that is mentioned in the coverage data.
#'     If TRUE, restrict to coverage data.
#'     If FALSE, restrict to cohorts provided in gavi_template.
#' @param force logical, whether .data.batch should be overwritten if it already exists
#' @param psa integer, indicating how many runs for probabilistic sensitivity analysis (PSA). 0 to run no PSA.
#'
#' @return None
#' @export
#'
#' @examples #

RegisterBatchDataGavi <- function (gavi_coverage, gavi_template, use_campaigns, use_routine, restrict_to_coverage_data=FALSE, force=FALSE, psa=0) {
  if(exists(".data.batch") & !force){
    stop("'.data.batch' already exists.")
  }
  if(use_campaigns){
    coverage_data <- gavi_coverage[activity_type=="routine" | (activity_type=="campaign" & coverage > 0)]
  } else {
    coverage_data <- gavi_coverage[activity_type=="routine"]
  }
  if(!use_routine){
    coverage_data[activity_type=="routine" & coverage > 0, "coverage"] <- 0
  }
  coverage_data [target=="<NA>","target"] <- NA
  class (coverage_data$target) <- "numeric"
  coverage_data <- coverage_data [country_code %in% unique(gavi_template[,country])]
  macs <- coverage_data [age_first != age_last]
  nomacs <- coverage_data [age_first == coverage_data$age_last]
  if (nrow(macs) > 0) {
    for(m in 1:nrow(macs)){
      ages <- macs[m,age_first]:macs[m,age_last]
      for(a in ages){
        nomacs <- rbindlist(
          list(
            nomacs,
            macs[m,]
          )
        )
        if(a == ages[1]){
          target <- as.numeric (nomacs[nrow(nomacs),target])
        }
        nomacs [nrow(nomacs),"age_first"] <- a
        nomacs [nrow(nomacs),"age_last"] <- a
        #spread size of target evenly over age-strata targetted
        nomacs [nrow(nomacs),"target"] <- target/length(ages)
      }
    }
    coverage_data <- nomacs
  }
  coverage_data[,"birthcohort"] <- coverage_data[,year] - coverage_data[,age_first]

  setorder(coverage_data, country_code, birthcohort, age_first)

  #get years that should be reported in template
  reporting_years <- sort(as.numeric(unique(gavi_template$year)))

  #get years for which there is demographic data
  demographic_years <- sort(as.numeric(unique(data.pop[country_code %in% unique(coverage_data[,country_code]),year])))

  #get birthcohorts for which we have coverage data
  coverage_years <- sort(as.numeric(unique(coverage_data$birthcohort)))

  #get min and max birthcohorts that should be modelled, following template
  min_year <- min(reporting_years)-max(gavi_template[year==min(reporting_years),age])
  max_year <- max(reporting_years)-min(gavi_template[year==max(reporting_years),age])

  #restrict to years for which we have demographic data, or to years for which we have coverage data
  if(!restrict_to_coverage_data){
    if(min(demographic_years) > min_year){
      year_first <- min(demographic_years)
    } else {
      year_first <- min_year
    }
  } else {
    if(min(coverage_years) > min_year){
      year_first <- min(coverage_years)
    } else {
      year_first <- min_year
    }
  }

  #restrict to years for which we have demographic data
  if(max(demographic_years) < max_year){
    year_last <- max(demographic_years)
  } else {
    year_last <- max_year
  }

  birthcohorts <- year_first:year_last

  #remove birthcohorts which should not be modelled
  coverage_data <- coverage_data [birthcohort %in% birthcohorts]

  countries <- sort ( unique( coverage_data[,country_code] ) )
  for(c in countries) {
    #create template for data not yet in coverage-data
    template <- coverage_data[country_code == c & activity_type == "routine" & birthcohort==min(coverage_data[country_code == c & activity_type == "routine", birthcohort])]
    #select birthcohorts which are not yet in the coverage-data and add to data
    missing_birthcohorts <- birthcohorts[!(birthcohorts %in% coverage_data[country_code == c,birthcohort])]
    if (length(missing_birthcohorts) > 0 ) {
      for (b in missing_birthcohorts) {
        t_coverage_data <- template
        t_coverage_data [,"birthcohort"] <- b
        t_coverage_data [,"coverage"] <- 0
        coverage_data <- rbindlist (
          list(
            coverage_data,
            t_coverage_data
          )
        )
      }
    }
  }
  colnames (coverage_data)[which(colnames(coverage_data)=="age_first")] <- "agevac"
  coverage_data <- coverage_data [,c("country_code", "birthcohort", "coverage", "agevac", "activity_type", "target")]

  #model countries without coverage data but in template (with coverage-level of 0)
  countries <- sort (unique(gavi_template[,country]))
  countries <- countries [!(countries %in% unique(coverage_data[,country_code]))]
  if (length(countries) > 0) {
    for (c in countries) {
      t_coverage_data <- coverage_data[country_code == unique (coverage_data[,country_code])[1]]
      t_coverage_data [,"target"] <- 0
      t_coverage_data [,"coverage"] <- 0
      t_coverage_data [,"country_code"] <- c

      coverage_data <- rbindlist (
        list(
          t_coverage_data,
          coverage_data
        )
      )
    }
  }
  setorder (coverage_data, country_code, birthcohort, agevac)
  .data.batch <<- coverage_data

  countries <- sort (unique(.data.batch[,country_code]))

  if (psa > 1) {
    psadat <- data.table(
      country = character(0),
      run_id = numeric(0),
      incidence = numeric(0),
      mortality = numeric(0)
    )
    for (c in countries){
      #select proxy country if data not available
      tc <- switch(
        c,
        "XK"="ALB",
        "MHL"="KIR",
        "TUV"="FJI",
        "PSE"="JOR",
        "SSD"="SDN",
        c
      )
      inc_quality <- data.quality [iso3==tc, Incidence]
      mort_quality <- data.quality [iso3==tc, Mortality]
      if (inc_quality == 0){
        inc_quality <- c(0.5,1.5)
      } else {
        inc_quality <- c(0.8,1.2)
      }
      if(mort_quality == 0){
        mort_quality <- c(0.5,1.5)
      } else {
        mort_quality <- c(0.8,1.2)
      }
      psadat <- rbindlist(
        list(
          psadat,
          data.table(
            country = rep(c, psa),
            psa = c(1:psa),
            incidence = runif (n=psa, min=inc_quality[1], max=inc_quality[2]),
            mortality = runif (n=psa, min=inc_quality[1], max=mort_quality[2])
          )
        )
      )
    }
    if (exists(".data.batch") & !force) {
      warning("'.data.batch.psa' already exists and is NOT overwritten.")
    } else {
      .data.batch.psa <<- psadat
    }
  }
}

##################################################################################################################################

#' Formatting output for VIMC Montagu
#'
#' \code{OutputGavi} takes result of BatchRun and outputs it in format to be uploaded to VIMC Montagu.
#'
#' @param DT data table with results
#' @param age_stratified logical, whether output should be stratified by age
#' @param calendar_year logical, whether output should be given by calendar year of event OR by year of birth of cohort
#' @param gavi_template data table with template file downloaded from montagu
#'
#' @return #
#' @export
#'
#' @examples #

OutputGavi <- function (DT, age_stratified=TRUE, calendar_year=FALSE, gavi_template=-1) {
  #check if data by calendar_year
  if("year" %in% colnames(DT)){
    is_by_calendar_year <- TRUE
  } else {
    is_by_calendar_year <- FALSE
    colnames(DT)[which(colnames(DT) == "birthcohort")] <- "year"
  }

  #check if values are proportions
  if(!("cases" %in% colnames(DT))){
    DT[,"inc.cecx"] <- DT[,cohort_size]*DT[,inc.cecx]
    DT[,"mort.cecx"] <- DT[,cohort_size]*DT[,mort.cecx]
    DT[,"disability"] <- DT[,cohort_size]*DT[,disability] + DT[,cohort_size]*DT[,lifey]
    if("run_id" %in% colnames(DT)){
      DT <- DT[,c("scenario","run_id","country","year","age","cohort_size","inc.cecx","mort.cecx","disability")]
      colnames(DT) <- c("scenario","run_id","country","year","age","cohort_size","cases","deaths","dalys")
    } else {
      DT <- DT[,c("scenario","country","year","age","cohort_size","inc.cecx","mort.cecx","disability")]
      colnames(DT) <- c("scenario","country","year","age","cohort_size","cases","deaths","dalys")
    }
  } else {
    DT[,"dalys"] <- DT[,lifey] + DT[,disability]
    if("run_id" %in% colnames(DT)){
      DT <- DT[,c("scenario","run_id","country","year","age","cohort_size","cases","deaths","dalys")]
    } else {
      DT <- DT[,c("scenario","country","year","age","cohort_size","cases","deaths","dalys")]
    }
  }

  if(is.data.table(gavi_template)){
    #calendar year is needed to select data in gavi_template
    if(!is_by_calendar_year){
      DT[,"year"] <- DT[,year] + DT[,age]
    }
    DT <- DT[year %in% gavi_template[,year]]
    for(y in sort(unique(DT[,year]))){
      DT <- DT[year!=y | (year==y & age %in% gavi_template[year==y,age])]
    }
    for(c in unique(DT[,country])){
      DT[country == c, "country_name"] <- unique(gavi_template[country==c, country_name])
    }
    DT[,"disease"] <- unique(gavi_template[,"disease"])
    #revert back to impact year
    if(!is_by_calendar_year){
      DT[,"year"] <- DT[,year] - DT[,age]
    }
    if("run_id" %in% colnames(DT)){
      DT <- DT[,c("scenario","run_id",colnames(gavi_template)),with=F]
    } else {
      DT <- DT[,c("scenario",colnames(gavi_template)),with=F]
    }
  }

  #return correct year
  if(calendar_year & !is_by_calendar_year){
    DT[,"year"] <- DT[,year] + DT[,age]
  } else if(!calendar_year & is_by_calendar_year){
    DT[,"year"] <- DT[,year] - DT[,age]
  }
  if("run_id" %in% colnames(DT)){
    if(!age_stratified){
      DT <- dtAggregate(DT, "age", c("cohort_size","cases","deaths","dalys","run_id"))
    }
    setorder(DT, scenario, run_id, country, year, age)
  } else {
    if(!age_stratified){
      DT <- dtAggregate(DT, "age", c("cohort_size","cases","deaths","dalys"))
    }
    setorder(DT, scenario, country, year, age)
  }
  return(DT)
}



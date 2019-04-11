################################################################################
# Functions
################################################################################

#' Estimate vaccination impact and generate disease burden estimates
#'
#' @param vaccineCoverageFile
#' @param diseaseBurdenTemplateFile
#' @param plots
#'
#' @return
#' @export
#'
#' @examples
EstimateVaccineImpact <- function (vaccineCoverageFile,
                                   diseaseBurdenTemplateFile,
                                   plots = FALSE)
{
  # set up cohorts
  cohorts <- SetupCohorts (vaccineCoverageFile = vaccineCoverageFile,
                           diseaseBurdenFile   = diseaseBurdenTemplateFile)

  # register parallelisation
  cl <- makeCluster (detectCores())
  registerDoParallel (cl)

  # estimate disease burden
  diseaseBurdenEstimates <-
    foreach (i=1:nrow(cohorts),
             .combine = rbind,
             .packages=c('vimr', 'stringr', 'tidyverse')) %dopar% {

               # estimate disease burden -- one cohort at a time
               RunSingleCohort (cohorts[i, ])
               }

  # stop parallelisation
  stopCluster (cl)

  # save disease burden estimates in full form and streamlined form for VIMC
  SaveDieaseBurdenEstimates (diseaseBurdenEstimates, diseaseBurdenTemplateFile)

  # generate plots if requested
  if (plots){
    PlotVaccineImpact_vimc (vaccineCoverageFile, diseaseBurdenTemplateFile)
  }

} # end of function: EstimateVaccineImpact


#' Generate cohorts file based on vaccine coverage and disease burden template
#' files (VIMC format)
#'
#' @param vaccine
#' @param vaccineCoverageFile
#' @param diseaseBurdenFile
#'
#' @return
#' @export
#' @import data.table
#'
#' @examples
SetupCohorts <- function (vaccine, vaccineCoverageFile, diseaseBurdenFile) {

  ##############################################################################
  # Can handle Routine vaccination
  # TODO: To incorporate Campaign vaccination
  # Routine vaccination scenarios are ok for now for VIMC -- Hib, PCV & Rota
  # Campaign vaccination scenarios are there for HPV: update to handle this
  ##############################################################################

  # Read in vaccination coverage & disease burden template files (VIMC format)
  vaccineCoverage <- fread (vaccineCoverageFile)
  diseaseBurden   <- fread (diseaseBurdenFile)

  # set to data table format
  setDT (vaccineCoverage)
  setDT (diseaseBurden)

  # initialise cohorts table
  cohorts <- vaccineCoverage

  # set vaccination year
  cohorts %<>% mutate (
    age_vaccination  = age_first,                           # age of vaccination
    vaccination_year = year,                                # year of vaccination
    start_age        = min (diseaseBurden$age),             # start age of cohort for follow-up
    end_age          = max (diseaseBurden$age),             # end age of cohort for follow-up
    birthcohort_year = (vaccination_year - age_vaccination) # year of birth cohort
  )
  cohorts <- as.data.table (cohorts)

  # calculate start and end years of birth cohorts
  birthcohort_start_year <- min(diseaseBurden$year) - max(diseaseBurden$age)
  birthcohort_end_year   <- max(diseaseBurden$year) - max(diseaseBurden$age)

  # subset cohorts table (which includes vaccine coverage values)
  # from start to end years of birth cohorts (of interest)
  cohorts <- cohorts [(birthcohort_year >= birthcohort_start_year) &
                        (birthcohort_year <= birthcohort_end_year)]

  # specify variables/columns of interest in the cohorts table
  vars <- c("vaccine", "activity_type", "country_code", "country",
            "birthcohort_year", "start_age", "end_age",
            "age_vaccination", "vaccination_year", "coverage")

  # extract variables/columns of interest in the cohorts table
  cohorts <- select (cohorts, vars)

  # set column order
  setcolorder (cohorts, vars)

  # return cohorts table
  return (cohorts)

}  # end of function: SetupCohorts


#' Run a single cohort
#'
#' @param cohort
#'
#' @return
#' @export
#'
#' @examples
RunSingleCohort <- function (cohort) {

  # identify vaccine preventable disease
  # specified by vaccine name -- (Hib/PCV/Rota)
  vpd <- unique (cohort$vaccine)
  if (vpd == "Hib3") {
    vpd <- "Hib"
  }

  # identify the corresponding disease burden file
  data.diseaseBurden <- get (str_c ("data.", vpd, ".diseaseBurden"))
  setDT (data.diseaseBurden)

  # extract disease burden specific to this country & cohort's start and end ages
  diseaseBurden <-
    data.diseaseBurden [(country_code == cohort$country_code) &
                          (age == cohort$start_age:cohort$end_age)]

  # drop non-requisite columns (low, high, source)
  diseaseBurden [, grep (".low",    colnames (diseaseBurden), fixed=T) := NULL]
  diseaseBurden [, grep (".high",   colnames (diseaseBurden), fixed=T) := NULL]
  diseaseBurden [, grep (".source", colnames (diseaseBurden), fixed=T) := NULL]

  # save reference year of disease burden estimates
  referenceYear <- diseaseBurden$year

  # set (year) timeline specific to this cohort
  diseaseBurden$year <-
    (cohort$birthcohort_year + cohort$start_age):
    (cohort$birthcohort_year + cohort$end_age)

  # update disease burden estimates to the timeline specific to this cohort
  diseaseBurden <- AdjustDiseaseBurden (diseaseBurden)

  # initialise columns for cohort_size
  diseaseBurden [, cohort_size        := NA]
  diseaseBurden [, remainingYearsLife := NA]

  # set cohort size based on UNWPP estimates for the timeline specific to this cohort
  for (i in 1:nrow (diseaseBurden)) {
    diseaseBurden$cohort_size [i] <-
      filter (data.pop_1y,
              (country_code == diseaseBurden [i, country_code]) &
                (year       == diseaseBurden [i, year]) &
                (age_from   == diseaseBurden [i, age])
              )$value

    # estimate remaining years of life for this specific country and age
    # divison by 5 is to account for 5-year age interval data
    diseaseBurden$remainingYearsLife [i] <-
      filter (data.remainingyearsoflife,
              (country_code    == diseaseBurden [i, country_code]) &
                (year %/% 5    == diseaseBurden[i, year] %/% 5) &
                (age_from      <= diseaseBurden [i, age]) &
                (age_to        >= diseaseBurden [i, age])
              )$value
  }

  # ##########
  # cname <- grep (".cases.", colnames (diseaseBurden), fixed=T)
  # caseBurden = rowSums (diseaseBurden [, cname, with=F])
  # diseaseBurden [, cases := caseBurden]
  # ##########

  # sum cases and deaths (in each row of disease burden table)
  diseaseBurden [, casesPerPerson := rowSums (diseaseBurden [,
                (grep (".cases.", colnames (diseaseBurden), fixed=T)), with=F])]
  diseaseBurden [, deathsPerPerson := rowSums (diseaseBurden [,
                (grep (".deaths.", colnames (diseaseBurden), fixed=T)), with=F])]

  # compute ylds
  ylds_estimate = computeYLDs (diseaseBurden)

  # compute ylds, ylls, dalys
  diseaseBurden [, yldsPerPerson := computeYLDs (diseaseBurden)]
  diseaseBurden [, yllsPerPerson  := deathsPerPerson * remainingYearsLife]
  diseaseBurden [, dalysPerPerson := (yldsPerPerson + yllsPerPerson)]

  # compute absolute number of cases, deaths, ylls, ylds
  diseaseBurden [, cases  := casesPerPerson  * cohort_size]
  diseaseBurden [, deaths := deathsPerPerson * cohort_size]
  diseaseBurden [, ylds   := yldsPerPerson   * cohort_size]
  diseaseBurden [, ylls   := yllsPerPerson   * cohort_size]
  diseaseBurden [, dalys  := dalysPerPerson  * cohort_size]

  # set column order and drop column for remaining years of life
  setcolorder (diseaseBurden,
               neworder = c("disease", "year", "age", "country_code", "country",
                            "cohort_size", "dalys", "cases", "deaths",
                            "ylds", "ylls"))
  diseaseBurden [, remainingYearsLife := NULL]

  return (diseaseBurden)

} # end of function: RunSingleCohort



#' Update disease burden estimates to the timeline specific to a given cohort
#'
#' @param diseaseBurden
#'
#' @return
#' @export
#'
#' @examples
AdjustDiseaseBurden <- function (diseaseBurden) {

  # get reference year to adjust disease burden estimates for Hib, PCV and Rota
  referenceYear <- data.variables[variable=="referenceYear"]$value

  # get under-5 mortality rate for the reference year
  u5mortality_refYear <-
    data.u5mortality [(country_code == diseaseBurden$country_code &
                         year       == referenceYear)]$value

  # get under-5 mortality rates specific for this country and timeline
  u5mortality <-
    data.u5mortality [(country_code == diseaseBurden$country_code &
                         year %in% diseaseBurden$year),
                      .(value)]

  # compute adjustment factor for disease burden
  adjustFactor <- u5mortality / u5mortality_refYear

  # make copy of disease burden
  diseaseBurdenCopy <- diseaseBurden

  # extract disease burden only and save other columns as well
  otherColumns <-
    diseaseBurden [,  c("disease", "year", "age", "country_code", "country")]
  diseaseBurden <-
    diseaseBurden [, -c("disease", "year", "age", "country_code", "country")]

  # apply adjustment factor to disease burden
  diseaseBurden <- diseaseBurden * as.numeric (unlist(adjustFactor))

  # combine other columns to disease burden
  diseaseBurden <- bind_cols (otherColumns, diseaseBurden)

} # end of function: AdjustDiseaseBurden


# Compute YLDs -- years of life lost due to disability
computeYLDs <- function (diseaseBurden) {

  # identify disease
  disease <- unique (diseaseBurden$disease)

  # initialise column for ylds
  diseaseBurden [, ylds := 0]

  # select the columns with cases for different conditions of this disease
  casesColnumbers <- grep (".cases.", colnames (diseaseBurden), fixed=T)
  casesColnames <- colnames (diseaseBurden)[casesColnumbers]

  # split disease and conditions
  dis.con <- strsplit (casesColnames, ".", fixed=T)

  # loop through different conditions for this disease
  len <- length (casesColnumbers)

  for (i in 1:len) {
    # identify disease.condition key to get disability weights and illness duration
    disease.condition <- paste (dis.con[[i]][1], ".", dis.con[[i]][2], sep="")

    # disability weight
    dw <- data.disabilityWeights [key.dis.cdn == disease.condition]$Mid

    # illness duration
    duration <- data.illnessDuration [key.dis.cdn == disease.condition]$Mid

    # yld calculation
    diseaseBurden$ylds <- diseaseBurden$ylds +
      (diseaseBurden[,casesColnames[i], with=F] * dw * duration)
  }

  # return estimate of ylds (years of life lost due to disability)
  return (diseaseBurden$ylds)

} # end of function: computeYLDs


#' Save disease burden estimates in full and streamlined VIMC format
#'
#' @param diseaseBurdenEstimates
#' @param diseaseBurdenTemplateFile
#'
#' @return
#' @export
#'
#' @examples
SaveDieaseBurdenEstimates <- function (diseaseBurdenEstimates,
                                       diseaseBurdenTemplateFile) {

  # set filenames for disease burden estimates
  diseaseBurdenFile_full <- sub ("template", "estimates-full",
                                diseaseBurdenTemplateFile, fixed=T)
  diseaseBurdenFile_vimc <- sub ("template", "estimates-vimc",
                                diseaseBurdenTemplateFile, fixed=T)

  # Save disease burden estimates in full form
  fwrite (diseaseBurdenEstimates, diseaseBurdenFile_full)

  # select variables for VIMC format
  vars_vimc <- c("disease", "year", "age", "country_code", "country",
                 "cohort_size", "dalys", "cases", "deaths")
  diseaseBurdenEstimates_vimc <- diseaseBurdenEstimates [, vars_vimc, with=F]


  # Read disease burden template file (VIMC format)
  diseaseBurdenTemplate <- fread (diseaseBurdenTemplateFile)

  # Add/merge/join disease burden estimates to template file by columns match on
  # disease, year, age and country (code)
  diseaseBurdenEstimates_vimc <- left_join (diseaseBurdenTemplate,
                                            diseaseBurdenEstimates_vimc,
                                            by=c("disease",
                                                 "year",
                                                 "age",
                                                 "country"="country_code"))
  # rename columns
  setnames (diseaseBurdenEstimates_vimc,
            old = c(  "cohort_size.y", "dalys.y", "cases.y", "deaths.y"),
            new = c(  "cohort_size",   "dalys",   "cases",   "deaths"))

  # select variables for VIMC format
  vars_vimc <- c("disease", "year", "age", "country", "country_name",
                 "cohort_size", "dalys", "cases", "deaths")
  diseaseBurdenEstimates_vimc <- diseaseBurdenEstimates_vimc [, vars_vimc]

  # Save disease burden estimates in VIMC format
  fwrite (diseaseBurdenEstimates_vimc, diseaseBurdenFile_vimc)

  # Check for any missing values in disease burden estimates
  if (any (is.na(diseaseBurdenEstimates_vimc)))
    warning ("missing values in disease burden estimates")

} # end of function: SaveDieaseBurdenEstimates



#' Plot vaccine coverage and disease burden estimates
#'
#' @param vaccineCoverageFile
#' @param diseaseBurdenTemplateFile
#' @param diseaseBurdenEstimatesFile
#'
#' @return
#' @export
#'
#' @examples
PlotVaccineImpact_vimc <- function (vaccineCoverageFile = NULL,
                                    diseaseBurdenTemplateFile,
                                    diseaseBurdenEstimatesFile = NULL) {

  # filename for disease burden estimates
  if (is.null (diseaseBurdenEstimatesFile)) {
    diseaseBurdenFile_vimc <- str_replace (diseaseBurdenTemplateFile,
                                           "template",
                                           "estimates-vimc")
  } else {
    diseaseBurdenFile_vimc <- diseaseBurdenEstimatesFile
  }

  # filename for plots
  diseaseBurdenPlots_vimc <- str_replace_all (diseaseBurdenFile_vimc,
                                              c("estimates-vimc" = "plots-vimc",
                                                "csv"            = "pdf"))

  # read in disease burden estimates
  diseaseBurdenEstimates <- fread (diseaseBurdenFile_vimc,
                                   sep = ",",
                                   header=TRUE)

  # open plot file
  pdf (diseaseBurdenPlots_vimc)

  # determine vaccine coverage scenario and plot vaccine coverage
  if (is.null(vaccineCoverageFile)) {
    scenario <- ""
  } else {
    # read in vaccine coverage
    vaccineCoverage <- fread (vaccineCoverageFile,
                              sep = ",",
                              header=TRUE)

    # determine vaccine coverage scenario
    scenario <- unique (vaccineCoverage$scenario)

    # plot vaccine coverage
    print (
      ggplot (data=vaccineCoverage,
              aes (x=year)) +
        geom_point (aes (y=coverage)) +
        facet_wrap (. ~ country) +
        labs (title=scenario,
              x="calendar year",
              y="vaccine coverage")
    )
  }

  # set plot scenario title
  scenario_title <- str_c (unique(diseaseBurdenEstimates$disease),
                           scenario,
                           sep="  ")

  # plot disease burden -- cases, deaths, dalys
  for (burden_type in c("cohort_size", "cases", "deaths", "dalys")) {

    print (
      ggplot (data=diseaseBurdenEstimates,
              aes (x=year)) +
        geom_point (aes (y=get(burden_type), col=age), alpha=0.75) +
        facet_wrap (. ~ country_name) +
        labs (title=scenario_title,
              x="calendar year",
              y=burden_type)
    )
  }

  # close plot file
  dev.off ()

} # end of function: PlotVaccineImpact_vimc

# Functions

# Run a single cohort
RunSingleCohort <- function (cohort) {

  # identify the corresponding disease burden file
  data.diseaseBurden <- eval (as.name (str_c ("data.",
                                              unique (cohort$vaccine),
                                              ".diseaseBurden")))
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
  # TODO

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

    diseaseBurden$remainingYearsLife [i] <-
      filter (data.remainingyearsoflife,
              (country_code    == diseaseBurden [i, country_code]) &
                (floor(year/5) == floor (diseaseBurden[i, year] / 5)) &
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
  # diseaseBurden [, yldsPerPerson  := 0] ###########
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

}


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
}

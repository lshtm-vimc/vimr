# data.R - This file includes documentation of datasets.

#' Age-specific fertility rate
#'
#' Dataset containing age-specific fertility rate by country, age range, year and gender
#'
#' @usage data.agespecificfert
#' @format A data frame with 20580 observations on the following 8 variables.
#' \describe{
#'   \item{country_code_numeric}{a numeric vector}
#'   \item{country_code}{country code}
#'   \item{country}{name of country}
#'   \item{age_from}{starting age}
#'   \item{age_to}{end age}
#'   \item{year}{year}
#'   \item{gender}{gender}
#'   \item{value}{fertility rate}
#' }
#' @source {Demographic data from the Vaccine Impact Modelling Consortium (VIMC)}
# @source \url{https://gco.iarc.fr/today/online-analysis-table}
"data.agespecificfert"


#' Total population
#'
#' Dataset containing total population country, age range, year and gender
#'
#' @usage data.totalpop
#' @format A data frame with 14798 observations on the following 8 variables.
#' \describe{
#'   \item{country_code_numeric}{a numeric vector}
#'   \item{country_code}{country code}
#'   \item{country}{name of country}
#'   \item{age_from}{starting age}
#'   \item{age_to}{end age}
#'   \item{year}{year}
#'   \item{gender}{gender}
#'   \item{value}{total population}
#' }
#' @source {Demographic data from the Vaccine Impact Modelling Consortium (VIMC)}
# @source \url{https://gco.iarc.fr/today/online-analysis-table}
"data.totalpop"


#' Quinquennial population (5-year time and age)
#'
#' Dataset containing population - quinquennial population (5-year time and age) by country, age range, year and gender
#'
#' @usage data.quinquennialpop
#' @format A data frame with 71442 observations on the following 8 variables.
#' \describe{
#'   \item{country_code_numeric}{a numeric vector}
#'   \item{country_code}{country code}
#'   \item{country}{name of country}
#'   \item{age_from}{starting age}
#'   \item{age_to}{end age}
#'   \item{year}{year}
#'   \item{gender}{gender}
#'   \item{value}{population quinquennial 5-year time and age}
#' }
#' @source {Demographic data from the Vaccine Impact Modelling Consortium (VIMC)}
# @source \url{https://gco.iarc.fr/today/online-analysis-table}
"data.quinquennialpop"

#' Interpolated population (1-year time and age)
#'
#' Dataset containing population - interpolated (1-year time and age) by country, age range, year and gender
#'
#' @usage data.interpolatedpop
#' @format A data frame with 170480 observations on the following 8 variables.
#' \describe{
#'   \item{country_code_numeric}{a numeric vector}
#'   \item{country_code}{country code}
#'   \item{country}{name of country}
#'   \item{age_from}{starting age}
#'   \item{age_to}{end age}
#'   \item{year}{year}
#'   \item{gender}{gender}
#'   \item{value}{population interpolated 1-year time and age}
#' }
#' @source {Demographic data from the Vaccine Impact Modelling Consortium (VIMC)}
# @source \url{https://gco.iarc.fr/today/online-analysis-table}
"data.interpolatedpop"


#' Growth rate
#'
#' Dataset containing growth rate by country, age range, year and gender
#'
#' @usage data.growthrate
#' @format A data frame with 2940 observations on the following 8 variables.
#' \describe{
#'   \item{country_code_numeric}{a numeric vector}
#'   \item{country_code}{country code}
#'   \item{country}{name of country}
#'   \item{age_from}{starting age}
#'   \item{age_to}{end age}
#'   \item{year}{year}
#'   \item{gender}{gender}
#'   \item{value}{growth rate}
#' }
#' @source {Demographic data from the Vaccine Impact Modelling Consortium (VIMC)}
# @source \url{https://gco.iarc.fr/today/online-analysis-table}
"data.growthrate"

#' Under 5 mortality rate
#'
#' Dataset containing under 5 mortality rate by country, age range, year and gender
#'
#' @usage data.u5mortality
#' @format A data frame with 20580 observations on the following 8 variables.
#' \describe{
#'   \item{country_code_numeric}{a numeric vector}
#'   \item{country_code}{country code}
#'   \item{country}{name of country}
#'   \item{age_from}{starting age}
#'   \item{age_to}{end age}
#'   \item{year}{year}
#'   \item{gender}{gender}
#'   \item{value}{fertility rate}
#' }
#' @source {Demographic data from the Vaccine Impact Modelling Consortium (VIMC)}
# @source \url{https://gco.iarc.fr/today/online-analysis-table}
"data.u5mortality"


#' Under 1 mortality rate
#'
#' Dataset containing under 1 mortality rate by country, age range, year and gender
#'
#' @usage data.u1mortality
#' @format   A data frame with 14700 observations on the following 8 variables.
#' \describe{
#'   \item{country_code_numeric}{a numeric vector}
#'   \item{country_code}{country code}
#'   \item{country}{name of country}
#'   \item{age_from}{starting age}
#'   \item{age_to}{end age}
#'   \item{year}{year}
#'   \item{gender}{gender}
#'   \item{value}{under 1 mortality rate}
#' }
#' @source {Demographic data from the Vaccine Impact Modelling Consortium (VIMC)}
# @source \url{https://gco.iarc.fr/today/online-analysis-table}
"data.u1mortality"


#' Survivors from a birth-cohort of 100k
#'
#' A data frame with 64680 observations on the following 8 variables.
#'
#' @usage data.survival
#' @format A data frame with 20580 observations on the following 8 variables.
#' \describe{
#'   \item{country_code_numeric}{a numeric vector}
#'   \item{country_code}{country code}
#'   \item{country}{name of country}
#'   \item{age_from}{starting age}
#'   \item{age_to}{end age}
#'   \item{year}{year}
#'   \item{gender}{gender}
#'   \item{value}{number of survivors}
#' }
#' @source {Demographic data from the Vaccine Impact Modelling Consortium (VIMC)}
# @source \url{https://gco.iarc.fr/today/online-analysis-table}
"data.survival"


#' Probability of dying by age
#'
#' Dataset containing probability of dying by age by country, age range, year and gender
#'
#' @usage data.pdeathbyage
#' @format A data frame with 52920 observations on the following 8 variables.
#' \describe{
#'   \item{country_code_numeric}{a numeric vector}
#'   \item{country_code}{country code}
#'   \item{country}{name of country}
#'   \item{age_from}{starting age}
#'   \item{age_to}{end age}
#'   \item{year}{year}
#'   \item{gender}{gender}
#'   \item{value}{probability of dying}
#' }
#' @source {Demographic data from the Vaccine Impact Modelling Consortium (VIMC)}
# @source \url{https://gco.iarc.fr/today/online-analysis-table}
"data.pdeathbyage"


#' Neonatal mortality rate
#'
#' Dataset containing 28-day neonatal mortality rate by country, age range, year and gender
#'
#' @usage data.neonatalmortality
#' @format A data frame with 14700 observations on the following 8 variables.
#' \describe{
#'   \item{country_code_numeric}{a numeric vector}
#'   \item{country_code}{country code}
#'   \item{country}{name of country}
#'   \item{age_from}{starting age}
#'   \item{age_to}{end age}
#'   \item{year}{year}
#'   \item{gender}{gender}
#'   \item{value}{28-day neonatal mortality rate}
#' }
#' @source {Demographic data from the Vaccine Impact Modelling Consortium (VIMC)}
# @source \url{https://gco.iarc.fr/today/online-analysis-table}
"data.neonatalmortality"


#' Life expectancy at birth
#'
#' Dataset containing life expectancy at birth by country, age range, year and gender
#'
#' @usage data.lifeexpectancy
#' @format A data frame with 1470 observations on the following 8 variables.
#' \describe{
#'   \item{country_code_numeric}{a numeric vector}
#'   \item{country_code}{country code}
#'   \item{country}{name of country}
#'   \item{age_from}{starting age}
#'   \item{age_to}{end age}
#'   \item{year}{year}
#'   \item{gender}{gender}
#'   \item{value}{expected remaining years of life}
#' }
#' @source {Demographic data from the Vaccine Impact Modelling Consortium (VIMC)}
# @source \url{https://gco.iarc.fr/today/online-analysis-table}
"data.lifeexpectancy"


#' Expected remaining years of life
#'
#' Dataset containing expected remaining years of life by country, age range, year and gender
#'
#' @usage data.remainingyearsoflife
#' @format A data frame with 64680 observations on the following 8 variables.
#' \describe{
#'   \item{country_code_numeric}{a numeric vector}
#'   \item{country_code}{country code}
#'   \item{country}{name of country}
#'   \item{age_from}{starting age}
#'   \item{age_to}{end age}
#'   \item{year}{year}
#'   \item{gender}{gender}
#'   \item{value}{expected remaining years of life}
#' }
#' @source {Demographic data from the Vaccine Impact Modelling Consortium (VIMC)}
# @source \url{https://gco.iarc.fr/today/online-analysis-table}
"data.remainingyearsoflife"


#' Deaths in total
#'
#' Dataset containing total number of deaths by country, age range, year and gender
#'
#' @usage data.totaldeaths
#' @format A data frame with 14700 observations on the following 8 variables.
#' \describe{
#'   \item{country_code_numeric}{a numeric vector}
#'   \item{country_code}{country code}
#'   \item{country}{name of country}
#'   \item{age_from}{starting age}
#'   \item{age_to}{end age}
#'   \item{year}{year}
#'   \item{gender}{gender}
#'   \item{value}{number of deaths}
#' }
#' @source {Demographic data from the Vaccine Impact Modelling Consortium (VIMC)}
# @source \url{https://gco.iarc.fr/today/online-analysis-table}
"data.totaldeaths"


#' Number of deaths by age
#'
#' Dataset containing number of deaths by country, age range, year and gender
#'
#' @usage data.deathsbyage
#' @format A data frame with 58800 observations on the following 8 variables.
#' \describe{
#'   \item{country_code_numeric}{a numeric vector}
#'   \item{country_code}{country code}
#'   \item{country}{name of country}
#'   \item{age_from}{starting age}
#'   \item{age_to}{end age}
#'   \item{year}{year}
#'   \item{gender}{gender}
#'   \item{value}{number of deaths}
#' }
#' @source {Demographic data from the Vaccine Impact Modelling Consortium (VIMC)}
# @source \url{https://gco.iarc.fr/today/online-analysis-table}
"data.deathsbyage"


#' Crude death rate
#'
#' Dataset containing crude death rate (CDR) by country, age range, year and gender
#'
#' @usage data.crudedeathrate
#' @format A data frame with 14700 observations on the following 8 variables.
#' \describe{
#'   \item{country_code_numeric}{a numeric vector}
#'   \item{country_code}{country code}
#'   \item{country}{name of country}
#'   \item{age_from}{starting age}
#'   \item{age_to}{end age}
#'   \item{year}{year}
#'   \item{gender}{gender}
#'   \item{value}{crude death rate}
#' }
#' @source {Demographic data from the Vaccine Impact Modelling Consortium (VIMC)}
# @source \url{https://gco.iarc.fr/today/online-analysis-table}
"data.crudedeathrate"



#' Central death rate
#'
#' Dataset containing central death rate by country, age range, year and gender
#'
#' @usage data.centraldeathrateASMR
#' @format A data frame with 55860 observations on the following 8 variables.
#' \describe{
#'   \item{country_code_numeric}{a numeric vector}
#'   \item{country_code}{country code}
#'   \item{country}{name of country}
#'   \item{age_from}{starting age}
#'   \item{age_to}{end age}
#'   \item{year}{year}
#'   \item{gender}{gender}
#'   \item{value}{central death rate}
#' }
#' @source {Demographic data from the Vaccine Impact Modelling Consortium (VIMC)}
# @source \url{https://gco.iarc.fr/today/online-analysis-table}
"data.centraldeathrateASMR"


#' Net migration rate
#'
#' Dataset containing net migration rate by country, age range, year and gender
#'
#' @usage data.netmigration
#' @format A data frame with 2940 observations on the following 8 variables.
#' \describe{
#'   \item{country_code_numeric}{a numeric vector}
#'   \item{country_code}{country code}
#'   \item{country}{name of country}
#'   \item{age_from}{starting age}
#'   \item{age_to}{end age}
#'   \item{year}{year}
#'   \item{gender}{gender}
#'   \item{value}{net migration rate}
#' }
#' @source {Demographic data from the Vaccine Impact Modelling Consortium (VIMC)}
# @source \url{https://gco.iarc.fr/today/online-analysis-table}
"data.netmigration"


#' Total fertility rate
#'
#' Dataset containing total fertility rate by country, age range, year and gender
#'
#' @usage data.totalfert
#' @format A data frame with 14700 observations on the following 8 variables.
#' \describe{
#'   \item{country_code_numeric}{a numeric vector}
#'   \item{country_code}{country code}
#'   \item{country}{name of country}
#'   \item{age_from}{starting age}
#'   \item{age_to}{end age}
#'   \item{year}{year}
#'   \item{gender}{gender}
#'   \item{value}{total fertility rate}
#' }
#' @source {Demographic data from the Vaccine Impact Modelling Consortium (VIMC)}
# @source \url{https://gco.iarc.fr/today/online-analysis-table}
"data.totalfert"


#' Sex ratio at birth
#'
#' Dataset containing sex-ratio at birth by country, age range, year and gender
#'
#' @usage data.sexratio
#' @format A data frame with 2940 observations on the following 8 variables.
#' \describe{
#'   \item{country_code_numeric}{a numeric vector}
#'   \item{country_code}{country code}
#'   \item{country}{name of country}
#'   \item{age_from}{starting age}
#'   \item{age_to}{end age}
#'   \item{year}{year}
#'   \item{gender}{gender}
#'   \item{value}{sex-ratio}
#' }
#' @source {Demographic data from the Vaccine Impact Modelling Consortium (VIMC)}
# @source \url{https://gco.iarc.fr/today/online-analysis-table}
"data.sexratio"


#' Crude birth rate (CBR)
#'
#' Dataset containing crude birth rate by country, age range, year and gender
#'
#' @usage data.crudebirthrate
#' @format A data frame with 14700 observations on the following 8 variables.
#' \describe{
#'   \item{country_code_numeric}{a numeric vector}
#'   \item{country_code}{country code}
#'   \item{country}{name of country}
#'   \item{age_from}{starting age}
#'   \item{age_to}{end age}
#'   \item{year}{year}
#'   \item{gender}{gender}
#'   \item{value}{crude birth rate}
#' }
#' @source {Demographic data from the Vaccine Impact Modelling Consortium (VIMC)}
# @source \url{https://gco.iarc.fr/today/online-analysis-table}
"data.crudebirthrate"


#' Number of births - quinquennial
#'
#' Dataset containing number of births occuring every 5 years by country, age range, year and gender
#'
#' @usage data.birthsquinquennial
#' @format A data frame with 2940 observations on the following 8 variables.
#' \describe{
#'   \item{country_code_numeric}{a numeric vector}
#'   \item{country_code}{country code}
#'   \item{country}{name of country}
#'   \item{age_from}{starting age}
#'   \item{age_to}{end age}
#'   \item{year}{year}
#'   \item{gender}{gender}
#'   \item{value}{number of births occuring every 5 years}
#' }
#' @source {Demographic data from the Vaccine Impact Modelling Consortium (VIMC)}
# @source \url{https://gco.iarc.fr/today/online-analysis-table}
"data.birthsquinquennial"


#' Number of births by age of mother
#'
#' Dataset with the number of births by maternal by country, year and gender
#'
#' @usage data.birthsbymaternalage
#' @format A data frame with 20580 observations on the following 8 variables.
#' \describe{
#'   \item{country_code_numeric}{a numeric vector}
#'   \item{country_code}{country code}
#'   \item{country}{name of country}
#'   \item{age_from}{starting age}
#'   \item{age_to}{end age}
#'   \item{year}{year}
#'   \item{gender}{gender}
#'   \item{value}{number of births}
#' }
#' @source {Demographic data from the Vaccine Impact Modelling Consortium (VIMC)}
# @source \url{https://gco.iarc.fr/today/online-analysis-table}
"data.birthsbymaternalage"


#' Number of Births
#'
#' Dataset containing number of births by country, age range, year and gender
#'
#' @usage data.births
#' @format A data frame with 14700 observations on the following 8 variables.
#' \describe{
#'   \item{country_code_numeric}{a numeric vector}
#'   \item{country_code}{country code}
#'   \item{country}{name of country}
#'   \item{age_from}{starting age}
#'   \item{age_to}{end age}
#'   \item{year}{year}
#'   \item{gender}{gender}
#'   \item{value}{number of births}
#' }
#' @source {Demographic data from the Vaccine Impact Modelling Consortium (VIMC)}
# @source \url{https://gco.iarc.fr/today/online-analysis-table}
"data.births"


#' Disability weights for Pneumococcus (Pneumococcal conjugate vaccine)
#'
#' Dataset disability weights for PCV by condition/sequelae
#'
#' @usage data.PCV_DALY
#' @format A data frame with 27 observations on the following 3 variables.
#' \describe{
#'   \item{Disease}{disease}
#'   \item{Condition}{condition/sequelae}
#'   \item{GBD_2015_mean}{Mean disability weight}
#' }
#' @source {General Guidance for DALYs calculation VIMC with input from DOVE 2017-11-24 11:03:46}
# @source \url{https://gco.iarc.fr/today/online-analysis-table}
"data.PCV_DALY"



#' Disability weights for Rotavirus
#'
#' Dataset disability weights for Rotavirus by condition/sequelae
#'
#' @usage data.Rota_DALY
#' @format A data frame with 3 observations on the following 3 variables.
#' \describe{
#'   \item{Disease}{disease}
#'   \item{Condition}{condition/sequelae}
#'   \item{GBD_2015_mean}{Mean disability weight}
#' }
#' @source {General Guidance for DALYs calculation VIMC with input from DOVE 2017-11-24 11:03:46}
# @source \url{https://gco.iarc.fr/today/online-analysis-table}
"data.Rota_DALY"



#' Disability weights for Haemophilus influenzae type B
#'
#' Dataset disability weights for Haemophilus influenzae type B by condition/sequelae
#'
#' @usage data.Hib_DALY
#' @format A data frame with 24 observations on the following 3 variables.
#' \describe{
#'   \item{Disease}{disease}
#'   \item{Condition}{condition/sequelae}
#'   \item{GBD_2015_mean}{Mean disability weight}
#' }
#' @source {General Guidance for DALYs calculation VIMC with input from DOVE 2017-11-24 11:03:46}
# @source \url{https://gco.iarc.fr/today/online-analysis-table}
"data.Hib_DALY"


#' Disability weights for Haemophilus influenzae type B
#'
#' Dataset containing disability weights for Haemophilus influenzae type B by condition/sequelae (UNIVAC model)
#'
#' @usage data.vaccine_schedules
#' @format A data frame with 195 observations on the following 6 variables.
#' \describe{
#'   \item{Country}{country}
#'   \item{BCG}{BCG target age in weeks}
#'   \item{DTP1}{DTP1 target age in weeks}
#'   \item{DTP2}{DTP2 target age in weeks}
#'   \item{DTP3}{DTP3 target age in weeks}
#'   \item{Meas1}{Measles target age in weeks}
#' }
#' @source \url{www.who.int/immunization/monitoring_surveillance/data/schedule_data.xls}
# @source \url{https://gco.iarc.fr/today/online-analysis-table}
"data.vaccine_schedules"


#' Event rates (cases) for Rotavirus D1 non-severe RVGE
#'
#' Dataset containing event rates (cases) for rotavirus D1 for non-severe RVGE
#'
#' @usage data.rotacases_nonsevereD1
#' @format A data frame with 195 observations on the following 8 variables.
#' \describe{
#'   \item{Country}{country}
#'   \item{WHO region}{WHO region}
#'   \item{WHO region2}{WHO region country code}
#'   \item{Income}{income level}
#'   \item{Age}{age}
#'   \item{Mid}{mid}
#'   \item{Low}{low}
#'   \item{High}{high}
#' }
#' @source {Bilcke J. et al. Estimating the Incidence of Symptomatic Rotavirus Infections:
#' A Systematic Review and Meta-Analysis.  PLOS One, June 2009, Volume 4, Issue 6, e6060. Note:
#' random effects model resulted in a global incidence estimate of 0.24 [0.17; 0.34] symptomatic
#' RV infections per person year of observation for children below 2 years of age.  Crudely extrapolating
#'  to children aged <5yrs, and assuming minimal incidence aged 2+yrs, gives an under-five incidence rate
#'   of 0.10 [0.07 - 0.14] or 10,000 [7,000 - 14,000] per 100,000 per year <5yrs.  Severe incidence rates
#'   derived from Fischer-Walker (see source for severe RVGE incidence), were then subtracted to give non-severe
#'   RVGE incidence.}
# @source \url{https://gco.iarc.fr/today/online-analysis-table}
"data.rotacases_nonsevereD1"


#' Event rates (cases) for Rotavirus D2 severe RVGE
#'
#' Dataset containing event rates (cases) for rotavirus D2 for severe RVGE
#'
#' @usage data.rotacases_severeD2
#' @format A data frame with 195 observations on the following 8 variables.
#' \describe{
#'   \item{Country}{country}
#'   \item{WHO region}{WHO region}
#'   \item{WHO region2}{WHO region country code}
#'   \item{Income}{income level}
#'   \item{Age}{age}
#'   \item{Mid}{mid}
#'   \item{Low}{low}
#'   \item{High}{high}
#' }
#' @source {Fischer-Walker C. et al, Table 1: Global and regional burden of diarrhoea and pneumonia per
#' year in children aged 0–4 years, by WHO region.  Global burden of childhood pneumonia and diarrhoea.
#' Lancet 2013; 381: 1405–16.  Notes: Episodes per child per year <5yrs (2010) by WHO region were multiplied by
#' the proportion of episodes that were severe by WHO region (approximately 2%).  These were further multiplied
#' by the rotavirus-positive proportion <5yrs by WHO region, reported among hospitalised diarrhoea cases in CHERG
#' (Lanata C. et al, Global Causes of Diarrheal Disease Mortality in Children <5 Years of Age: A Systematic Review.
#' PLOS One. September 2013, Volume 8, Issue 9, e72788).  The uncertainty range only reflects uncertainty in the
#' incidence of diarrhoea episodes.}
# @source \url{https://gco.iarc.fr/today/online-analysis-table}
"data.rotacases_severeD2"

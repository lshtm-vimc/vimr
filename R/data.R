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



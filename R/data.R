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





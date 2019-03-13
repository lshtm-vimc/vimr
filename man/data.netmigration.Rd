\name{data.netmigration}
\alias{data.netmigration}
\docType{data}
\title{
Net migration rate
}
\description{
Dataset containing net migration rate by country, age range, year and gender
}
\usage{data("data.netmigration")}
\format{
  A data frame with 2940 observations on the following 8 variables.
  \describe{
    \item{\code{country_code_numeric}}{a numeric vector}
    \item{\code{country_code}}{country code}
    \item{\code{country}}{name of country}
    \item{\code{age_from}}{starting age}
    \item{\code{age_to}}{end age}
    \item{\code{year}}{year}
    \item{\code{gender}}{gender}
    \item{\code{value}}{net migration rate}
  }
}
\details{
%%  ~~ If necessary, more details than the __description__ above ~~
}
\source{
Demographic data from the Vaccine Impact Modelling Consortium (VIMC)
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
data(data.netmigration)
## maybe str(data.netmigration) ; plot(data.netmigration) ...
}
\keyword{datasets}

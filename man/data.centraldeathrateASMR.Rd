\name{data.centraldeathrateASMR}
\alias{data.centraldeathrateASMR}
\docType{data}
\title{
Central death rate
}
\description{
Dataset containing central death rate by country, age range, year and gender
}
\usage{data("data.centraldeathrateASMR")}
\format{
  A data frame with 55860 observations on the following 8 variables.
  \describe{
    \item{\code{country_code_numeric}}{a numeric vector}
    \item{\code{country_code}}{country code}
    \item{\code{country}}{name of country}
    \item{\code{age_from}}{starting age}
    \item{\code{age_to}}{end age}
    \item{\code{year}}{year}
    \item{\code{gender}}{gender}
    \item{\code{value}}{central death rate}
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
data(data.centraldeathrateASMR)
## maybe str(data.centraldeathrateASMR) ; plot(data.centraldeathrateASMR) ...
}
\keyword{datasets}

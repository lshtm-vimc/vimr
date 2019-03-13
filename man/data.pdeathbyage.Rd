\name{data.pdeathbyage}
\alias{data.pdeathbyage}
\docType{data}
\title{
Probability of dying by age
}
\description{
Dataset containing probability of dying by age by country, age range, year and gender
}
\usage{data("data.pdeathbyage")}
\format{
  A data frame with 0 observations on the following 2 variables.
  \describe{
    \item{\code{country_code_numeric}}{a numeric vector}
    \item{\code{country_code}}{country code}
    \item{\code{country}}{name of country}
    \item{\code{age_from}}{starting age}
    \item{\code{age_to}}{end age}
    \item{\code{year}}{year}
    \item{\code{gender}}{gender}
    \item{\code{value}}{probability of dying}
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
data(data.pdeathbyage)
## maybe str(data.pdeathbyage) ; plot(data.pdeathbyage) ...
}
\keyword{datasets}

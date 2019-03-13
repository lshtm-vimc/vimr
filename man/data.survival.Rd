\name{data.survival}
\alias{data.survival}
\docType{data}
\title{
Survivors from a birth-cohort of 100k
}
\description{
Dataset containing number of survivors from a birth-cohort of 100k by country, age range, year and gender
}
\usage{data("data.survival")}
\format{
  A data frame with 64680 observations on the following 8 variables.
  \describe{
    \item{\code{country_code_numeric}}{a numeric vector}
    \item{\code{country_code}}{country code}
    \item{\code{country}}{name of country}
    \item{\code{age_from}}{starting age}
    \item{\code{age_to}}{end age}
    \item{\code{year}}{year}
    \item{\code{gender}}{gender}
    \item{\code{value}}{number of survivors}
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
data(data.survival)
## maybe str(data.survival) ; plot(data.survival) ...
}
\keyword{datasets}

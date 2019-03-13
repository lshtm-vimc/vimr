\name{data.growthrate}
\alias{data.growthrate}
\docType{data}
\title{
Growth rate
}
\description{
Dataset containing growth rate by country, age range, year and gender
}
\usage{data("data.growthrate")}
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
    \item{\code{value}}{growth rate}
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
data(data.growthrate)
## maybe str(data.growthrate) ; plot(data.growthrate) ...
}
\keyword{datasets}

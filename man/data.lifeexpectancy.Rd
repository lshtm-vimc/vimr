\name{data.lifeexpectancy}
\alias{data.lifeexpectancy}
\docType{data}
\title{
Life expectancy at birth
}
\description{
Dataset containing life expectancy at birth by country, age range, year and gender
}
\usage{data("data.lifeexpectancy")}
\format{
  A data frame with 1470 observations on the following 8 variables.
  \describe{
    \item{\code{country_code_numeric}}{a numeric vector}
    \item{\code{country_code}}{country code}
    \item{\code{country}}{name of country}
    \item{\code{age_from}}{starting age}
    \item{\code{age_to}}{end age}
    \item{\code{year}}{year}
    \item{\code{gender}}{gender}
    \item{\code{value}}{expected remaining years of life}
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
data(data.lifeexpectancy)
## maybe str(data.lifeexpectancy) ; plot(data.lifeexpectancy) ...
}
\keyword{datasets}

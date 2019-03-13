\name{data.totaldeaths}
\alias{data.totaldeaths}
\docType{data}
\title{
Deaths in total
}
\description{
Dataset containing total number of deaths by country, age range, year and gender
}
\usage{data("data.totaldeaths")}
\format{
  A data frame with 14700 observations on the following 8 variables.
  \describe{
    \item{\code{country_code_numeric}}{a numeric vector}
    \item{\code{country_code}}{country code}
    \item{\code{country}}{name of country}
    \item{\code{age_from}}{starting age}
    \item{\code{age_to}}{end age}
    \item{\code{year}}{year}
    \item{\code{gender}}{gender}
    \item{\code{value}}{number of deaths}
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
data(data.totaldeaths)
## maybe str(data.totaldeaths) ; plot(data.totaldeaths) ...
}
\keyword{datasets}

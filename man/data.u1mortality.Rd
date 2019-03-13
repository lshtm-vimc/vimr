\name{data.u1mortality}
\alias{data.u1mortality}
\docType{data}
\title{
Under 1 mortality rate
}
\description{
Dataset containing under 1 mortality rate by country, age range, year and gender
}
\usage{data("data.u1mortality")}
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
    \item{\code{value}}{under 1 mortality rate}
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
data(data.u1mortality)
## maybe str(data.u1mortality) ; plot(data.u1mortality) ...
}
\keyword{datasets}

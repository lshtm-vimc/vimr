\name{data.u5mortality}
\alias{data.u5mortality}
\docType{data}
\title{
Under 5 mortality rate
}
\description{
Dataset containing under 5 mortality rate by country, age range, year and gender
}
\usage{data("data.u5mortality")}
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
    \item{\code{value}}{under 5 mortality rate}
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
data(data.u5mortality)
## maybe str(data.u5mortality) ; plot(data.u5mortality) ...
}
\keyword{datasets}

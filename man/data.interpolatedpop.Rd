\name{data.interpolatedpop}
\alias{data.interpolatedpop}
\docType{data}
\title{
Interpolated population (1-year time and age)
}
\description{
Dataset containing population - interpolated (1-year time and age) by country, age range, year and gender
}
\usage{data("data.interpolatedpop")}
\format{
  A data frame with 170480 observations on the following 8 variables.
  \describe{
    \item{\code{country_code_numeric}}{a numeric vector}
    \item{\code{country_code}}{country code}
    \item{\code{country}}{name of country}
    \item{\code{age_from}}{starting age}
    \item{\code{age_to}}{end age}
    \item{\code{year}}{year}
    \item{\code{gender}}{gender}
    \item{\code{value}}{population interpolated 1-year time and age}
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
data(data.interpolatedpop)
## maybe str(data.interpolatedpop) ; plot(data.interpolatedpop) ...
}
\keyword{datasets}

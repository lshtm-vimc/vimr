\name{data.totalfert}
\alias{data.totalfert}
\docType{data}
\title{
Total fertility
}
\description{
Dataset containing total fertility rate by country, age range, year and gender
}
\usage{data("data.totalfert")}
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
    \item{\code{value}}{total fertility rate}
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
data(data.totalfert)
## maybe str(data.totalfert) ; plot(data.totalfert) ...
}
\keyword{datasets}

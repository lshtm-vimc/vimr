\name{data.birthsbymaternalage}
\alias{data.birthsbymaternalage}
\docType{data}
\title{
Number of births by age of mother
}
\description{
Dataset with the number of births by maternal by country, year and gender
}
\usage{data("data.birthsbymaternalage")}
\format{
  A data frame with 20580 observations on the following 8 variables.
  \describe{
    \item{\code{country_code_numeric}}{a numeric vector}
    \item{\code{country_code}}{country code}
    \item{\code{country}}{name of country}
    \item{\code{age_from}}{starting age}
    \item{\code{age_to}}{end age}
    \item{\code{year}}{year}
    \item{\code{gender}}{gender}
    \item{\code{value}}{number of births}
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
data(data.birthsbymaternalage)
## maybe str(data.birthsbymaternalage) ; plot(data.birthsbymaternalage) ...
}
\keyword{datasets}

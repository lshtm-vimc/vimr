\name{data.agespecificfert}
\alias{data.agespecificfert}
\docType{data}
\title{
Age-specific fertility rate
}
\description{
%%  ~~ A concise (1-5 lines) description of the dataset. ~~
}
\usage{data("data.agespecificfert")}
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
    \item{\code{value}}{fertility rate}
  }
}
\details{
Dataset containing age-specific fertility rate by country, age range, year and gender
}
\source{
Demographic data from the Vaccine Impact Modelling Consortium (VIMC)
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
data(data.agespecificfert)
## maybe str(data.agespecificfert) ; plot(data.agespecificfert) ...
}
\keyword{datasets}

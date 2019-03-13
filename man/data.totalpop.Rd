\name{data.totalpop}
\alias{data.totalpop}
\docType{data}
\title{
Total population
}
\description{
Dataset containing total population country, age range, year and gender
}
\usage{data("data.totalpop")}
\format{
  A data frame with 14798 observations on the following 8 variables.
  \describe{
    \item{\code{country_code_numeric}}{a numeric vector}
    \item{\code{country_code}}{country code}
    \item{\code{country}}{name of country}
    \item{\code{age_from}}{starting age}
    \item{\code{age_to}}{end age}
    \item{\code{year}}{year}
    \item{\code{gender}}{gender}
    \item{\code{value}}{total population}
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
data(data.totalpop)
## maybe str(data.totalpop) ; plot(data.totalpop) ...
}
\keyword{datasets}

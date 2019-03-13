\name{data.quinquennialpop}
\alias{data.quinquennialpop}
\docType{data}
\title{
Quinquennial population (5-year time and age)
}
\description{
Dataset containing population - quinquennial population (5-year time and age) by country, age range, year and gender
}
\usage{data("data.quinquennialpop")}
\format{
  A data frame with 71442 observations on the following 8 variables.
  \describe{
    \item{\code{country_code_numeric}}{a numeric vector}
    \item{\code{country_code}}{country code}
    \item{\code{country}}{name of country}
    \item{\code{age_from}}{starting age}
    \item{\code{age_to}}{end age}
    \item{\code{year}}{year}
    \item{\code{gender}}{gender}
    \item{\code{value}}{population quinquennial 5-year time and age}
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
data(data.quinquennialpop)
## maybe str(data.quinquennialpop) ; plot(data.quinquennialpop) ...
}
\keyword{datasets}

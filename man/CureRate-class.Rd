\name{CureRate-class}
\Rdversion{1.1}
\docType{class}
\alias{CureRate-class}
\alias{CR-CureRate-method}

\title{Class \code{"CureRate"}}
\description{
Class of objects like the output of function \code{"curerate"}.
}
\section{Objects from the Class}{
Objects can be created by calls of the form \code{new("CureRate", ...)}.
}
\section{Slots}{
  \describe{
    \item{\code{cureobs}:}{Object of class \code{"numeric"}}
    \item{\code{medobs}:}{Object of class \code{"numeric"}}
    \item{\code{curerx}:}{Object of class \code{"numeric"}}
    \item{\code{medrx}:}{Object of class \code{"numeric"}}
    \item{\code{actime}:}{Object of class \code{"vector"}}
    \item{\code{futime}:}{Object of class \code{"vector"}}
    \item{\code{info}:}{Object of class \code{"vector"}}
    \item{\code{crits}:}{Object of class \code{"vector"}}
    \item{\code{alpha}:}{Object of class \code{"numeric"}}
    \item{\code{rho}:}{Object of class \code{"numeric"}}
    \item{\code{acrate}:}{Object of class \code{"numeric"}}
    \item{\code{probrx}:}{Object of class \code{"numeric"}}
    \item{\code{numreps}:}{Object of class \code{"integer"}}
    \item{\code{numobs}:}{Object of class \code{"matrix"}}
    \item{\code{timept}:}{Object of class \code{"array"}}
    \item{\code{deaths}:}{Object of class \code{"array"}}
    \item{\code{testname}:}{Object of class \code{"character"}}
    \item{\code{power}:}{Object of class \code{"array"}}
    \item{\code{beta}:}{Object of class \code{"matrix"}}
    \item{\code{indac}:}{Vector of objects of class \code{"integer"}}
    \item{\code{indfu}:}{Vector of objects of class \code{"integer"}}
    \item{\code{printflag}:}{Object of class \code{"integer"}}
  }
}
\section{Methods}{
  \describe{
    \item{show}{\code{signature(object = "CureRate")}}
	 }
}
\author{
Emil A. Cornea, Bahjat F. Qaqish, and Joseph G. Ibrahim

Maintainer: Emil A. Cornea <ecornea@live.unc.edu> 
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
  \code{\link{curerate}}, \code{\link{show-methods}}, \code{\link{showcr}}
}
\examples{
showClass("CureRate")

## Input Data
###############
# rho - specifies the value of rho in the G-rho test (Harrington and Fleming, 1982). 
# rho = 0 gives the logrank test, and rho = 1 the Peto-Peto Wilcoxon test
#(and rho = -1 the test discussed by Gray and Tsiatis, 1989).
rho = 0 

numreps = 500
##cureobs - probability of cure on the observation arm of the study
cureobs = .359
##curerx - probability of cure on the treatment arm of the study
curerx = .459
##medobs - median survival among the non-cured on observation
medobs = .747
##medrx - median survival among the non-cured on treatment
medrx = .859
##acrate - rate at which patients accrue, combined over both 
##observation and treatment arms of the study
acrate = 232
##probrx - probability of assignment to the treatment arm
probrx = .5
##actime  - accrual duration
actime = c(3.3, 3.5, 3.8); 
##futime  - followup duration
futime = c(2.0,  2.5) 
##info - vector of information times for the interim looks
##must be an increasing sequence in (0,1]
info = c( .35, .61, .86, 1.0)
##crits - vector of critical values corresponding to the 
##interim analysis time points specified in info
crits = c(3.6128, 2.6506, 2.1894, 2.0536)
%##alpha - one-sided level of significance
%alpha = .025
##############################################################

### Log-rank test: rho=0 (default)
mycr<-curerate(rho ,numreps,cureobs,curerx,medobs,medrx,acrate,
          probrx,actime,futime,info,crits)
mycr       ### (*)

show(mycr)   ### same as above
showcr(mycr)   ### same as above
unclass(mycr)
showcr(mycr,full.results=TRUE)
showcr(mycr,indac=3,indfu=1)
}
\keyword{classes}

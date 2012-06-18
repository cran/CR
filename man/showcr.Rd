\name{showcr}
\alias{showcr}
\alias{CR-showcr}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Function for displaying objects of class \code{CureRate} 
}
\description{
R function for customized display of an object of class \code{CureRate}.
It allows the user to display the full info for any pair set of pairs 
(\code{object@actime[]},\code{object@futime[]}). The default is the display 
of the summary power table. For more info, see the section {Arguments} below.
}
\usage{
showcr(cr, full.results = FALSE, indac = 0, indfu = 0)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{cr}{
      object of class \code{CureRate}
}
  \item{full.results}{
      logical, if TRUE, the full results are displayed, and the values of 
      \code{indac} and \code{indfu} are disregarded; if FALSE (default), 
      the summary power table is displayed only, unless both \code{indac} 
      and \code{indfu} are specified as (sub)vectors of indices of \code{cr@actime}
      and \code{cr@futime} when the corresponding detailed info is displayed for 
      each pair (\code{cr@actime[indac[i]]},\code{cr@futime[indac[j]]}).
}
  \item{indac}{
      vector of integers, subvector of indices of \code{cr@actime} vector; use
      only when \code{full.results=FALSE} and \code{indfu} is specified too;
      default value 0.
}
  \item{indfu}{
      vector of integers, subvector of indices of \code{cr@futime} vector; use
      only when \code{full.results=FALSE} and \code{indac} is specified too;
      default value 0.
}
}
\details{
The object \code{cr} of class \code{CureRate} must be specified.
If \code{full.results}, \code{indac}, and \code{indfu} are not specified, 
they assume the default values \code{TRUE}, \code{0}, and \code{0}, 
respectively, then the summary power table for the specified 
object \code{cr} is displayed only.  If \code{full.results} is not specified, 
but both \code{indac}, and \code{indfu} are specified, then \code{full.results} 
assumes the default value \code{TRUE} and all the info for each pair of 
(\code{cr@actime[indac[]]},\code{cr@futime[indfu[]]}) are displayed together 
with the summary power table. If \code{full.results} is specified as 
\code{TRUE}, then the values of \code{indac}, and \code{indfu}, 
specified or not, all info for all pairs 
(\code{cr@actime[]},\code{cr@futime[]}) are displayed together 
with the summary power table.
}

\author{
Emil A. Cornea, Bahjat F. Qaqish, and Joseph G. Ibrahim

Maintainer: Emil A. Cornea <ecornea@live.unc.edu> 
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
    \code{\link{CR-package}}, \code{\link{curerate}},
    \code{\link{CureRate-class}}, and \code{\link{show-methods}}
}
\examples{
##---- Should be DIRECTLY executable !! ----
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
###############################################################

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

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{functions}
\keyword{object display}

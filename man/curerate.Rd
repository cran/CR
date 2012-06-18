\name{curerate}
\alias{curerate}
\alias{CR-curerate}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Power Calculation for Weighted Log-Rank Tests in Cure Rate Models
}
\description{
This R-function performs power calculation in a group sequential clinical 
trial with censored survival data and possibly unequal patient allocation 
between treatment and control groups. The function can also be used to determine
the study duration in a clinical trial with censored survival data as the 
sum of the accrual duration, which determines the sample size in a traditional
sense, and the follow-up duration, which more or less controls the number 
of events to be observed.
}
\usage{
curerate(rho = 0, numreps, cureobs, curerx, medobs, medrx, acrate, probrx, 
        actime, futime, info, crits, alpha = 0.025)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{rho}{
      numeric specifying the value of rho in the G-rho test 
      (Harrington and Fleming, 1982), rho=0 (default) gives the log-rank test,
      rho=1 the Peto-Peto Wilcoxon test, and rho=-1 the test 
      discuss by Gray and Tsiatis, 1989.
}
  \item{numreps}{
      integer > 0 specifying the number of replications.
}
  \item{cureobs}{
      numeric specifying the probability of cure on the observation arm of the study.
}
  \item{curerx}{
      numeric specifying the probability of cure on the treatment arm of the study.
}
  \item{medobs}{
      numeric > 0 specifying the median survival among the non-cured on observation.
}
  \item{medrx}{
      numeric > 0 specifying the median survival among the non-cured on treatment.
}
  \item{acrate}{
      numeric > 0 specifying the rate at which patients accrue, combined over both
      observation and treatment arms of the study.
}
  \item{probrx}{
      numeric specifying the probability of assigment to the treatment arm, 
      must be in [0,1]. 
}
  \item{actime}{
      vector specifying the accrual durations.
}
  \item{futime}{
      vector specifying the follow-up durations.
}
  \item{info}{
      vector of information times for the interim looks; must be an increasing 
      sequence in (0,1].
}
  \item{crits}{
      vector of critical values corresponding to the interim analysis time points
      specified in \code{info}.
}
  \item{alpha}{
      numeric specifying the one-sided level of significance; must be in (0,1); 
      default value \code{0.025}; currently, it has no effect on the calculations,
      it is ignored in the current version of the software.
}
}
\details{
The function \code{curerate} is used to calculate the power of weighted log-rank 
tests in cure rate models.
}
\value{
    An object of S4 class \code{CureRate} which has the following 22 components
%%  If it is a LIST, use
  \item{cureobs}{numeric}
  \item{medobs}{numeric}
  \item{curerx}{numeric}
  \item{medrx}{numeric}
  \item{actime}{numeric vector}
  \item{futime}{numeric vector}
  \item{info}{numeric vector}
  \item{crits}{numeric vector}
  \item{alpha}{numeric}
  \item{rho}{numeric}

  \item{acrate}{numeric}
  \item{probrx}{numeric}
  \item{numreps}{integer}

  \item{numobs}{numeric matrix}
  \item{timept}{numeric 3D array}
  \item{deaths}{numeric 3D array}
  \item{testname}{character}
  \item{power}{numeric 3D array}
  \item{numobs}{numeric matrix}
  \item{indac}{vector of integers}
  \item{indfu}{vector of integers}
  \item{printflag}{integer}
}
\references{
Ewell, M. and Ibrahim, J.G. (1997). The Large Sample Distribution of the 
Weighted Log Rank Statistic Under General Local Alternatives. 
Lifetime Data Analysis,3,5-12

Kim, K. (1992). Study Duration for Group Sequential Clinical Trials with Censored 
Survival Data Adjusting for Stratification. Statistics in Medicine, 
Vol. 11, 1477-1788 

Harrington, D. P. and Fleming, T. R. (1982). A class of rank test procedures 
for censored survival data. Biometrika 69, 553-566.

Gray, R.J. and Tsiatis, A.A. (1989). A linear rank test for use when the main 
interest is in differences in cure rates. Biometrics 45, 899-904.
}
\author{
Emil A. Cornea, Bahjat F. Qaqish, and Joseph G. Ibrahim

Maintainer: Emil A. Cornea <ecornea@live.unc.edu>
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
    \code{\link{CR-package}}, \code{\link{CureRate-class}},
    \code{\link{showcr}}, and \code{\link{show-methods}}
}
\examples{
##---- Should be DIRECTLY executable !! ----
## Input Data
################
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
#############################################################


### Log-rank test: rho=0 (default)
mycr<-curerate(rho,numreps,cureobs,curerx,medobs,medrx,acrate,
          probrx,actime,futime,info,crits)
mycr       ### (*)

show(mycr)   ### same as above
showcr(mycr) ### same as above 
showcr(mycr,full.result=TRUE)
showcr(mycr,indac=2,indfu=1)
showcr(mycr,indac=2:3,indfu=2:1)
showcr(mycr,indac=c(1,3),indfu=2)

show(mycr)   ### same as (*) above
showcr(mycr) ### same as above
mycr         ### same as above

### Peto & Peto modification of the Gehan-Wilcoxon test: rho=1
rho=1
mycr<-curerate(rho,numreps,cureobs,curerx,medobs,medrx,acrate,
          probrx,actime,futime,info,crits)
mycr       
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{functions}
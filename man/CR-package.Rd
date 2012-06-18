\name{CR-package}
\alias{CR-package}
\alias{CR}
\docType{package}
\title{
Power Calculation for Weighted Log-Rank Tests in Cure Rate Models
}
\description{
This package contains R-functions to perform power calculation 
in a group sequential clinical trial with censored survival data and possibly 
unequal patient allocation between treatment and control groups. The functions 
can also be used to determine the study duration in a clinical trial with censored 
survival data as the sum of the accrual duration, which determines the sample
size in a traditional sense, and the follow-up duration, which more or less 
controls the number of events to be observed. This package also contains 
R functions and methods to display the computed results.
}
\details{
\tabular{ll}{
Package: \tab CR\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2012-06-18\cr
License: \tab GPL-2\cr
Depends: \tab methods\cr
}
}
\author{
Emil A. Cornea, Bahjat F. Qaqish, and Joseph G. Ibrahim

Maintainer: Emil A. Cornea <ecornea@live.unc.edu>
}
\references{
Ewell, M. and Ibrahim, J.G. (1997). The Large Sample Distribution of the 
Weighted Log Rank Statistic Under General Local Alternatives. 
Lifetime Data Analysis,3, 5-12.

Kim, K. (1992). Study Duration for Group Sequential Clinical Trials with Censored 
Survival Data Adjusting for Stratification.Statistics in Medicine, 
Vol. 11, 1477-1788. 

Harrington, D. P. and Fleming, T. R. (1982). A class of rank test procedures 
for censored survival data. Biometrika 69, 553-566.

Gray, R.J. and Tsiatis, A.A. (1989). A linear rank test for use when the main 
interest is in differences in cure rates. Biometrics 45, 899-904.
}
\keyword{ package }
\seealso{
    \code{\link{curerate}}, \code{\link{CureRate-class}},
    \code{\link{showcr}}, and \code{\link{show-methods}}
}
\examples{
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
##futime  - follow-up duration
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

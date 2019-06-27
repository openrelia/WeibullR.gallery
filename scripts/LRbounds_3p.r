## This script requires WeibullR version 1.0.10.7 or later
## Available at GitHub or R-Forge
## It utilizes a developmental function LRbounds3pw that may not exist in future
## CRAN submissions at 1.0.11 or higher. It is expected that the functionality will
## be incorporated in LRbounds with an npar argument of 3.

w2test<-read.csv("https://raw.githubusercontent.com/openrelia/WeibullR.gallery/master/data/w2test.csv", header=T)$w2test
LRbounds3pw(w2test, tzpoints=c(10,100,10), show=c(T,T))

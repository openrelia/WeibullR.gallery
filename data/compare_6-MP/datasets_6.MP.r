library(MASS)
datasets<-split(gehan,gehan$treat)
control<-datasets[[1]][,c(-1,-4)]
names(dcontrol)<-c("time","event")
treat6mp<-datasets[[2]][,c(-1,-4)]
names(treat6mp)<-c("time","event")
library(MASS)
datasets<-split(gehan,gehan$treat)
dataset1<-datasets[[1]][,c(-1,-4)]
names(dataset1)<-c("time","event")
dataset2<-datasets[[2]][,c(-1,-4)]
names(dataset2)<-c("time","event")
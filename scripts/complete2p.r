# complete2p.r

library(WeibullR)

S<-20
CI<-.8
n=20
set.seed(654321)

unity_pts<-qweibull(getPPP(rweibull(n,1,1))$ppp,1,1)


obj_list<-list()

for(x in 1:S) {
	sample<-rweibull(n,1,1)
	obj_list[[x]]<-wblr(sample, col="transparent")
	obj_list[[x]]<-wblr.fit(obj_list[[x]], col="darkgray", lwd=.1)
}

# graphic presentation
obj<-wblr(unity_pts, col="transparent")
obj<-wblr.fit(obj, col="black")
obj<-wblr.conf(obj, ci=CI, lty="dashed", lwd=2, col="red")
obj_list[[S+1]]<-obj

plot.wblr(obj_list, is.plot.legend=FALSE, main="Pivotal Analysis of Complete Failures" )

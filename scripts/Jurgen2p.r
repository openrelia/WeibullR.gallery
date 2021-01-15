# Jurgen2p.r

library(WeibullR)

S<-20
CI<-.8
nf=3
ns=10
set.seed(1234)
fail_pts<-rweibull(nf,1,1)
median_ranks<-getPPP(x=fail_pts, s=rep(10,ns))$ppp
pivotal_pts<-qweibull(median_ranks,1,1)
par<-lslr(getPPP(pivotal_pts))

obj_list<-list()

for(x in 1:S) {
	sample<-rweibull(nf,par[2],par[1])
	obj_list[[x]]<-wblr(x=sample, s=rep(10,ns), col="transparent")
	obj_list[[x]]<-wblr.fit(obj_list[[x]], col="darkgray", lwd=.1)
}

# Back end function pivotal.rr can be used to identify the median from a 
# parametric bootsrap of 10,000 samples
# dp<-sort(c(getPPP(rweibull(6,1,1))$ppp, pweibull(1,1,1)))
# bounds<-pivotal.rr(getPPP(fail_pts, rep(10,ns)), R2=0.0, CI=1.0, P1=par[1], P2=par[2],unrel=dp)
# median<-bounds[5000,]

# graphic presentation
# Pivotal points, when distributed according to the percentile
# plotting positions of the original data produce a unity line
obj<-wblr(x=pivotal_pts, s=rep(10,ns), col="black")
obj<-wblr.fit(obj, col="transparent")
obj<-wblr.conf(obj, ci=CI, lty="dashed", lwd=2, col="red")
obj_list[[S+1]]<-obj

plot.wblr(obj_list, is.plot.legend=FALSE, main="Pivotal Analysis of Failure Data with Type 2 Censored Values" )
# points(exp(median), p2y(dp), col="blue")
#

## The ParaBoot package source (.tar.gz) and a Windows build (.zip) are available for download
## at https://github.com/openrelia/WeibullR.gallery/blob/master/package/ 

library(ParaBoot)		
		
Sg<-20		
Sb<-1000		
CI<-.8		
nf=20		
ns=5		
set.seed(4321)		
		
example_data<-rweibull(nf+ns, 1,1)		
example_TEDF<-data.frame(time=example_data, event=c(rep(1,nf), rep(0,ns)))		
NDX<-order(example_data)		
example_TEDF<-example_TEDF[NDX,]		
event_vec<-example_TEDF$event		
		
median_ranks<-getPPP(example_TEDF)$ppp		
pivotal_pts<-qweibull(median_ranks,1,1)		
par<-lslr(getPPP(pivotal_pts))		
		
obj_list<-list()		
for(x in 1:Sg) {		
	sample<-rweibull((nf+ns),par[2],par[1])	
	sample_TEDF<-data.frame(time=sort(sample), event=event_vec)	
	obj_list[[x]]<-wblr(sample_TEDF, col="transparent")	
	obj_list[[x]]<-wblr.fit(obj_list[[x]], dist="weibull3p", col="gray", lwd=.1)	
}		
		
## bootmat<-pivotal.rr2(getPPP(example_TEDF), R2=0.0, CI=1.0, P1=par[1], P2=par[2], npar=3)				
bounds<-pivotal.rr2(getPPP(example_TEDF), R2=0.0, CI=CI, P1=par[1], P2=par[2], npar=3)		
		
	
# graphic presentation		
# Pivotal points, when distributed according to the percentile		
# plotting positions of the original data produce a unity line		
obj<-wblr(unity_TEDF(pivotal_pts, event_vec), col="transparent")		
obj<-wblr.fit(obj, col="transparent")		
obj<-wblr.conf(obj, ci=CI, lty="dashed", lwd=1, col="red")		
obj_list[[S+1]]<-obj		
		
plot.wblr(obj_list, is.plot.legend=FALSE, 		
xlim=c(.01,20),		
main="Pivotal Analysis of Failure Data with Aribitrary Censoring \nand 3p Modeling" )		
	
dp=c(seq(.01,.09,by=.01),seq(.10,.90,by=.10),seq(.91,.99, by=.01))		
points(exp(bounds$Lower), p2y(dp), type="l", col="blue")		
points(exp(bounds$Upper), p2y(dp), type="l", col="blue")		
points(exp(bounds$Median), p2y(dp), type="l", col="forestgreen")		

#abcens3p.r

# this function is required to fill in censored event times in the unity_TEDF					
unity_TEDF<- function(pivotal_pts, event_vec) {					
	time_vec<-NULL				
	piv_num<-1				
					
	for(ev in 1:length(event_vec)) {				
		if(event_vec[ev] == 1) {			
			time_vec <- c(time_vec, pivotal_pts[piv_num])		
			piv_num <- piv_num + 1		
		}else{			
			if(piv_num > 1 && piv_num<length(pivotal_pts)+1) {		
				midtime<-sum(pivotal_pts[(piv_num-1):piv_num])/2	
				time_vec <- c(time_vec, midtime)	
			}		
			if(piv_num == 1 ) {		
				midtime<- pivotal_pts[1]/2	
				time_vec <- c(time_vec, midtime)	
			}		
			if(piv_num >length(pivotal_pts) )  {		
				endtime<-max(pivotal_pts) + 10	
				time_vec <- c(time_vec, endtime)	
			}		
		}			
	}				
	return(data.frame(time=time_vec, event=event_vec))				
}					

library(WeibullR)		
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
# descriptive percentiles	
dp<-c(.001,.01, .02, .05, .10, .15, .20, .30, .40, .50,  .60, .70, .80, .90, .95, .99,.999)	
boot.mat<-NULL	
for(x in 1:Sb) {	
	sample<-rweibull((nf+ns),par[2],par[1])
	sample_TEDF<-data.frame(time=sort(sample), event=event_vec)
	fit<-lslr(getPPP(sample_TEDF), npar=3)
	xvals<- qweibull(dp,fit[2], fit[1])+fit[3]
	boot.mat<-rbind(boot.mat, xvals)
	
	
}	
boot.mat<-apply(boot.mat,2,sort)	
lo_row<-ceiling(Sb*(1-CI)/2)	
up_row<-floor(Sb*(1-(1-CI)/2))	
Lower<-boot.mat[lo_row,]	
Lower<-sapply(Lower,function(X) ifelse(X<=0,NA,X))	
Upper<-boot.mat[up_row,]	
Median<-boot.mat[floor(Sb/2),]	
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
points(Lower, p2y(dp), type="l", col="blue")	
points(Upper, p2y(dp), type="l", col="blue")	
points(Median, p2y(dp), type="l", col="forestgreen")	

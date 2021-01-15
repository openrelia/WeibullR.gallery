#arbcens2p.r
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
	
S<-20	
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

for(x in 1:S) {		
	sample<-rweibull((nf+ns),par[2],par[1])	
	sample_TEDF<-data.frame(time=sort(sample), event=event_vec)	
	obj_list[[x]]<-wblr(sample_TEDF, col="transparent")	
	obj_list[[x]]<-wblr.fit(obj_list[[x]], col="gray50", lwd=.1)	
}	

	
# graphic presentation
# Pivotal points, when distributed according to the percentile
# plotting positions of the original data produce a unity line
obj<-wblr(unity_TEDF(pivotal_pts, event_vec), col="transparent")
obj<-wblr.fit(obj, col="transparent")
obj<-wblr.conf(obj, ci=CI, lty="dashed", lwd=2, col="red")
obj_list[[S+1]]<-obj

plot.wblr(obj_list, is.plot.legend=FALSE, main="Pivotal Analysis of Failure Data with Arbitrarily Censored Values" )

# Back end function pivotal.rr can be used to identify the median 
# (and any confidence interval bounds) 
# from a parametric bootsrap of 10,000 samples
 dp<-c(.001,median_ranks,pweibull(1,1,1),.999)
 bounds<-pivotal.rr(getPPP(example_TEDF), R2=0.0, CI=1.0, P1=par[1], P2=par[2],unrel=dp)
 boot_median<-bounds[5000,]

# display the boot median as a line with its eta point blue)
points(exp(boot_median), p2y(dp), type="l",col="blue")
points(exp(boot_median[which(dp==pweibull(1,1,1))]), p2y(dp[which(dp==pweibull(1,1,1))]), col="blue")

# since the pivotal points in the wblr object were set to "transparent"
# here is an optional way to show the pivotal points in unity order
points(pivotal_pts, p2y(median_ranks), lwd=2, col="forestgreen")

# prove the unity line
unity_fit<-lslr(getPPP(unity_TEDF(pivotal_pts, event_vec)))
unity_fit

# get the weibull parameters for the boot_median
median_eta<-exp(boot_median[which(dp==pweibull(1,1,1))])
rise<-p2y(max(dp))-p2y(min(dp))
run<-max(boot_median)-min(boot_median)
median_beta<-rise/run
print(paste0("median eta:  ",median_eta))
print(paste0("median beta:  ",median_beta))
#
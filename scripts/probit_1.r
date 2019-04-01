## this file implements example data from Wayne Nelson in
## "Applied Life Data Analysis" (1982), page415

## Abernethy refers to this as inspection option #2 (Probit format 1)
## somewhat confusing because it also employs inspection option #1 for the fit

## Input Data #################################################
# inspection time
time<-c(6.12, 19.92, 29.64, 35.4, 39.72, 45.24,52.32, 63.48)
# quantity of newly identified cracked parts		
qty<-c(5, 16, 12, 18, 18, 2, 6, 17)		
x<-data.frame(time, qty)		
# a single population of parts inspected over time
# quantity in service (qis)		
qis = 167		
###############################################################
		
# required calculations for probit (not supported by wblr at this time)		
ppp<-cumsum(x$qty/qis)
# reverse Benard calculation to make the beta binomial bounds work		
adj_rank<-ppp*(qis + .4) + .3		
dpoints<-data.frame(time=x$time, ppp, adj_rank, weight=rep(1, nrow(x)))		

require(WeibullR)		
obj<-wblr(time, col="red")		
obj$data$dpoints<-dpoints
# option pp has no effect after initial wblr call
# unsupported option "probit" added here to appear in legend		
obj<-wblr.fit(obj, method.fit="rr-yonx", pp="probit", col="blue")		
		
# adjustments for plot legend		
obj$fit[[1]]$n<-qis		
obj$fit[[1]]$fail<-sum(qty)		
obj$fit[[1]]$cens<-qis-sum(qty)		
		
obj<-wblr.conf(obj, method.conf="bbb", ci=.95, lty=2, lwd=1)				
		
plot(obj, main="Parts Cracking Probit Analysis",		
	ylab="cumulative percent cracked",	
	xlab="inspection time",	
	in.legend.blives=FALSE)	

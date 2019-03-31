## this file implements example data from Wayne Nelson in
## "Applied Life Data Analysis" (1982), page415

## Abernethy refers to this as inspection option #5 (Interval Analysis)

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

# must prepare a mixed input for intervals with no failure data		
	left<-c(0, x$time[-nrow(x)])	
	right<- x$time	
	suspensionDF<-data.frame(time=max(x$time), event=0, qty=qis-sum(x$qty))	
		
	obj<-wblr(x=suspensionDF, interval=data.frame(left, right, qty=x$qty),
		interval.lty="dashed", interval.lwd=1, interval.col="blue"
	)	
	obj<-wblr.fit(obj, method.fit="mle", col="red")
	obj<-wblr.conf(obj, method.conf="fm", ci=.95, lty=2, lwd=1)
	obj<-wblr.conf(obj, method.conf="lrb", ci=.95, lty=2, lwd=1, col="orange")
	
	
	plot(obj, main="Parts Cracking Inspection\n Interval Analysis",		
		ylab="cumulative percent cracked",	
		xlab="inspection time",	
		in.legend.blives=FALSE)	

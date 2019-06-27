
## This script requires a development version of WeibullR for the p2y function.
## Most recent version is 1.0.10.7

	 w2test<-c(40.57903, 51.5263, 54.01269, 90.70031, 110.56461,	
	            117.86191, 137.16324, 147.69461, 160.77858, 187.4198)	
		
	# identify beta extremes for asymptote construction	
	contour_pts<-MLEcontour(mleframe(w2test), debias="rba")	
	max_beta<-which(contour_pts$Beta==max(contour_pts$Beta))	
	min_beta<-which(contour_pts$Beta==min(contour_pts$Beta))	
		
	fit_beta<-mlefit(mleframe(w2test), debias="rba")[2]	
		
	obj2<-wblr(w2test, label="w2test", col="grey")	
	obj2<-wblr.fit(obj2, method.fit="mle-rba",lty="blank")	
	obj2<-wblr.conf(obj2, method.conf="lrb", lty="solid",col="green3", lwd=2)	
			
	layout(matrix(c(1,2),1,2, byrow=TRUE))		
	layout.show(n=2)		
				
	plot_contour(obj2,xlim=c(90,160), ylim=c(1,4))		
	points(contour_pts[c(max_beta,min_beta),], cex=2, col="black")	
				
	plot(obj2, mar=c(5, 4, 4, 2) + 0.1, in.legend.blives=FALSE,	
	main="Likelihood Bounds Defined by Contour Points")
				
	## draw lines from select contour_pts that define the bounds most strongly	
	max_beta_pts<-matrix(c(1, p2y(pweibull(1,contour_pts$Beta[max_beta], contour_pts$Eta[max_beta])),	
		250, p2y(pweibull(250,contour_pts$Beta[max_beta], contour_pts$Eta[max_beta]))), 
		nrow=2,ncol=2, byrow=T)
	lines(max_beta_pts, lty="dotted",lwd=2)	
		
	min_beta_pts<-matrix(c(1, p2y(pweibull(1,contour_pts$Beta[min_beta], contour_pts$Eta[min_beta])),	
		500, p2y(pweibull(500,contour_pts$Beta[min_beta], contour_pts$Eta[min_beta]))), 
		nrow=2,ncol=2, byrow=T)
	lines(min_beta_pts, lty="dotted", lwd=2)	
		
		
	## reset the graphics device for single output		
	par(mfrow=c(1,1))		

treat6mp<-read.csv("https://raw.githubusercontent.com/openrelia/WeibullR.gallery/master/data/compare_6-MP/treat6mp.csv")		
require(WeibullR)		
		
contour_pts<-MLEcontour(mleframe(treat6mp), debias="rba")		
max_beta<-which(contour_pts$Beta==max(contour_pts$Beta))		
min_beta<-which(contour_pts$Beta==min(contour_pts$Beta))		
## as long as default ptDensity of 120 is used for contour generation		
## the parallel beta values will be at rows 31 and 91 of the contour dataframe		
		
obj2<-wblr(treat6mp, col="purple", label="treated6mp")		
obj2<-wblr.fit(obj2, method.fit="mle-rba")		
obj2<-wblr.conf(obj2, method.conf="lrb")		
# for some reason my system had altered the default plot margins		
plot(obj2, mar=c(5, 4, 4, 2) + 0.1, main="Likelihood Bounds Defined by Contour Points")		
		
## draw lines based on select contour_pts that define the bounds most strongly		
max_beta_pts<-matrix(c(1, p2y(pweibull(1,contour_pts$Beta[max_beta], contour_pts$Eta[max_beta])),		
	100, p2y(pweibull(100,contour_pts$Beta[max_beta], contour_pts$Eta[max_beta]))), 	
	nrow=2,ncol=2, byrow=T)	
lines(max_beta_pts, lty="dashed")		
		
min_beta_pts<-matrix(c(1, p2y(pweibull(1,contour_pts$Beta[min_beta], contour_pts$Eta[min_beta])),		
	1000, p2y(pweibull(1000,contour_pts$Beta[min_beta], contour_pts$Eta[min_beta]))), 	
	nrow=2,ncol=2, byrow=T)	
lines(min_beta_pts, lty="dashed")		
		
lb_parallel_pts<-matrix(c(1, p2y(pweibull(1,contour_pts$Beta[31], contour_pts$Eta[31])),		
	100, p2y(pweibull(100,contour_pts$Beta[31], contour_pts$Eta[31]))), 	
	nrow=2,ncol=2, byrow=T)	
lines(lb_parallel_pts, lty="dotted")		
		
ub_parallel_pts<-matrix(c(1, p2y(pweibull(1,contour_pts$Beta[91], contour_pts$Eta[91])),		
	1000, p2y(pweibull(1000,contour_pts$Beta[91], contour_pts$Eta[91]))), 	
	nrow=2,ncol=2, byrow=T)	
lines(ub_parallel_pts, lty="dotted")		

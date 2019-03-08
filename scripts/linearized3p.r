require(WeibullR)
agc<-read.csv("https://raw.githubusercontent.com/openrelia/WeibullR.gallery/master/data/acid_gas_compressor.csv", header=T)$agc
earlyda<-agc[1:10]
midda<-agc[11:131]
endda<-agc[132:200]

earlymodfit<-wblr.fit(wblr(earlyda,c(midda,endda),col="orange", label="Early Life"), dist="weibull3p", modify.by.t0=T)
midmodfit<-wblr.fit(wblr(midda,endda,col="magenta", label="Mid Life"), dist="weibull3p", modify.by.t0=T)
endmodfit<-wblr.fit(wblr(endda, col="blue", label="End Life"), dist="weibull3p", modify.by.t0=T)

plot.wblr(list(earlymodfit,midmodfit,endmodfit),legend.text.size=0.6, xlab= "time - t0",
main="Linear 3p Weibull Fits by t0 Data Adjustment") 
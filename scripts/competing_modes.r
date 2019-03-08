require(WeibullR)
agc<-read.csv("https://raw.githubusercontent.com/openrelia/WeibullR.gallery/master/data/acid_gas_compressor.csv", header=T)$agc
earlyda<-agc[1:10]
midda<-agc[11:131]
endda<-agc[132:200]

earlyfit<-wblr.fit(wblr(fail=earlyda,
susp=c(midda,endda),dist="weibull3p"),
col="orange")
#
midfit<-wblr.fit(wblr(fail=midda,
susp=c(earlyda,endda),dist="weibull3p"),
col="magenta")
#
endfit<-wblr.fit(wblr(fail=endda,
susp=c(earlyda,midda),dist="weibull3p"),
col="blue") 

plot.wblr(list(earlyfit,midfit,endfit), legend.text.size=0.5,
main="Division of Life Data Using 3p Weibull") 
require(WeibullR)
agc<-read.csv("https://raw.githubusercontent.com/openrelia/WeibullR.gallery/master/data/acid_gas_compressor.csv", header=T)$agc
dafit<-wblr(agc, label="acid gas compressor")
dafit<-wblr.fit(dafit,col="red")
plot(dafit, main="Bathtub Life Data") 
abline(v=107, col="orange", lty=5, lwd=2)
abline(v=1750, col="orange", lty=5, lwd=2) 

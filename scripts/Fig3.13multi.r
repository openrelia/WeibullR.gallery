require(WeibullR)
F3.13da<-read.csv("https://raw.githubusercontent.com/openrelia/WeibullR.gallery/master/data/Figure3.13.csv", header=T)$F3.13da
F3.13ln2 <- wblr.fit(wblr(F3.13da,label="Figure3.13"),
dist="lognormal",col="magenta")
F3.13w2<-wblr.fit(wblr(F3.13da), col="blue")
F3.13w3<-wblr.fit(wblr(F3.13da, dist="weibull3p"), col="red")
plot.wblr(list(F3.13w2,F3.13ln2,F3.13w3), main=("Multi-distribution Plot"))
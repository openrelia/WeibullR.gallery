require(WeibullR)
F3.13da<-read.csv("https://raw.githubusercontent.com/openrelia/WeibullR.gallery/master/data/Figure3.13.csv", header=T)$F3.13da
F3.13ln2 <- wblr.fit(wblr(F3.13da,label="Figure3.13"),
dist="lognormal",col="magenta")
plot(F3.13ln2,canvas="lognormal",
main="Lognormal Plot") 
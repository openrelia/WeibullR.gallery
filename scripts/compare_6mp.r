require(WeibullR)

control<-read.csv("https://raw.githubusercontent.com/openrelia/WeibullR.gallery/master/data/compare_6-MP/control.csv")
treat6mp<-read.csv("https://raw.githubusercontent.com/openrelia/WeibullR.gallery/master/data/compare_6-MP/treat6mp.csv")

obj1<-wblr(control, col="orange")
obj1<-wblr.fit(obj1, method.fit="mle-rba")
obj1<-wblr.conf(obj1, method.conf="lrb")

obj2<-wblr(treat6mp, col="purple")
obj2<-wblr.fit(obj2, method.fit="mle-rba")
obj2<-wblr.conf(obj2, method.conf="lrb")

contour.wblr(list(obj1,obj2))
mtext("Treatment with Drug 6-MP Improved Time in Remission\n\n")
text(10,1.9,"Control")
text(45,1.9,"6-MP Treated")


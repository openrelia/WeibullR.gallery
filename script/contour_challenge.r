daf<-read.csv("https://raw.githubusercontent.com/openrelia/WeibullR.gallery/master/data/contour_challenge/daTEST.csv", header=FALSE)
das<-read.csv("https://raw.githubusercontent.com/openrelia/WeibullR.gallery/master/data/contour_challenge/dasuspendedTEST.csv", header=FALSE)

fdf<-as.data.frame(table(daf[,1]))
ft<-as.numeric(levels(fdf[,1]))
fq<-fdf[,2]
sdf<-as.data.frame(table(das[,1]))
st<-as.numeric(levels(sdf[,1]))
sq<-sdf[,2]
fail_edata<-data.frame(time=ft, event=rep(1,length(ft)), qty=fq)
sus_edata<-data.frame(time=st, event=rep(0, length(st)), qty=sq)
teq_frame<-rbind(fail_edata, sus_edata)
teq_frame

require(WeibullR)
contour(wblr(teq_frame))
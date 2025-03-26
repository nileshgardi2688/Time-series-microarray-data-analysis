#############%%%%%%%%%%%%%%%%%%%%################%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#Multiple gene plots for comaparing other bandwidth pattern with our optimum bandwidth.
data<-as.matrix(read.table("highly variable genes.txt",header=T))
total_data<-as.matrix(data[,-1])
highestgenenames<-as.matrix(data[,1])
tiff("1.tiff")
par(mfrow=c(2,2),xpd=TRUE)
for(j in 5:8)
{
time<-0:12
y=as.numeric(total_data[j,])

plot(time,y,xlab="time",ylab="intensity value",main=highestgenenames[j,])
lines(time,y,col="black",lwd=1)
#fit=locfit(y~lp(time,h=2,deg=2))
#lines(time,predict(fit,time),col="green",lwd=1)
fit=locfit(y~lp(time,h=3,deg=2))
lines(time,predict(fit,time),col="blue",lwd=1)
fit=locfit(y~lp(time,h=3.84,deg=2))
lines(time,predict(fit,time),col="red",lwd=2)
fit=locfit(y~lp(time,h=4,deg=2))
lines(time,predict(fit,time),col="green",lwd=1)
#fit=locfit(y~lp(time,h=5,deg=2))
#lines(time,predict(fit,time),col="violetred3",lwd=1)
legend(x = "bottomright",inset=0,cex=1,c("h=3","h=3.84","h=4"),fill=c("blue","red","green"))
}
dev.off()
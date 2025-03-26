data<-as.matrix(read.table("highly variable genes.txt",header=T))
total_data<-as.matrix(data[,-1])
highestgenenames<-as.matrix(data[,1])
for (i in 1:50){
    f<-paste("M",highestgenenames[i,],sep="_")
    file<-paste(f,"png",sep=".")
    png(file)
    par(mfrow=c(1,1),xpd=TRUE)
    #time = c(0,0.5,0.75,1.17,1.67,2.5,3.83,5.67,8.5)
    index<-1:9
    y=as.numeric(total_data[i,])
    
    plot(index,y,xlab="time",type="p",ylab="intensity value",main=highestgenenames[i,],axes=F,lwd=2)
    axis(1, at=seq(1,9, by=1), labels=seq(1,9, by=1))
    axis(2)
    fit=locfit(y~lp(index,h=1.2105263,deg=2,scale=0))
    lines(index,predict(fit,index),col="black",lwd=2)
    legend(x = "bottomright",inset=0,cex=1,c("Optimal_h=1.210"),fill=c("black"))
    dev.off()
}
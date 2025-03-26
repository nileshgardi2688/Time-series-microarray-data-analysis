########## Plotting file name with gene title
MKT1<-read.table("MKT1.txt",header=T)
S288c<-read.table("S288c.txt",header=T)
#TAO3<-read.table("TAO3.txt",header=T)
#Y3141<-read.table("Y3141.txt",header=T)

S<-S288c[,-1]
M<-MKT1[,-1]
T<-TAO3[,-1]
Y<-Y3141[,-1]
time<-1:9

genes<-as.matrix(S288c[,1])

for(i in 1:nrow(S)) 
{
#df<-paste(genes[i,],i,sep="_")
final<-paste(genes[i,],"jpeg",sep=".")
jpeg(final)
plot(time,S[i,],ylim=c(min(S[i,],M[i,]),max(S[i,],M[i,])),xlab="Time in hrs",ylab="Intensity",main=genes[i,1])
lines(time,S[i,],col="red",lwd=2)
lines(time,M[i,],col="green",lwd=2)
#points(time,M[i,],col="black")
dev.off()
}

par(mfrow=c(4,4))
for(i in 1:nrow(U))
{
final<-paste(genes[i,],"jpeg",sep=".")
jpeg(final)

plot(as.numeric(U[i,]),axes=F,xlab="",ylab="log2(TPM+1)",ylim=c(min(U[i,],S[i,],PS1[i,],PS2[,i]),max(S[i,],M[i,],S1[i,],PS2[,i])),main=genes[i,1])
axis(2)
samples<-c("C","RE","R")
axis(1, at=seq_along(U[i,]),labels=as.character(samples), las=2)
box()

plot(as.numeric(S[i,]),axes=F,xlab="",ylab="log2(TPM+1)",ylim=c(min(U[i,],S[i,],PS1[i,],PS2[,i]),max(S[i,],M[i,],S1[i,],PS2[,i])),main=genes[i,1])
axis(2)
samples<-c("C","RE","R")
axis(1, at=seq_along(S[i,]),labels=as.character(samples), las=2)
box()

plot(as.numeric(PS1[i,]),axes=F,xlab="",ylab="log2(TPM+1)",ylim=c(min(U[i,],S[i,],PS1[i,],PS2[,i]),max(S[i,],M[i,],S1[i,],PS2[,i])),main=genes[i,1])
axis(2)
samples<-c("C","RE","R")
axis(1, at=seq_along(PS1[i,]),labels=as.character(samples), las=2)
box()

plot(as.numeric(PS2[i,]),axes=F,xlab="",ylab="log2(TPM+1)",ylim=c(min(U[i,],S[i,],PS1[i,],PS2[,i]),max(S[i,],M[i,],S1[i,],PS2[,i])),main=genes[i,1])
axis(2)
samples<-c("C","RE","R")
axis(1, at=seq_along(PS2[i,]),labels=as.character(samples), las=2)
box()
dev.off()

}



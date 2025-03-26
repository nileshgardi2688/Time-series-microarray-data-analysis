highest<-as.matrix(read.table("S288c original file.txt",header=T))
#highest<-as.matrix(read.table("MKT1 original file.txt",header=T))
#highest<-as.matrix(read.table("TAO3 original file.txt",header=T))
#highest<-as.matrix(read.table("Y3141 original file.txt",header=T))

highestgene<-as.matrix(highest[,1])
highestvariance_nocuts<-as.matrix(read.table("S288c original file.txt",header=T,row.names=1))
#highestvariance_nocuts<-as.matrix(read.table("MKT1 original file.txt",header=T,row.names=1))
#highestvariance_nocuts<-as.matrix(read.table("TAO3 original file.txt",header=T,row.names=1))
#highestvariance_nocuts<-as.matrix(read.table("Y3141 original file.txt",header=T,row.names=1))
fitvalues = matrix(nrow = nrow(highestvariance_nocuts), ncol = ncol(highestvariance_nocuts))

for(i in 1:nrow(highestvariance_nocuts)){
y = highestvariance_nocuts[i,1:ncol(highestvariance_nocuts)]
index=1:9
#fit = locfit(y~lp(index,h=1.315789,deg=2,scale=0))# for MKT1
#fit = locfit(y~lp(index,h=1.315789,deg=2,scale=0))# for TAO3
#fit = locfit(y~lp(index,h=1.315789,deg=2,scale=0))# for Y3141
fit = locfit(y~lp(index,h=1.210526,deg=2,scale=0))# for S288c

fitvalues[i,] = predict(fit,index);
}

fitvalues<-data.frame(fitvalues)
fitvalues<-cbind(highestgene,fitvalues)
write.table(fitvalues,"S288c_LOCFIT data.txt",sep="\t",row.names=FALSE)
#write.table(fitvalues,"MKT1_LOCFIT data.txt",sep="\t",row.names=FALSE)
#write.table(fitvalues,"Y3141_LOCFIT data.txt",sep="\t",row.names=FALSE)
#write.table(fitvalues,"TAO3_LOCFIT data.txt",sep="\t",row.names=FALSE)
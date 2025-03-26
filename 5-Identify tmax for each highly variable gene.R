fitvalues<-read.table("MKT1 row centred data.txt",header=T,row.names=1)
#fitvalues<-read.table("S288c row centred data.txt",header=T,row.names=1)
#fitvalues<-read.table("TAO3 row centred data.txt",header=T,row.names=1)
#fitvalues<-read.table("Y3141 row centred data.txt",header=T,row.names=1)
maximum_time_points = c(nrow = nrow(fitvalues));
for(i in 1:nrow(fitvalues))
{
y<-fitvalues[i,]
maximum_time_points[i]<-which.max(y)
#maximum_time_points[i]<-which.min(y)
}
write.table(maximum_time_points,"Mtmax.txt",sep="\t")
#write.table(maximum_time_points,"Stmax.txt",sep="\t")
#write.table(maximum_time_points,"Ttmax.txt",sep="\t")
#write.table(maximum_time_points,"Ytmax.txt",sep="\t")
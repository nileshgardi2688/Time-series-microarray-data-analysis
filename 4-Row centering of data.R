#row-center the data
data<-as.matrix(read.table("LOCFIT data.txt",header=T,row.names=1))
for(i in 1:nrow(data)){
    average = median(as.numeric(data[i,]));
    for(j in 1:ncol(data)){
        data[i,j] = as.numeric(as.numeric(data[i,j]) - average);
    }
}
write.table(data,"row centered data.txt",sep="\t")

zmr<-list.files(path=getwd(),include.dirs = F,pattern="txt$")
for(m in 1:length(zmr))
{
spl<-paste(zmr[m],"row_centered.txt",sep="_")
data<-as.matrix(read.table(zmr[m],header=T,row.names=1))
for(i in 1:nrow(data))
{
    average = median(as.numeric(data[i,]));
    for(j in 1:ncol(data))
	{
        data[i,j] = as.numeric(as.numeric(data[i,j]) - average);
    }
}
write.table(data,spl,sep="\t")
}
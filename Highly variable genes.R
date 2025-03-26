#%%%%%reduce the list of genes to those with standard deviation above 1
#These steps excluded those genes which had very low varience "Data.txt" file contains
#total appr. 7000 genes and 9 time points data (from 0 to 8.5 hrs)

data<-read.table("S288c_LOCFIT data.txt",header=T)    
highestvariance2<-as.matrix(data[,-1])
highestgenenames<-as.matrix(data[,1])

for(i in nrow(highestvariance2):1){
	if(sd(highestvariance2[i,]) < 1)
	{
	highestvariance2 = highestvariance2[-i,];
	highestgenenames = highestgenenames[-i]
	}
}
highestvariance2<-data.frame(highestvariance2)
collate_data<-cbind(highestgenenames,highestvariance2)
write.table(collate_data,"ave/highly variable genes1.txt",sep="\t",row.names=FALSE)
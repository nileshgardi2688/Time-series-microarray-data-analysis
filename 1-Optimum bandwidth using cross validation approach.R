#########Identify optimum bandwidth using cross validation approach

#%%%%%reduce the list of genes to those with standard deviation above 1
#These steps excluded those genes which had very low varience "Data.txt" file contains
#total appr. 7000 genes and 9 time points data (from 0 to 8.5 hrs)

data<-read.table("S288c_original file.txt",header=T) 
#data<-read.table("MKT1_original file.txt",header=T) 
#data<-read.table("TAO3_original file.txt",header=T)
#data<-read.table("Y3141_original file.txt",header=T)
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
write.table(collate_data,"highly variable genes.txt",sep="\t",row.names=FALSE)


#############%%%%%%%%%%%%%%%%%%%%################%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#Initially start with broad range of bandwidth as 1 to 20

options(warn=1)
highly_var<-as.matrix(read.table("highly variable genes.txt",header=T,row.names=1))
total_data<-as.matrix(highly_var[1:100,])
error_mat=matrix(nrow = 20, ncol = ncol(total_data)+1,dimnames=list(c(seq(2.5,20.5,length.out=20))))
#time=c(0,0.5,0.75,1.17,1.67,2.5,3.83,5.67,8.5)
bandwidth<-seq(1,20,length.out=20)
ss=matrix(nrow = nrow(total_data),ncol=2)
index=1:9

for(k in 1:nrow(total_data))      #for a single gene
{
var<-0
     for(h in seq(1,20,length.out=20))         #for bandwidth
     {
	var<-var+1
	one_gene=as.numeric(total_data[k,])
	for(j in 1:length(one_gene))          #for cross-validation
	{
		y=as.numeric(total_data[k,-j])
		selected_fit<-paste("fit",j,sep="_")
		selected_fit=locfit(y~lp(index[-j],h=h,deg=2,scale=0))
		
		error_mat[var,j]<-((predict(selected_fit,index[j])-one_gene[j]))^2	
		
	}
	error_mat[var,(ncol(total_data)+1)]<-sum(error_mat[var,-(ncol(total_data)+1)])
	
     }

ss<-bandwidth[which.min(error_mat[,(ncol(total_data)+1)])]
write.table(error_mat,"error_file_var.txt",sep="\t",append=TRUE,row.names=FALSE)
write.table(ss,"bandwidth.txt",sep="\t",append=TRUE,col.names=F)
}



#############%%%%%%%%%%%%%%%%%%%%################%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
#loop withing specific bandwidths or narrow range (nr)....
#Here u get exact optimum bandwidth. By using that value in below function 
#you convert all your data into locfit data and used for further analysis.

nr_highly_var<-as.matrix(read.table("highly variable genes.txt",header=T,row.names=1))
nr_total_data<-nr_highly_var[1:100,]
nr_error_mat=matrix(nrow = 20, ncol = ncol(nr_total_data)+1,dimnames=list(c(seq(1,20,length.out=20))))
nr_time=0:(ncol(nr_total_data)-1)
for(k in 1:nrow(nr_total_data))      #for a single gene
{
var<-0
     for(h in seq(2,4,length.out=20))         #for bandwidth. Here you put minima of 1st loops.
     {
     var<-var+1
     nr_one_gene=as.numeric(nr_total_data[k,])
	for(j in 1:length(nr_one_gene))          #for cross-validation
	{
		
		y=as.numeric(nr_total_data[k,-j])
		fit=locfit(y~lp(nr_time[-j],h=h,deg=2))

		if(var < 21)
		{
		nr_error_mat[var,j]<-((predict(fit,j)-nr_one_gene[j]))^2	
		}
		else{break;}
	}
	nr_error_mat[var,(ncol(nr_total_data)+1)]<-sum(nr_error_mat[var,-(ncol(nr_total_data)+1)])
     }
write.table(nr_error_mat,"nr_error_file.txt",sep="\t",append=TRUE,row.names=FALSE)
}
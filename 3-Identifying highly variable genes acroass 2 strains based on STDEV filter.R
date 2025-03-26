MKT1<-read.table("MKT1_LOCFIT data.txt",header=T) 
S288c<-read.table("S288c_LOCFIT data.txt",header=T) 
#TAO3<-read.table("S288c_LOCFIT data.txt",header=T) 
#Y3141<-read.table("Y3141_LOCFIT data.txt",header=T) 

M_highestvariance2<-as.matrix(MKT1[,-1])
M_highestgenenames<-as.matrix(MKT1[,1])
S_highestvariance2<-as.matrix(S288c[,-1])
S_highestgenenames<-as.matrix(S288c[,1])
#T_highestvariance2<-as.matrix(TAO3[,-1])
#T_highestgenenames<-as.matrix(TAO3[,1])
#Y_highestvariance2<-as.matrix(Y3141[,-1])
#Y_highestgenenames<-as.matrix(Y3141[,1])

for(i in nrow(M_highestvariance2):1){
	if(sd(M_highestvariance2[i,]) < 0.5 && sd(S_highestvariance2[i,]) < 0.5) #&& sd(T_highestvariance2[i,]) < 0.5 && sd(Y_highestvariance2[i,]) < 0.5
	{
	M_highestvariance2 = M_highestvariance2[-i,];
	M_highestgenenames = M_highestgenenames[-i]
	S_highestvariance2 = S_highestvariance2[-i,];
	S_highestgenenames = S_highestgenenames[-i]
	#T_highestvariance2 = M_highestvariance2[-i,];
	#T_highestgenenames = M_highestgenenames[-i]
	#Y_highestvariance2 = M_highestvariance2[-i,];
	#Y_highestgenenames = M_highestgenenames[-i]

	}
}
M_highestvariance2<-data.frame(M_highestvariance2)
S_highestvariance2<-data.frame(S_highestvariance2)
M_collate_data<-cbind(M_highestgenenames,M_highestvariance2)
S_collate_data<-cbind(S_highestgenenames,S_highestvariance2)
#T_highestvariance2<-data.frame(M_highestvariance2)
#Y_highestvariance2<-data.frame(S_highestvariance2)
#T_highestvariance2<-data.frame(M_highestvariance2)
#Y_highestvariance2<-data.frame(S_highestvariance2)


write.table(M_collate_data,"MKT1 highly variable genes.txt",sep="\t",row.names=FALSE)
write.table(S_collate_data,"S288c highly variable genes.txt",sep="\t",row.names=FALSE)
#write.table(M_collate_data,"TAO3 highly variable genes.txt",sep="\t",row.names=FALSE)
#write.table(S_collate_data,"Y3141 highly variable genes.txt",sep="\t",row.names=FALSE)
library(LSD)
x<-read.table("tmax value.txt",header=T,row.names=1)
heatscatter(x[,1], x[,2], pch = 19, cexplot = 0.6, ncol = 50, grid = 200, colpal = "heat", xlim = NULL, ylim=NULL,xlab="MKT1 tmax",ylab="S288c tmax")
plot y=x (abline(0,1))
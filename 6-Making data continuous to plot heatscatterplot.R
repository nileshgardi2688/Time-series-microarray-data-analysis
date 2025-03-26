highestvariance_nocuts<-as.matrix(read.table("MKT1 original file.txt",header=T,row.names=1))
#highestvariance_nocuts<-as.matrix(read.table("S288c original file.txt",header=T,row.names=1))
#highestvariance_nocuts<-as.matrix(read.table("TAO3 original file.txt",header=T,row.names=1))
#highestvariance_nocuts<-as.matrix(read.table("Y3141 original file.txt",header=T,row.names=1))
maximum_time_points = c(nrow = nrow(highestvariance_nocuts));

for(i in 1:nrow(highestvariance_nocuts)){
y = highestvariance_nocuts[i,]
index=1:9
#fit = locfit(y~lp(time))
fit = locfit(y~lp(index,h=1.315789,deg=2,scale=0))
time_hires = seq(0,12,0.1); #plot(time,y);line(time_hires,predict(fit,time_hires));
tmax = time_hires[which.max(predict(fit, time_hires))];
maximum_time_points[i] = tmax;
}

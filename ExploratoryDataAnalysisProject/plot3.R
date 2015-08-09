##ONLY RUN IF IT HASN'T BEEN RUN EARLIER
'
read.table("household_power_consumption.txt",header=TRUE,sep=";",strip.white = TRUE,stringsAsFactors=FALSE)->projectdata
as.Date(projectdata[,1],"%d/%m/%Y")->projectdata[,1]
subset(projectdata,Date=="2007-07-01"|Date=="2007-07-02")->subsetdata
rownames(subsetdata)<-NULL
within(subsetdata[,1:2], { timestamp=format(as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S") })[,3]->subsetdata[,2]
as.POSIXct(subsetdata[,2],format="%d/%m/%Y %H:%M:%S")->subsetdata[,2]
lapply(subsetdata[3:8],as.numeric)->subsetdata[3:8]
'

png(file="plot3.png")
plot(subsetdata[,2],subsetdata[,7],type="l",col="black")
xlab("")
ylab("Energy Sub Metering")
lines(subsetdata[,2],subsetdata[,8],type="l",col="red")
lines(subsetdata[,2],subsetdata[,9],type="l",col="blue")
legend("topright",pch=1,col=c("black","red","blue"),legend=c("Sub_metering1","Sub_metering2","Sub_metering3"))
dev.off()
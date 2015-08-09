read.table("household_power_consumption.txt",header=TRUE,sep=";",strip.white = TRUE,stringsAsFactors=FALSE)->projectdata
as.Date(projectdata[,1],"%d/%m/%Y")->projectdata[,1]
subset(projectdata,Date=="2007-07-01"|Date=="2007-07-02")->subsetdata
rownames(subsetdata)<-NULL

within(subsetdata[,1:2], { timestamp=format(as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S") })[,3]->subsetdata[,2]
as.POSIXct(subsetdata[,2],format="%d/%m/%Y %H:%M:%S")->subsetdata[,2]

lapply(subsetdata[3:8],as.numeric)->subsetdata[3:8]

hist(subsetdata[,3],xlab = "Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power (kilowatts)",col = "red")
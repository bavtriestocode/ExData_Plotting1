## Reading and cleaning data
data<-read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?")
datas<-subset(data,Date=="1/2/2007"|Date=="2/2/2007")
datetime <- strptime(paste(datas$Date, datas$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Creating the plot
plot(datetime, datas$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
points(datetime, datas$Sub_metering_2, type="l",col="red")
points(datetime, datas$Sub_metering_3, type="l",col="blue")
legend("topright",lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.5)

#Exporting the plot
dev.copy(png,file="plot3.png")
dev.off()
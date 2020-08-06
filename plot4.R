## Reading and cleaning data
data<-read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?")
datas<-subset(data,Date=="1/2/2007"|Date=="2/2/2007")
datetime <- strptime(paste(datas$Date, datas$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Initialising the plot array
par(mfcol=c(2,2),mar=c(4,4,2,1),oma=c(0,0,2,0))

#Creating the first plot
plot(datetime, datas$Global_active_power, type="l", xlab="", ylab="Global Active Power")

#Creating the second plot
plot(datetime, datas$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
points(datetime, datas$Sub_metering_2, type="l",col="red")
points(datetime, datas$Sub_metering_3, type="l",col="blue")
legend("topright",lwd=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.55)

#Creating the third plot
plot(datetime, datas$Voltage, type="l", xlab="datetime", ylab="Voltage")

#Creating the fourth plot
plot(datetime, datas$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#Exporting the plot
dev.copy(png,file="plot4.png")
dev.off()
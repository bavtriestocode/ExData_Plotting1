## Reading and cleaning data
data<-read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?")
datas<-subset(data,Date=="1/2/2007"|Date=="2/2/2007")
datetime <- strptime(paste(datas$Date, datas$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Creating the plot
plot(datetime, datas$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

#Exporting the plot
dev.copy(png,file="plot2.png")
dev.off()
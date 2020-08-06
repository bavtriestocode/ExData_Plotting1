## Reading and cleaning data
data<-read.table("household_power_consumption.txt",sep = ";",header = TRUE,na.strings = "?")
datas<-subset(data,Date=="1/2/2007"|Date=="2/2/2007")

#Creating the plot
hist(datas$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")

#Exporting the plot
dev.copy(png,file="plot1.png")
dev.off()
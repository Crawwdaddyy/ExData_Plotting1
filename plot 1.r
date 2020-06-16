#plot 1
rm(list=ls()) #removes variables from workspace

#initiate graphics device
png(filename = "plot 1.png",width = 480, height = 480)

#read a subset data
powerconsumption <- read.table("household_power_consumption.txt",skip = 1,sep = ";")
names(powerconsumption) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
powersubset <- subset(powerconsumption,powerconsumption$Date=="1/2/2007" | powerconsumption$Date =="2/2/2007")

#plot data
hist(as.numeric(as.character(powersubset$Global_active_power)), col="red", main="Global Active Power", xlab="Global Active Power(kilowatts)")

#close graphics device
dev.off()

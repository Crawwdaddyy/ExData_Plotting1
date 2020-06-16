#plot 2
rm(list=ls()) #removes variables from workspace

#initiate graphics device
png(filename = "plot 2.png",width = 480, height = 480)

#read and subset data
powerconsumption <- read.table("household_power_consumption.txt",skip = 1,sep = ";")
names(powerconsumption) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
powersubset <- subset(powerconsumption,powerconsumption$Date=="1/2/2007" | powerconsumption$Date =="2/2/2007")

#format date/time
powersubset$Date <- as.Date(powersubset$Date, format="%d/%m/%Y")
powersubset$Time <- strptime(powersubset$Time, format="%H:%M:%S")
powersubset[1:1440,"Time"] <- format(powersubset[1:1440,"Time"],"2007-02-01 %H:%M:%S")
powersubset[1441:2880,"Time"] <- format(powersubset[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#plot data
plot(powersubset$Time,as.numeric(as.character(powersubset$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)") 

#close graphics device
dev.off()

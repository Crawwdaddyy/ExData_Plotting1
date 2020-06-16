#plot 4
rm(list=ls()) 

#initiate graphics device
png(filename = "plot 1.png",width = 480, height = 480)

#read and subset data
powerconsumption <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(powerconsumption) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
powersubset <- subset(powerconsumption,powerconsumption$Date=="1/2/2007" | powerconsumption$Date =="2/2/2007")

#format date/time
powersubset$Date <- as.Date(powersubset$Date, format="%d/%m/%Y")
powersubset$Time <- strptime(powersubset$Time, format="%H:%M:%S")
powersubset[1:1440,"Time"] <- format(powersubset[1:1440,"Time"],"2007-02-01 %H:%M:%S")
powersubset[1441:2880,"Time"] <- format(powersubset[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#initiate the plot
par(mfrow=c(2,2))

#plot data
with(powersubset,{
  plot(powersubset$Time,as.numeric(as.character(powersubset$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(powersubset$Time,as.numeric(as.character(powersubset$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(powersubset$Time,powersubset$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(powersubset,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(powersubset,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(powersubset,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(powersubset$Time,as.numeric(as.character(powersubset$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})


#close graphics device
dev.off()


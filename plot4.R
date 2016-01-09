this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

data <- read.csv("household_power_consumption.txt", sep=";")
data$Datetime <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

png(filename="plot4.png", width=480, height=480, units="px")
par(mfrow=c(2,2))

plot(data$Datetime, data$Global_active_power, ylab="Global Active Power", xlab="", type="l")

plot(data$Datetime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(data$Datetime, data$Sub_metering_1, type='n', ylab="Energy sub metering", xlab="")
lines(data$Datetime, data$Sub_metering_1, col="black")
lines(data$Datetime, data$Sub_metering_2, col="red")
lines(data$Datetime, data$Sub_metering_3, col="blue")
legend(x="topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1, bty="n")

plot(data$Datetime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
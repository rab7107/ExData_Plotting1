this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

data <- read.csv("household_power_consumption.txt", sep=";")
data$Datetime <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

png(filename="plot3.png", width=480, height=480, units="px")
plot(data$Datetime, data$Sub_metering_1, type='n', ylab="Energy sub metering", xlab="")
lines(data$Datetime, data$Sub_metering_1, col="black")
lines(data$Datetime, data$Sub_metering_2, col="red")
lines(data$Datetime, data$Sub_metering_3, col="blue")
legend(x="topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1)
dev.off()
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

data <- read.csv("household_power_consumption.txt", sep=";")
data$Datetime <- strptime(paste(data$Date, data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

png(filename="plot2.png", width=480, height=480, units="px")
plot(data$Datetime, data$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
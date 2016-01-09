this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)
    
data <- read.csv("household_power_consumption.txt", sep=";")

png(filename="plot1.png", width=480, height=480, units="px")
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")
dev.off()
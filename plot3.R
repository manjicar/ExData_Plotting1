#Load file into environment
electric <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Select two days only
library(dplyr)
electric2 <- filter(electric, Date == "1/2/2007" | Date == "2/2/2007")

#Create new variable with Date and Time together
electric2$DateTime <- paste(electric2$Date, electric2$Time)

#Convert new variable to date/time class
electric2$DateTime2 <- strptime(electric2$DateTime, "%d/%m/%Y %H:%M:%S")

#Create plot3
png(file = "plot3.png", width = 480, height = 480)
with(electric2, plot(DateTime2, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
with(electric2, lines(DateTime2, Sub_metering_2, col = "red"))
with(electric2, lines(DateTime2, Sub_metering_3, col = "blue"))
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()


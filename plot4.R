#Load file into environment
electric <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Select two days only
library(dplyr)
electric2 <- filter(electric, Date == "1/2/2007" | Date == "2/2/2007")

#Create new variable with Date and Time together
electric2$DateTime <- paste(electric2$Date, electric2$Time)

#Convert new variable to date/time class
electric2$DateTime2 <- strptime(electric2$DateTime, "%d/%m/%Y %H:%M:%S")

#Create plot4
png(file = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
with(electric2, plot(DateTime2, Global_active_power, type = "l",
                     ylab = "Global Active Power",
                     xlab = ""))
with(electric2, plot(DateTime2, Voltage, type = "l",
                     ylab = "Voltage",
                     xlab = "datetime"))
with(electric2, plot(DateTime2, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = ""))
with(electric2, lines(DateTime2, Sub_metering_2, col = "red"))
with(electric2, lines(DateTime2, Sub_metering_3, col = "blue"))
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
with(electric2, plot(DateTime2, Global_reactive_power, type = "l", xlab = "datetime"))
dev.off()
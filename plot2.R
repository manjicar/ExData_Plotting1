#Load file into environment
electric <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Select two days only
library(dplyr)
electric2 <- filter(electric, Date == "1/2/2007" | Date == "2/2/2007")

#Create new variable with Date and Time together
electric2$DateTime <- paste(electric2$Date, electric2$Time)

#Convert new variable to date/time class
electric2$DateTime2 <- strptime(electric2$DateTime, "%d/%m/%Y %H:%M:%S")

#Create plot2
png(file = "plot2.png", width = 480, height = 480)
with(electric2, plot(DateTime2, Global_active_power, type = "l",
                     ylab = "Global Active Power (kilowatts)",
                     xlab = ""))
dev.off()



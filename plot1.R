#Load file into environment
electric <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

#Select two days only
library(dplyr)
electric2 <- filter(electric, Date == "1/2/2007" | Date == "2/2/2007")

#Create plot1
png(file = "plot1.png", width = 480, height = 480)
with(electric2, hist(Global_active_power, col = "red", main = "Global Active Power",
                     xlab = "Global Active Power (kilowatts)"))
dev.off()
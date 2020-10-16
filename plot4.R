# This is de code for plot number 3

options(scipen = 999)
library(lubridate)

# Loading the file into R, getting rid of NA's and format dates

data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", 
                   colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

data <- data[!is.na(data$Global_active_power),]

data$Date <- dmy(data$Date)

data$Time <- hms(data$Time)

data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

# Creating a new variable (Date_time) to join the day and time format for each date

data$Date_time <- data$Date + data$Time

#  Creating plots and exporting them to a PNG file

par(mfrow = c(2,2), mar = c(4,4,2,4))

with(data, plot(Date_time, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power", cex.lab = 0.7, cex.axis = 0.7))

with(data, plot(Date_time, Voltage, type = "l", xlab = "datetime", ylab = "Voltage", cex.lab = 0.7, cex.axis = 0.7))

with(data, plot(Date_time, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", cex.lab = 0.7, cex.axis = 0.7))
with(data, lines(Date_time, Sub_metering_2, col = "red"))
with(data, lines(Date_time, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty = 1, 
       col = c("black", "red", "blue"), bty ="n", cex = 0.7)


with(data, plot(Date_time, Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power", cex.lab = 0.7, cex.axis = 0.7))

dev.cLopy(png, file = "plot4.png",width = 480, height = 480)

dev.off()

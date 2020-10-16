# This is de code for plot number 1

options(scipen = 999)
library(lubridate)

# Loading the file into R, getting rid of NA's and format dates

data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", 
                   colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))

data <- data[!is.na(data$Global_active_power),]

data$Date <- dmy(data$Date)

data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")


#  Creating the Histogram and expoting it to a PNG file

 with(data, hist(Global_active_power, col = "red", main= "Global Active Power", xlab = "Global Active Power (kilowatts)"))

 dev.copy(png, file = "plot1.png",width = 480, height = 480)
 
 dev.off()

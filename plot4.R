#Coursera Explorartory Data Analysis
#Peer-graded Assignment: Course Project 1
#plot4

library(tidyverse)

#Download the zipped dataset to the working directory
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "powerdata.zip")

#Read the zipped data, properly format the 'Date' column as a date,
#then filter the datset to keep only the data
#from 2007-02-01 and 2007-02-02

data <- (read_delim("powerdata.zip", col_names = TRUE, delim = ";", na = "?",
                    col_types = cols(Date = col_date(format = "%d/%m/%Y"))) %>%
                 filter(Date == "2007-02-01" | Date == "2007-02-02"))

#Merge Date and Time into one variable called datetime
data$datetime <- as.POSIXct(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

#Create plot 4

png(filename = "plot4.png")

par(mfrow=c(2,2))

plot(data$datetime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = NA)

plot(data$datetime, data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

plot(data$datetime, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = NA)
lines(data$datetime, data$Sub_metering_2, type = "l", col = "red")
lines(data$datetime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

plot(data$datetime, data$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()
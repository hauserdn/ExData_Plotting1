#Coursera Explorartory Data Analysis
#Peer-graded Assignment: Course Project 1
#plot1


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

#Create plot 1
png(filename = "plot1.png")
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
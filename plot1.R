## solution for the assigment W1 month 4
## Javier Rios

## libraries

library(plyr)
## setting the wd
setwd("~/Desktop/R/COURSERA/CLASSES/Month 4/Week 1/Final Assigment")

#downloading the file
#url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file()

## reading and filtering the data
# we only need: 2007/02/01 and 2007/02/02

dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header = TRUE, sep=";", stringsAsFactors = FALSE, 
                   dec=".", na.strings = "?")
small_data <- subset(data, data$Date %in% c("1/2/2007","2/2/2007"))

small_data$Global_active_power <- as.numeric(small_data$Global_active_power)

# Creating the PNG file 
png("plot1.png",
    width = 480,
    height = 480,
    units = "px")
hist(small_data$Global_active_power, col = "red", xlab = "Global Active Power"
          , main = "Global Active Power (killowats)")
dev.off()

## solution for the assigment W1 month 4
## Javier Rios

## libraries

library(plyr)
## setting the wd
setwd("~/Desktop/R/COURSERA/CLASSES/Month 4/Week 1/Final Assigment")

## reading and filtering the data
# we only need: 2007/02/01 and 2007/02/02

dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header = TRUE, sep=";", stringsAsFactors = FALSE, 
                   dec=".", na.strings = "?")

small_data <- subset(data, data$Date %in% c("1/2/2007","2/2/2007"))

small_data$Global_active_power <- as.numeric(small_data$Global_active_power)

## plot 2

# adding a new column with different units Global Active Power in KW
str(small_data)
data_frame_q2 <- small_data

aux <- as.POSIXct((paste(data_frame_q2$Date, data_frame_q2$Time)), format = "%d/%m/%Y %H:%M:%S")

data_frame_q2$DateTime <- aux


# Creating the PNG file 
png("plot2.png",
    width = 480,
    height = 480,
    units = "px")
# this plot is the solution for the PLOT 2
plot(data_frame_q2$DateTime, small_data$Global_active_power, type = "l", xlab = "",
     ylab = "Global Active Power (kilowatts)")
dev.off()

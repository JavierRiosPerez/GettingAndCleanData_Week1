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
class(data)
head(data)
small_data <- subset(data, data$Date %in% c("1/2/2007","2/2/2007"))

small_data$Global_active_power <- as.numeric(small_data$Global_active_power)

data_frame_q2 <- small_data

aux <- as.POSIXct((paste(data_frame_q2$Date, data_frame_q2$Time)), format = "%d/%m/%Y %H:%M:%S")

data_frame_q2$DateTime <- aux

# plot 4

png("plot4.png",
    width = 480,
    height = 480,
    units = "px")
par(mfrow=c(2,2))

plot(data_frame_q2$DateTime, small_data$Global_active_power, type = "l", xlab="", 
     ylab = "Global Active Power")

plot(data_frame_q2$DateTime, small_data$Voltage, type = "l", xlab = "datetime",
     ylab = "Voltage")

plot(data_frame_q2$DateTime, small_data$Sub_metering_1, type = "l", col = "black", ylab = "", xlab = "")
par(new = TRUE)
plot(data_frame_q2$DateTime, small_data$Sub_metering_2, ylim = range(c(small_data$Sub_metering_1, small_data$Sub_metering_2)),
     ylab = "", xlab = "", type = "l", col = "red")
par(new = TRUE)
plot(data_frame_q2$DateTime, small_data$Sub_metering_3, 
     ylim = range(c(small_data$Sub_metering_1,small_data$Sub_metering_2,small_data$Sub_metering_3)),
     xlab = "", ylab = "Energy sub metering",type = "l", col = "blue")
legend('topright', c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c('black', 'red', 'blue'),
       lty = 1, bty = "n")

plot(data_frame_q2$DateTime, small_data$Global_reactive_power, type = "l", xlab= "datetime",
     ylab = "Global_reactive_power")

dev.off()

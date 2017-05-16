# read table
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
# only include dates 2007-02-01 and 2007-02-02
power <- power[power$Date == "1/2/2007" | power$Date == "2/2/2007", ]

# combine $Date and $Time columns to one $DateTime column
power$DateTime <- paste(power$Date, power$Time)
power$DateTime <- as.POSIXlt(power$DateTime,format="%d/%m/%Y %H:%M:%S")

# intall the datasets package
library(datasets)
# open the PNG device
png("./plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))

# plot the data on the PNG device
plot(x = power$DateTime, y = power$Global_active_power, type = "l" , xlab = "", ylab = "Global Active Power")

plot(x = power$DateTime, y = power$Voltage , type="l", xlab = "datetime", ylab="Voltage")

plot(x = power$DateTime, y = power$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(x = power$DateTime, y = power$Sub_metering_2, col = "red")
lines(x = power$DateTime, y = power$Sub_metering_3, col = "blue")
legend("topright", pch = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(x = power$DateTime, y = power$Global_reactive_power, type = "l", xlab = "datetime")

# close the PNG device
dev.off()
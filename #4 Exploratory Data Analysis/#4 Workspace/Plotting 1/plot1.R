# read table
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
# only include dates 2007-02-01 and 2007-02-02
power <- power[power$Date == "1/2/2007" | power$Date == "2/2/2007", ]

# intall the datasets package
library(datasets)
# open the PNG device
png("./plot1.png", width = 480, height = 480, units = "px")
# draw the histogram
hist(power$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
# close the PNG device
dev.off()
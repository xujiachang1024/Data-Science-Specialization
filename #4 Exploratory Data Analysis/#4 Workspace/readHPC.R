# read table
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
# only include dates 2007-02-01 and 2007-02-02
power <- power[power$Date == "1/2/2007" | power$Date == "2/2/2007", ]

# combine $Date and $Time columns to one $DateTime column
power$DateTime <- paste(power$Date, power$Time)
power$DateTime <- as.POSIXlt(power$DateTime,format="%d/%m/%Y %H:%M:%S")

# intall the datasets package
library(datasets)
library(lattice)
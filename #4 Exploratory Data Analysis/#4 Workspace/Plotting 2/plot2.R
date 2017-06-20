## This first line will likely take a few seconds. Be patient!
if(!exists("NEI")){
    NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
    SCC <- readRDS("./data/Source_Classification_Code.rds")
}
## Transform
NEI <- transform(NEI, SCC = factor(SCC))
NEI <- transform(NEI, year = factor(year))



## Total emissions in Baltimore City
baltimore <- NEI[which(NEI$fips == 24510),]
baltimoreEmissions <- aggregate(Emissions ~ year, baltimore, sum)



## Plotting
png("./plot2.png")
barplot(baltimoreEmissions$Emissions, xlab="Year", ylab="Total PM2.5 Emissions in Baltimore(tons)", main = "Total PM2.5 Emissions in Baltimore from 1999 to 2008", names.arg = baltimoreEmissions$year)
dev.off()
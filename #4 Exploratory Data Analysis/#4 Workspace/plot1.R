## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
## Transform
NEI <- transform(NEI, SCC = factor(SCC))
NEI <- transform(NEI, year = factor(year))



## Total emissions
totalEmissions <- aggregate(Emissions ~ year,NEI, sum)



## Plotting
png("./plot1.png")
barplot(totalEmissions$Emissions, xlab="Year", ylab="Total PM2.5 Emissions (tons)", main = "Total PM2.5 Emissions from 1999 to 2008", names.arg = totalEmissions$year)
dev.off()
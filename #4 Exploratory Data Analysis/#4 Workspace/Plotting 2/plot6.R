## This first line will likely take a few seconds. Be patient!
if(!exists("NEI")){
    NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
    SCC <- readRDS("./data/Source_Classification_Code.rds")
}


require(ggplot2)



two_cities.onroad <- NEI[(NEI$fips=="24510" | NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]

two_cities.aggregate <- aggregate(Emissions ~ year + fips, two_cities.onroad, sum)
two_cities.aggregate$fips[two_cities.aggregate$fips=="24510"] <- "Baltimore, MD"
two_cities.aggregate$fips[two_cities.aggregate$fips=="06037"] <- "Los Angeles, CA"

png("./plot6.png", width=1040, height=480)
g <- ggplot(two_cities.aggregate, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
    xlab("year") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle('Total Emissions from motor vehicle in Baltimore vs Los Angeles from 1999 to 2008')
print(g)
dev.off()
## This first line will likely take a few seconds. Be patient!
if(!exists("NEI")){
    NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
    SCC <- readRDS("./data/Source_Classification_Code.rds")
}


require(ggplot2)



baltimore.onroad <- NEI[NEI$fips == "24510" & NEI$type == "ON-ROAD",  ]

baltimore.aggregate <- aggregate(Emissions ~ year, baltimore.onroad, sum)



png("./plot5.png", width=1000, height=600)
g <- ggplot(baltimore.aggregate, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
    xlab("year") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle('Total Emissions from motor vehicle in Baltimore from 1999 to 2008')
print(g)
dev.off()
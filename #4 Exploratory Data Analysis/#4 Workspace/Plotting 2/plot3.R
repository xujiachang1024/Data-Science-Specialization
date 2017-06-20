## This first line will likely take a few seconds. Be patient!
if(!exists("NEI")){
    NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
    SCC <- readRDS("./data/Source_Classification_Code.rds")
}



library(ggplot2)



baltimore <- NEI[NEI$fips=="24510",]

baltimore.aggregate <- aggregate(Emissions ~ year, baltimore, sum)

png("./plot3.png", width=600, height=480, units="px")
g <- ggplot(baltimore,aes(factor(year), Emissions, fill=type)) +
    geom_bar(stat="identity") +
    theme_bw() + guides(fill=FALSE)+
    facet_grid(.~type, scales="free", space="free") + 
    labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
    labs(title=expression("PM"[2.5]*" Emissions in Baltimore from 1999 to 2008 by Source Type"))
print(g)
dev.off()
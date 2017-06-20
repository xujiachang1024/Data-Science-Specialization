## This first line will likely take a few seconds. Be patient!
if(!exists("NEI")){
    NEI <- readRDS("./data/summarySCC_PM25.rds")
}
if(!exists("SCC")){
    SCC <- readRDS("./data/Source_Classification_Code.rds")
}
# merge the two data sets 
if(!exists("NEISCC")){
    NEISCC <- merge(NEI, SCC, by="SCC")
}


require(ggplot2)



# fetch all NEIxSCC records with Short.Name (SCC) Coal
coalMatches <- grepl("coal", NEISCC$Short.Name, ignore.case = TRUE)
coal <- NEISCC[coalMatches, ]
coal_Emissions <- aggregate(Emissions ~ year, coal, sum)



png("./plot4.png")
g <- ggplot(coal_Emissions, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
    xlab("year") +
    ylab(expression('Total PM'[2.5]*" Emissions")) +
    ggtitle('Total PM2.5 Emissions from Coal Sources from 1999 to 2008')
print(g)
dev.off()
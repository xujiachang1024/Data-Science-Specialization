## Getting the data from the web
setwd("/Users/JEX/Desktop/datasciencecoursera/#3 Getting and Cleaning Data/#3 Workspace")
if (file.exists("./gdp.csv")) {
    file.remove("./gdp.csv")
}
if (file.exists("./education.csv")) {
    file.remove("./education.csv")
}
gdpURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
educationURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(gdpURL, destfile = "./gdp.csv", method = "curl")
download.file(educationURL, destfile = "./education.csv", method = "curl")
gdp <- read.csv("./gdp.csv")
education <- read.csv("./education.csv")



## Take a look at the data
print(
    names(gdp)
)
print(
    head(education, 3)
)



## Merging data
mergedData <- merge(education, gdp, by.x = "CountryCode", by.y = "X", all = TRUE)
print(
    head(mergedData, 5)
)
print(
    nrow(mergedData[mergedData$CountryCode != "", ])
)


## Sorting by GDP
sortedGDP <- gdp[order(gdp$Gross.domestic.product.2012, decreasing = FALSE), ]
print(
    sortedGDP[13, ]
)
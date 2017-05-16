## Getting the data from the web
setwd("/Users/JEX/Desktop/datasciencecoursera/#3 Getting and Cleaning Data/#3 Workspace")
if (file.exists("./restaurants.csv")) {
    file.remove("./restaurants.csv")
}
fileURl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileURl, destfile = "./restaurants.csv", method = "curl")
restData <- read.csv("./restaurants.csv")



## Creating sequences
s1 <- seq(1, 10, by = 2)
print(s1)
s2 <- seq(1, 10, length = 3)
print(s2)
x <- c(1, 3, 8, 25, 100)
s3 <- seq(along = x)
print(s3)



## Subsetting variables
restData$nearMe <- restData$neighborhood %in% c("Roland Park", "Homeland")
print(
    table(restData$nearMe)
)



## Creating binary variables
restData$zipValid = ifelse(restData$zipCode > 0, TRUE, FALSE)
print(
    table(restData$zipValid, restData$zipCode > 0)
)



## Creating categorical variables
restData$zipGroups <-cut(restData$zipCode, breaks = quantile(restData$zipCode))
print(
    table(restData$zipGroups)
)



## Creating factor variables
restData$zcf <- factor(restData$zipCode)
print(
    restData$zcf[1:10]
)
print(
    class(restData$zcf)
)



## Levels of factor variables
yesno <- sample(c("yes", "no"), size = 10, replace = TRUE)
yesnofac <- factor(yesno, levels = c("yes", "no"))
relevel(yesnofac, ref = "yes")
print(
    yesnofac
)
print(
    as.numeric(yesnofac)
)
## Getting the data from the web
setwd("/Users/JEX/Desktop/datasciencecoursera/#3 Getting and Cleaning Data/#3 Workspace")
if (file.exists("./restaurants.csv")) {
    file.remove("./restaurants.csv")
}
fileURl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileURl, destfile = "./restaurants.csv", method = "curl")
restData <- read.csv("./restaurants.csv")



## Look at a bit of the data
print(
    head(restData, n = 3)
)
print(
    tail(restData, n = 3)
)



## Make summary
print(
    summary(restData[restData$zipCode >= 0, ])
)



## Checking for missing values
print(
    sum(is.na(restData$councilDistrict))
)
print(
    any(is.na(restData$councilDistrict))
)
print(
    all(restData$zipCode > 0)
)



## column and row sums
print(
    colSums(is.na(restData))
)
print(
    all(rowSums(is.na(restData) == 0))
)



## Values with specific characteristics
print(
    table(restData$zipCode %in% c(21212))
)
print(
    table(restData$zipCode %in% c(21212, 21213))
)
print(
    restData[restData$zipCode %in% c(21212, 21213), ]
)



## Size of a data set
print(
    object.size(restData)
)
## Getting the data from the web
setwd("/Users/JEX/Desktop/datasciencecoursera/#3 Getting and Cleaning Data/#3 Workspace")
if (file.exists("./reviews.csv")) {
    file.remove("./reviews.csv")
}
if (file.exists("./solutions.csv")) {
    file.remove("./solutions.csv")
}
fileURL1 <- "https://dl.dropboxusercontent.com/u/7710864/data/reviews-apr29.csv"
fileURL2 <- "https://dl.dropboxusercontent.com/u/7710864/data/solutions-apr29.csv"
download.file(fileURL1, destfile = "./reviews.csv", method = "curl")
download.file(fileURL2, destfile = "./solutions.csv", method = "curl")
reviews <- read.csv("./reviews.csv")
solutions <- read.csv("./solutions.csv")



## Take a look at the data
print(
    head(reviews, 2)
)
print(
    head(solutions, 2)
)
print(
    names(reviews)
)
print(
    names(solutions)
)



## Merging data - merge()
mergedData <- merge(reviews, solutions, by.x = "solution_id", by.y = "id", all = TRUE)
print(
    head(mergedData)
)
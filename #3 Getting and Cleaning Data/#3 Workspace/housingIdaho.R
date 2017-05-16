## Getting the data from the web
setwd("/Users/JEX/Desktop/datasciencecoursera/#3 Getting and Cleaning Data/#3 Workspace")
if (file.exists("./housingIdaho.csv")) {
    file.remove("./housingIdaho.csv")
}
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileURL, destfile = "./housingIdaho.csv", method = "curl")
housingIdaho <- read.csv("./housingIdaho.csv")



## Take a look at the data
print(
    head(housingIdaho, 2)
)



## Logical vector
agricultureLogical <- housingIdaho$AGS == 6 & housingIdaho$ACR == 3
print(
    which(agricultureLogical)
)
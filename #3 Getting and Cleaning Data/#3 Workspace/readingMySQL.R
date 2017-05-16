library(RMySQL)



## Connecting to hg19 and listing tables
hg19 <- dbConnect(MySQL(), user = "genome", db = "hg19", host = "genome-mysql.cse.ucsc.edu")
allTables <- dbListTables(hg19)
allLength <- length(allTables)
print(allLength)

print(allTables[1:5])



## Get dimensions of a specific table
affyU133Plus2.Fields <- dbListFields(hg19, "affyU133Plus2")
print(affyU133Plus2.Fields) # print column names

affyU133Plus2.numRow <- dbGetQuery(hg19, "select count(*) from affyU133Plus2")
print(affyU133Plus2.numRow) # print number of rows



## Read from the table
affyU133Plus2.Table <- dbReadTable(hg19, "affyU133Plus2")
head(affyU133Plus2.Table)



## Select a specific subset
query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")
affyU133Plus2.Subset <- fetch(query)
print(quantile(affyU133Plus2.Subset$misMatches))
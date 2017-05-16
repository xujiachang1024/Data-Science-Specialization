complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV file
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the 
    ## number of complete cases
    
    numMonitors <- length(id)
    completeCases <- data.frame(id = integer(numMonitors), nobs = integer(numMonitors))
    
    rowIndex <- 1
    for (i in id) {
        
        # generate correct file name for one monitor
        oneFileName <- generateFileName(directory, i)
        # read the .csv file for one monitor
        oneMonitorTable <- read.csv(oneFileName)
        
        # count the number of complete cases for one monitor
        oneNobs <- 0
        numRows = nrow(oneMonitorTable)
        for (row in 1:numRows) {
            if (complete.cases(oneMonitorTable[row, ])) {
                oneNobs <- oneNobs + 1
            }
        }
        
        # add this monitor to the complete cases data frame
        completeCases$id[rowIndex] <- i
        completeCases$nobs[rowIndex] <- oneNobs
        rowIndex <- rowIndex + 1
    }
    
    completeCases
}

generateFileName <- function(inDirectory, inID) {
    
    if (inID < 10) {
        correctFileName <- paste(inDirectory, "/00", as.character(inID[1]), ".csv", sep = '')
    } else if (inID < 100) {
        correctFileName <- paste(inDirectory, "/0", as.character(inID[1]), ".csv", sep = '')
    } else {
        correctFileName <- paste(inDirectory, "/", as.character(inID[1]), ".csv", sep = '')
    }
    
    correctFileName
}
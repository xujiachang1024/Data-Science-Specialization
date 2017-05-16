pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV file
    
    ## 'pollutant' is is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate"
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Returns the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    ## NOTE: Do not round the result!
    
    allPollutantData <- numeric()
    
    for (i in id) {
        
        # generate correct file name for one monitor
        oneFileName <- generateFileName(directory, i)
        
        # read the .csv file for one monitor
        oneMonitorTable <- read.csv(oneFileName)
        
        # read pollutant data for one monitor
        onePollutantData <- oneMonitorTable[, pollutant]
        
        # concatenate to all pollutant data vector
        allPollutantData <- c(allPollutantData, onePollutantData)
    }
    
    mean(allPollutantData, na.rm = TRUE)
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
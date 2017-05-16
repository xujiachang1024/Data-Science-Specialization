add <- function(x, y) {
    x+y
}

above10 <- function(inVector) {
    use <- inVector > 10
    inVector[use]
}

above <- function(inVector, threshold) {
    use <- inVector > threshold
    inVector[use]
}

columnAverage <- function(inMatrix, removeNA = TRUE) {
    numColumn <- ncol(inMatrix) # count the number of columns
    columnMeans <- numeric(numColumn) # numeric vector to store the column averages
    
    for (i in 1:numColumn) {
        columnMeans[i] <- mean(inMatrix[, i], na.rm = removeNA)
    }
    
    columnMeans # return the numeric vector
}

rowAverage <- function(inMatrix, removeNA = TRUE) {
    numRow = nrow(inMatrix) # count the number of rows
    rowMeans <- numeric(numRow) # numeric vector to store the row averages
    
    for (i in 1:numRow) {
        rowMeans[i] <- mean(inMatrix[i, ], na.rm = removeNA)
    }
    
    rowMeans # return the numeric vector
}
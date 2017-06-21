## There is confusion on how to handle exponent value of the PROPDMGEXP and CROPDMGEXP columns, due to lack of official information in the NOAA website. To improvise, we use the following values to handle the PROPDMGEXP and CROPDMGEXP columns:
##    (+),(-),(?),( ) = 1
##    numeric 0...9 = 10
##    H,h = hundreds = 100
##    K,k = kilos = thousands = 1,000
##    M,m = millions = 1,000,000
##    B,b = billions = 1,000,000,000

## reformat PROPDMGEXP
for (i in 1:nrow(storm.removeNA)) {
    
    ## (+),(-),(?),( ) = 1
    if (isTRUE(storm.removeNA[i, "PROPDMGEXP"] == "") |
        isTRUE(storm.removeNA[i, "PROPDMGEXP"] == "+") |
        isTRUE(storm.removeNA[i, "PROPDMGEXP"] == "-") |
        isTRUE(storm.removeNA[i, "PROPDMGEXP"] == "?")) 
    {
        storm.removeNA$PROPDMG.UNIT[i] <- 1
    }
    
    ## numeric 0...9 = 10
    else if (isTRUE(storm.removeNA[i, "PROPDMGEXP"] == "0") |
             isTRUE(storm.removeNA[i, "PROPDMGEXP"] == "1") |
             isTRUE(storm.removeNA[i, "PROPDMGEXP"] == "2") |
             isTRUE(storm.removeNA[i, "PROPDMGEXP"] == "3") |
             isTRUE(storm.removeNA[i, "PROPDMGEXP"] == "4") |
             isTRUE(storm.removeNA[i, "PROPDMGEXP"] == "5") |
             isTRUE(storm.removeNA[i, "PROPDMGEXP"] == "6") |
             isTRUE(storm.removeNA[i, "PROPDMGEXP"] == "7") |
             isTRUE(storm.removeNA[i, "PROPDMGEXP"] == "8") |
             isTRUE(storm.removeNA[i, "PROPDMGEXP"] == "9")) 
    {
        storm.removeNA$PROPDMG.UNIT[i] <- 10
    }
    
    ## H,h = hundreds = 100
    else if (isTRUE(storm.removeNA[i, "PROPDMGEXP"] == "H") |
             isTRUE(storm.removeNA[i, "PROPDMGEXP"] == "h")) 
    {
        storm.removeNA$PROPDMG.UNIT[i] <- 100
    }
    
    ## K,k = kilos = thousands = 1,000
    else if (isTRUE(storm.removeNA[i, "PROPDMGEXP"] == "K") |
             isTRUE(storm.removeNA[i, "PROPDMGEXP"] == "k"))
    {
        storm.removeNA$PROPDMG.UNIT[i] <- 1000
    }
    
    ## M,m = millions = 1,000,000
    else if (isTRUE(storm.removeNA[i, "PROPDMGEXP"] == "M") |
             isTRUE(storm.removeNA[i, "PROPDMGEXP"] == "m"))
    {
        storm.removeNA$PROPDMG.UNIT[i] <- 1000000
    }
    
    ## B,b = billions = 1,000,000,000
    else if (isTRUE(storm.removeNA[i, "PROPDMGEXP"] == "B") |
             isTRUE(storm.removeNA[i, "PROPDMGEXP"] == "b"))
    {
        storm.removeNA$PROPDMG.UNIT[i] <- 1000000000
    }
    
    storm.removeNA$PROPDMG.STD[i] <- storm.removeNA$PROPDMG.UNIT[i] * storm.removeNA$PROPDMG[i]
}

## reformat CROPDMGEXP
for (i in 1:nrow(storm.removeNA)) {
    
    ## (+),(-),(?),( ) = 1
    if (isTRUE(storm.removeNA[i, "CROPDMGEXP"] == "") |
        isTRUE(storm.removeNA[i, "CROPDMGEXP"] == "+") |
        isTRUE(storm.removeNA[i, "CROPDMGEXP"] == "-") |
        isTRUE(storm.removeNA[i, "CROPDMGEXP"] == "?")) 
    {
        storm.removeNA$CROPDMG.UNIT[i] <- 1
    }
    
    ## numeric 0...9 = 10
    else if (isTRUE(storm.removeNA[i, "CROPDMGEXP"] == "0") |
             isTRUE(storm.removeNA[i, "CROPDMGEXP"] == "1") |
             isTRUE(storm.removeNA[i, "CROPDMGEXP"] == "2") |
             isTRUE(storm.removeNA[i, "CROPDMGEXP"] == "3") |
             isTRUE(storm.removeNA[i, "CROPDMGEXP"] == "4") |
             isTRUE(storm.removeNA[i, "CROPDMGEXP"] == "5") |
             isTRUE(storm.removeNA[i, "CROPDMGEXP"] == "6") |
             isTRUE(storm.removeNA[i, "CROPDMGEXP"] == "7") |
             isTRUE(storm.removeNA[i, "CROPDMGEXP"] == "8") |
             isTRUE(storm.removeNA[i, "CROPDMGEXP"] == "9")) 
    {
        storm.removeNA$CROPDMG.UNIT[i] <- 10
    }
    
    ## H,h = hundreds = 100
    else if (isTRUE(storm.removeNA[i, "CROPDMGEXP"] == "H") |
             isTRUE(storm.removeNA[i, "CROPDMGEXP"] == "h")) 
    {
        storm.removeNA$CROPDMG.UNIT[i] <- 100
    }
    
    ## K,k = kilos = thousands = 1,000
    else if (isTRUE(storm.removeNA[i, "CROPDMGEXP"] == "K") |
             isTRUE(storm.removeNA[i, "CROPDMGEXP"] == "k"))
    {
        storm.removeNA$CROPDMG.UNIT[i] <- 1000
    }
    
    ## M,m = millions = 1,000,000
    else if (isTRUE(storm.removeNA[i, "CROPDMGEXP"] == "M") |
             isTRUE(storm.removeNA[i, "CROPDMGEXP"] == "m"))
    {
        storm.removeNA$CROPDMG.UNIT[i] <- 1000000
    }
    
    ## B,b = billions = 1,000,000,000
    else if (isTRUE(storm.removeNA[i, "CROPDMGEXP"] == "B") |
             isTRUE(storm.removeNA[i, "CROPDMGEXP"] == "b"))
    {
        storm.removeNA$CROPDMG.UNIT[i] <- 1000000000
    }
    
    storm.removeNA$CROPDMG.STD[i] <- storm.removeNA$CROPDMG.UNIT[i] * storm.removeNA$CROPDMG[i]
}

## take a look at the formatted data
head(storm.removeNA)
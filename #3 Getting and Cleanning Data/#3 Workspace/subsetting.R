## Subsetting - quick review
set.seed(13435)
x <- data.frame("var1" = sample(1:5), "var2" = sample(6:10), "var3" = sample(11:15))
x <- x[sample(1:5), ]
x$var2[c(1, 3)] <- NA
print(x)



## Subsetting - logical AND/OR
print(
    x[(x$var1 <= 3 & x$var3 >11), ]
)
print(
    x[(x$var1 <= 3 | x$var3 > 15), ]
)



## Subsetting - dealing with missing values
print(
    x[!is.na(x$var2), ]
)



## Ordering
print(
    x[order(x$var1, x$var3), ]
)



## Adding rows and columns
x$var4 <- rnorm(5)
print(x)
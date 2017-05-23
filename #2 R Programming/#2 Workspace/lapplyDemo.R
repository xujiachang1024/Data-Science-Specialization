setwd("/Users/JEX/Desktop/datasciencecoursera/#2 R Programming/#2 Workspace")
print(
    getwd()
)



## lapply - Example 1
x <- list(a = 1:5, b = rnorm(10))
print(
    lapply(x, mean) # always returns a list
)
print(
    sapply(x, mean)
)



## lapply - Example 2
x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1), d = rnorm(100, 5))
print(
    lapply(x, mean) # always returns a list
)
print(
    sapply(x, mean)
)



## lapply - Example 3
x <- 1:4
print(
    lapply(x, runif)
)
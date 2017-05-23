setwd("/Users/JEX/Desktop/datasciencecoursera/#2 R Programming/#2 Workspace")
print(
    getwd()
)



## syntax of tapply
print("Syntax of tapply: ")
print(
    str(tapply)
)



## tapply - take group means
x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
print(
    f
)
print(
    tapply(x, f, mean)
)



## tapply - take group means without simplification
x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
print(
    f
)
print(
    tapply(x, f, mean, simplify = FALSE)
)



## tapply - find group ranges
x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
print(
    f
)
print(
    tapply(x, f, range)
)
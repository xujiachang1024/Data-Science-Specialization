setwd("/Users/JEX/Desktop/datasciencecoursera/#2 R Programming/#2 Workspace")
print(
    getwd()
)



## syntax of split
print("Syntax of split: ")
print(
    str(split)
)



## split
x <- c(rnorm(10), runif(10), rnorm(10, 1))
f <- gl(3, 10)
print(
    f
)
print(
    split(x, f)
)



## split - more than one level
x <- rnorm(10)
f1 <- gl(2, 5)
f2 <- gl(5, 2)
print("f1: ")
print(
    f1
)
print("f2: ")
print(
    f2
)
print("interaction(f1, f2): ")
print(
    interaction(f1, f2)
)
print(
    split(x, list(f1, f2), drop = TRUE)
)
setwd("/Users/JEX/Desktop/datasciencecoursera/#2 R Programming/#2 Workspace")
print(
    getwd()
)



## apply - mean()
x <- matrix(rnorm(200), 20, 10) # 20 * 10 matrix
print("Print the column averages: ")
print(
    apply(x, 2, mean) # find the column averages
)
print("Print the row sums: ")
print(
    apply(x, 1, sum) # find the row sums
)



## other ways to apply
x <- matrix(rnorm(200), 20, 10) # 20 * 10 matrix
print("Print the Q1, median, Q3 of each row: ")
print(
    apply(x, 1, quantile, probs = c(0.25, 0.50, 0.75))
)
print("Print the Q1, median, Q3 of each column: ")
print(
    apply(x, 2, quantile, probs = c(0.25, 0.50, 0.75))
)



## apply - 3D array
a <- array(rnorm(2*2*10), c(2, 2, 10))
print("Find the mean by collapsing the 3rd dimension: ")
print(
    apply(a, c(1, 2), mean)
)

s <- 1000
n <- 40
lambda <- 0.2

data <- NULL
means <- NULL
stdvs <- NULL

for (i in 1:s) {
    set.seed(i)
    data <- c(data, rexp(n, lambda))
    means <- c(means, mean(rexp(n, lambda)))
    stdvs <- c(stdvs, sd(rexp(n, lambda)))
}

## Sample mean is centered at .9912 and should be at 1 
hist(means)
## Standard deviation is a t .9694 and should be at 1
hist(stdvs)
## Distribution should look like an exponential
hist(data)
curve(exp(-x), from = 0, to = 10, n = 100)
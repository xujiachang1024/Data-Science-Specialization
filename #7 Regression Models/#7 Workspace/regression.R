## Executive Summary

require(datasets)
require(plyr)
require(ggplot2)
require(GGally)
require(car)

data(mtcars)
attach(mtcars)

auto <- mtcars[which(am == 1), ]
manual <- mtcars[which(am == 0), ]



## Exploratory Analysis

t.test(manual$mpg, auto$mpg, alternative = "less")$p.value

figure_1 <- ggplot(mtcars, aes(y=mpg,x=am)) + geom_boxplot(aes(fill=factor(am))) + labs(title = "Figure 1: Sample Distribution of MPG based on Transmission Types") + annotate("text", x = .5, y = 10, label = c("p = .00068")) + geom_jitter(width = 0.2) + annotate("text", x = 0, y = 16.85, label = c("mean = 17.15"))+ annotate("text", x = 1, y = 24.39, label = c("mean = 24.39")) + annotate("text", x = .5, y = 11, label = c("Corr = .6")) + annotate("text", x = .5, y = 12, label = c("Beta = 7.23"))

figure_1



## Model Selection

model_1 <-lm(mpg~., mtcars)
model_1

summary_1 <- append(summary(model_1)$coef[2,], c(summary(model_1)$adj.r.squared, summary(model_1)$r.squared))
names(summary_1)[5:6] <- c("Adj R^2", "R^2")
summary_1

model_2 <-lm(mpg~am, mtcars)
model_2

summary_2 <- append(summary(model_2)$coef[2,], c(summary(model_2)$adj.r.squared, summary(model_2)$r.squared))
names(summary_2)[5:6] <- c("Adj R^2", "R^2")
summary_2

model_3 <- df[[memdex]]
model_3

summary_3 <- append(summary(model_3)$coef[2,], c(summary(model_3)$adj.r.squared, summary(model_3)$r.squared))
names(summary_2)[5:6] <- c("Adj R^2", "R^2")
summary_3
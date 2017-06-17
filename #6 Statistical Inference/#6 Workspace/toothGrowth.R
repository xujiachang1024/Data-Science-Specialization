## Summary of the Data

library(datasets)
require(ggplot2)
require(RColorBrewer)
require(grDevices)

data(ToothGrowth)
attach(ToothGrowth)

# first look: 3 variables and 60 observations
str(ToothGrowth)
summary(ToothGrowth)

# convert $dose to factors
unique(ToothGrowth$dose)
ToothGrowth$dose<-as.factor(ToothGrowth$dose)



## Graphical Analysis

require(gridExtra)

theme <- theme(
    panel.background = element_rect(fill = "lightblue", colour = "lightblue", size = 0.5, linetype = "solid"),
    panel.grid.major = element_line(size = 0.5, linetype = 'solid', colour = "white"), 
    panel.grid.minor = element_line(size = 0.25, linetype = 'solid', colour = "white")
)

plot1 <- ggplot(aes(x = factor(dose), y = len), data = ToothGrowth) + geom_boxplot(aes(fill = factor(dose))) + theme + scale_fill_brewer(palette="PuBu") + labs(title = "Figure 1")

plot2 <- ggplot(aes(x = supp, y = len), data = ToothGrowth) + geom_boxplot(aes(fill = supp)) + theme + scale_fill_brewer(palette="YlOrRd") + labs(title = "Figure 2")

grid.arrange(plot1, plot2, ncol=2)

ggplot(aes(x = supp, y = len), data = ToothGrowth) + geom_boxplot(aes(fill = supp)) + facet_wrap(~ dose) + theme + scale_fill_brewer(palette="YlOrRd")+ labs(title = "Figure 3") + annotate("text", x = 1.5, y = 2, label = c("p = .03","p = .0005","p = .5"))



## Numerical Analysis

# split the data frame by dose and supplement type
split_tooth <- split(ToothGrowth, f = list(ToothGrowth$dose, ToothGrowth$supp))

aggregate(len, list(supp, dose), mean)
aggregate(len, list(supp, dose), sd)

#Test 1: Is Orange Juice more effective than vitamin C across doses? <span style="color:green">YES</span>
t.test(c(split_tooth[[1]]$len, split_tooth[[2]]$len, split_tooth[[3]]$len), c(split_tooth[[4]]$len, split_tooth[[5]]$len, split_tooth[[6]]$len), alternative = "greater")$p.value

#Test 2: Is Orange Juice more effective than Vitamin C for a .5 dose? <span style="color:green">YES</span>
t.test(split_tooth[[1]]$len, split_tooth[[4]]$len, alternative = "greater")$p.value

#Test 3: Is Orange Juice more effective than Vitamin C for a 1 dose? <span style="color:green">YES</span>
t.test(split_tooth[[2]]$len, split_tooth[[5]]$len, alternative = "greater")$p.value

#Test 4: Is Orange Juice more effective than Vitamin C for a 2 dose? <span style="color:red">INCONCLUSIVE</span>
t.test(split_tooth[[3]]$len, split_tooth[[6]]$len, alternative = "greater")$p.value

#Test 5: Is a 2 dose (any supplement type) more effective than a .5 dose? <span style="color:green">YES</span>
t.test(c(split_tooth[[1]]$len, split_tooth[[4]]$len), c(split_tooth[[2]]$len, split_tooth[[5]]$len), alternative = "less")$p.value

#Test 6: Is a 2 dose (any supplement type) more effective than a .5 dose? <span style="color:green">YES</span>
t.test(c(split_tooth[[1]]$len, split_tooth[[4]]$len), c(split_tooth[[3]]$len, split_tooth[[6]]$len), alternative = "less")$p.value

#Test 7: Is a 2 dose (any supplement type) more effective than a .5 dose? <span style="color:green">YES</span>
t.test(c(split_tooth[[2]]$len, split_tooth[[5]]$len), c(split_tooth[[3]]$len, split_tooth[[6]]$len), alternative = "less")$p.value
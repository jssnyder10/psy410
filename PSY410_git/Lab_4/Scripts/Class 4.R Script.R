getwd()

setwd("~/DePaul Graduate/TA Assignments/Advanced Stats I (Grad)/Lab 4/Data")

flavor<-read.csv('Sample Data- Assignment 4.csv', header=T)
flavor
attach(flavor)

#Manually create the table that Jerry gives
observed = t(matrix(flavor$Preference,ncol =2))
observed
chisq.test(observed)
chisq.test(observed)$expected #Expected counts in each cell

#Package for cramersV
install.packages('lsr')
library(lsr)
cramersV(observed)

#Manually create the table that Jerry gives
observed1 <- rbind(c(38, 43, 30), c(333, 119, 83))
observed1
chisq.test(observed1)
chisq.test(observed1)$expected #Expected counts in each cell

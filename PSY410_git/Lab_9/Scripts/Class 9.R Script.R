setwd("~/DePaul Graduate/TA Assignments/Advanced Stats I (Grad)/Lab 9/Data")

#Pretend Data- Three mood ratings of first year graduate students measured once a month during the first year of grad school
mood<-read.csv('Sample Data- Assignment 9A.csv', header=T)
mood
attach(mood)

#Descriptives
install.packages('psych')
library(psych)
psych::describe(mood)

######
#ANOVA- Repeated Measures/Within Subjects Design
install.packages('car')
library(car)
options(contrasts=c("contr.sum","contr.poly"))
model=lm(cbind(FirstMood,SecondMood,ThirdMood)~1)
Trials<-factor(c("FirstMood","SecondMood","ThirdMood"),ordered=F)
Trials

model1<-Anova(model,idata=data.frame(Trials),idesign=~Trials,type="III")
summary(model1, multivariate=F)
###Not significant p>.05

#Plot
plot(colMeans(mood[ ,2:4]),type='b',xlab='Assessment Time',ylab='Mood Score',main='Estimated Marginal Means of Mood')

###OR...You can do the following, using a second data set, which changes the format of the data into long format

mood2<-read.csv('Sample Data- Assignment 9B.csv', header=T)
mood2
aggregate(MoodRating~Time,mood2, mean)
plot(aggregate(MoodRating~Time,mood2, mean))
lines(aggregate(MoodRating~Time,mood2, mean))
title("Estimated Marginal Means of Mood Scores")


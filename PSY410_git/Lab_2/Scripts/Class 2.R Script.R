# Set working directory
setwd("~/DePaul_Graduate/TA Assignments/Advanced Stats I (Grad)/Lab 2/Data")

# Check your working directory
getwd()

#Set up data: Ages of mean and women who use iPhone couponing apps
fullages<-read.csv('Sample Data- Assignment 2.csv', header=T)
fullages
attach(fullages)

#Descriptives
summary(Age)
var(Age)
sd(Age)

install.packages("sjPlot") #make sure to select CRAN Mirror- USA(TN)
library(sjPlot)

sjmisc::frq(Age) #Frequency Table
sjmisc::descr(fullages) #Note that this method does not include Quartiles-- You will need to use summary(Weight) to get Quartiles

#Histogram
hist(Age)
hist(Age, prob=T)
curve(dnorm(x,mean=mean(Age,na.rm=T), sd=sd(Age,na.rm=T)), add=T, col='red')

##Splitting the file by Gender###
#Males
Males<-subset(fullages, Gender==1)
Males
hist(Males$Age, prob=T)
curve(dnorm(x,mean=mean(Males$Age,na.rm=T), sd=sd(Males$Age,na.rm=T)), add=T, col='red')

summary(Males)
sjmisc::descr(Males)

#Females
Females<-subset(fullages, Gender==2)
Females
hist(Females$Age, prob=T)
curve(dnorm(x,mean=mean(Females$Age,na.rm=T), sd=sd(Females$Age,na.rm=T)), add=T, col='red')

summary(Females)
sjmisc::descr(Females)

#Stem and Leaf Plot
stem(fullages$Age)

#Boxplot
boxplot(fullages$Age)
title(main="Boxplot for Age", ylab="Age")

######
#This method also produces summary statistics, as above (just another way to do this)
install.packages("psych")
library(psych)
describeBy(fullages$Age, group=Gender)



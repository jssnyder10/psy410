#Class 1 Sample
#To see what the working directory currently is
getwd()

#To set/change working directory
#Windows: 
setwd("~/DePaul Graduate/TA Assignments/Advanced Stats I (Grad)/Lab 1/Data")
#Mac: 
setwd("Users/jssny/Documents/DePaul Graduate/TA Assignments/Advanced Stats I (Grad)/Lab 1/Data")

#To read data from the textbook website, you are reading .dat files:
www<-"http://www.uvm.edu/~dhowell/methods8/DataFiles/Ex9-31.dat"
data<-read.delim(www,header=TRUE, sep="\t")
data

##########
#To read data from an Excel (.csv format) file (THIS IS MY PREFERRED METHOD): 

#Pretend data: Ages of a group of men who use iPhone apps for couponing
weight<-read.csv('Homework Data - Assignment 1.csv', header=T)
age
attach(age)

#Structure of your data
str(age)

#Data view
head(age)
tail(age)
age[12:15,]
age[32,]

#Frequency Distribution for Age
install.packages('sjPlot')
library(sjPlot)
table(Age)
sjmisc::frq(Age)

#Frequency Histogram
hist(Age)

#Density histogram (allows for a normal curve to be drawn in)
hist(Age, prob=T)
curve(dnorm(x,mean=mean(Age,na.rm=T), sd=sd(Age,na.rm=T)), add=T, col='red')

sjmisc::descr(age)

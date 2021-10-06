#set working directory
setwd("~/DePaul Graduate/TA Assignments/Advanced Stats I (Grad)/Lab 3/Data")

#Pretend data: Data on customer satisfaction with 2 locations of the same grocery store (a chain store)
stores<-read.csv('Sample Data- Assignment 3.csv', header=T)
stores
attach(stores)

#Descriptive Statistics for each group
install.packages("psych")
library(psych)
describeBy(Store.Rating, group=Store.Location)

#Add z-scores to Store Location #1
store1<-subset(stores, Store.Location==1)
store1
scale(store1$Store.Rating)

store1["Zscaled1"]<-NA
store1
store1$Zscaled1<-scale(store1$Store.Rating)
store1

#Add z-scores to Store Location #2
store2<-subset(stores, Store.Location==2)
store2
scale(store2$Store.Rating)

store2["Zscaled2"]<-NA
store2
store2$Zscaled2<-scale(store2$Store.Rating)
store2

getwd()
setwd("~/DePaul Graduate/TA Assignments/Advanced Stats I (Grad)/Lab 5/Data")

Stores<-read.csv('Sample Data- Assignment 5 A.csv', header=T)
Stores
attach(Stores)

#One-sample t-test
#Mean satisfaction rating with independent ("Mom and Pop"-type) stores was mu = 4.2
#Are satisfaction ratings of chain stores (with 4 locations) significantly different from the mean satisfaction rating of independent stores? 
Rating.4.Locations
t.test(Rating.4.Locations, mu=4.20)
#reject null-- Stores with 4 locations are significantly different than the mean

#Independent t-test
#Does satisfaction with chain stores having 4 locations differ significantly from satisfaction with chain stores having 20 locations? 
t.test(Rating.4.Locations, Rating.20.Locations)
#No significant difference between stores with 4 locations and stores with 20 locations

#Dependent t-test
#Does satisfaction with chain stores having different numbers of location depend on the type of store (i.e. what does the store sell? Furniture, Clothing, Groceries, etc.?)
#For purposes of this assignment, we will assume that 20 different store types were included and two stores of each type were considered (one with 4 locations, one with 20 locations)
StoresDep<-read.csv('Sample Data- Assignment 5 B.csv', header=T)
StoresDep
attach(StoresDep)

with(StoresDep, t.test(Rating.4.Locations, Rating.20.Locations, paired=T))
#Regardless of store type, there is no difference in satisfaction between stores with 4 locations and stores with 20 locations.
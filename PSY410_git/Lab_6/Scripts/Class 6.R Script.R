setwd("~/DePaul Graduate/TA Assignments/Advanced Stats I (Grad)/Lab 6/Data")

#Pretend Data: Students took part in one of 3 types of study-- 1) Individual study, 2) One on one tutoring, 3) Classroom format.
#We want to determine whether or not type of study influences ACT scores.

act<-read.csv('Sample Data- Assignment 6.csv', header=T)
act
attach(act)

#Assign Value Labels
act$Group<-factor(act$Group, levels=c(1,2,3), labels=c("Individual", "Tutoring", "Classroom"))
act$Group
Group<-act$Group
Group

#Descriptives by Group
install.packages('psych')
library(psych)
describeBy(Score, Group)

#One-way ANOVA
oneway<-lm(Score~factor(Group))
anova(oneway)

#Scheffe test
install.packages('agricolae')
library(agricolae)

scheffe.test(oneway,"factor(Group)",group=TRUE, console=TRUE)
#see that all three groups are significantly different from one another.
#All means have different letters (at bottom of output)

scheffe.test(oneway,"factor(Group)",group=FALSE, console=TRUE)
#Can see mean differences when you add "group=FALSE"

#Means Plot
aggregate(Score~Group, act, mean)
plot(aggregate(Score~Group, act, mean))
lines(aggregate(Score~Group, act, mean))
title('Mean ACT Score by Study Group')


####################
#Unequal n sizes in each group 

unequal<-read.csv('Sample Data- Assignment 6 B.csv', header=T)
unequal
attach(unequal)

#Assign Value Labels
unequal$Group<-factor(unequal$Group, levels=c(1,2,3), labels=c("Individual", "Tutoring", "Classroom"))
unequal$Group
Group<-unequal$Group
Group
unequal

#Descriptives by Group
library(psych)
describeBy(Score, Group)

#One-way ANOVA
oneway1<-lm(Score~factor(Group))
anova(oneway1)

#Scheffe test
install.packages('agricolae')
library(agricolae)

scheffe.test(oneway1,"factor(Group)",group=TRUE, console=TRUE)
#see that the Classroom group is not significantly different from the other two groups, 
  #but that the Individual and Tutoring groups are significantly different from each other.

scheffe.test(oneway1,"factor(Group)",group=FALSE, console=TRUE)
#Can see mean differences when you add "group=FALSE"

#Means Plot
aggregate(Score~Group, unequal, mean)
plot(aggregate(Score~Group, unequal, mean))
lines(aggregate(Score~Group, unequal, mean))
title('Mean ACT Score by Study Group')

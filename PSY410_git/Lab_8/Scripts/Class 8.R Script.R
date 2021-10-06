setwd("~/DePaul Graduate/TA Assignments/Advanced Stats I (Grad)/Lab 8/Data")

#Pretend Data: Students in grades 10, 11, and 12, who participated in one of three study types:
#1) Individual, 2) One-on-one tutoring, and 3) Classroom-type group took the ACT and their scores were recorded.
#We want to determine whether or not there is an effect of 1) grade level, 2) study type, and 3) and interaction between 
  #grade level and study type on ACT scores.

college<-read.csv('Sample Data- Assignment 8.csv', header=T)
college
attach(college)

#Assign Value Labels
college$Grade<-factor(college$Grade, levels=c(1,2,3), labels=c("Grade 10", "Grade 11", "Grade 12"))
Grade<-college$Grade
Grade

college$Group<-factor(college$Group, levels=c(1,2,3), labels=c("Individual", "Tutoring", "Classroom"))
Group<-college$Group
Group

Score

college

#Descriptives like SPSS
install.packages("sjPlot")
library(sjPlot)
install.packages("psych")
library(psych)

summary(college)
str(college)

#Descriptives by Sessions
aggregate(Score~Grade+Group, mean, data=college)
aggregate(Score~Grade+Group,sd, data=college)

#OR

install.packages('doBy')
library(doBy)
summaryBy(Score~Grade+Group, FUN=mean, data=college)


#Two-Way ANOVA
model1<-lm(Score~Grade*Group)
anova(model1)
model2<-lm(Score~Group*Grade)
anova(model2)

#Plots

plot_model(model1, type="int")
plot_model(model2, type="int")

#OR

interaction.plot(Grade, Group, Score)
interaction.plot(Group, Grade, Score)

#Scheffe
install.packages('agricolae')
library(agricolae)

#Scheffe- Study Type
scheffe.test(model1,"Group",group=TRUE, console=TRUE)
#None of the study types are significantly different from one another

scheffe.test(model1,"Group",group=FALSE, console=TRUE)
#No significant mean group differences

#Scheffe- Grade
scheffe.test(model1,"Grade",group=TRUE, console=TRUE)
#Significant differences between Grade 10 and other two grades. Grade 10 has significantly lower ACT scores than Grades 11 and 12.

scheffe.test(model1,"Grade",group=FALSE, console=TRUE)
#Can see mean differences when group=FALSE

#Simple Effects

install.packages("phia")
library(phia)
testInteractions(model1, fixed="Grade", across="Group")

#Find significant differences in ACT scores for individuals in Grade 12-- dependent on study type

#Pairwise Comparisons for Grade 12
Grade12<-subset(college, Grade=="Grade 12")
Grade12

LSD.test(Grade12$Score, Grade12$Group, 36, 34.38, console=TRUE)
#Need to check on DFerror and MSerror (using full vs. individual)
#To match SPSS, use full sample (from anova summary-- 36 and 34.38)

#Within grade 12, the students in the one on one tutoring group had significantly lower ACT scores than students in the individual and classroom study groups. 

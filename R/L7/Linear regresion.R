setwd("/Users/abdulrahman/Desktop/data\ scientist/R/L7")
getwd()
Class = read.csv("Lesson 7_Regression Analysis/Demo 1_Perform simple linear regression.csv")

View(Class)


str(Class)
summary(Class)

resulte <- lm(formula = Weight ~ Height, data = Class)
resulte

results1 = lm(formula = Class$Weight ~ Class$Height)
results1

summary(resulte)

setwd("/Users/abdulrahman/Desktop/data\ scientist/R/L7")
getwd()
cars_data = read.csv("Lesson 7_Regression Analysis/Demo 2_ Perform Regression Analysis with multiple variables.csv")

View(cars_data)

summary(cars_data)
str(cars_data)

cars_results = lm(formula = MPG_City ~ Type + Origin + DriveTrain + EngineSize + Cylinders + Horsepower 
                  + Weight + Wheelbase + Length , data = cars_data)

cars_results
summary(cars_results)
#-------------------------------------------------------
#Boston Dataset
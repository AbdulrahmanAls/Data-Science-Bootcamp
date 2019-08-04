
#domo 2 naive byes 
setwd("/Users/abdulrahman/Desktop/data\ scientist/R/L8")
getwd()


library(plyr)
library(caret)


#load band data

band_loan = read.csv("Lesson 8_Classification/Demo 4_K-Fold Cross validation.csv")
band_loan = read.csv("Lesson 8_Classification/Demo 2_ Naive Bayes Classifier.csv")

View(band_loan)
str(band_loan)


band_loan$Default = sapply(band_loan$Default, factor)
str(band_loan)

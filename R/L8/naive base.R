
#domo 2 naive byes 
setwd("/Users/abdulrahman/Desktop/data\ scientist/R/L8")
getwd()

install.packages('mlbench')
library(e1071)
library(plyr)
library(caret)
library(mlbench)

#load band data

band_loan = read.csv("Lesson 8_Classification/Demo 2_ Naive Bayes Classifier.csv")

View(band_loan)
str(band_loan)

#change to factor 

band_loan$Default = sapply(band_loan$Default, factor)
str(band_loan)

#build madel

naive_model = naiveBayes(Default ~., data = band_loan)
print(naive_model)

#the model create conditianal probability for each feature separately 

#predict 
naive_predict = predict(naive_model, band_loan)
naive_predict
table(naive_predict, band_loan$Default)




#domo 2 naive byes 
setwd("/Users/abdulrahman/Desktop/data\ scientist/R/L8")
getwd()



library(e1071)
library(plyr)
library(caret)
library(mlbench)
library(rpart)

#load band data

band_loan = read.csv("Lesson 8_Classification/Demo 3_ Decision Tree Classification.csv")

View(band_loan)
str(band_loan)

#convert default varible 

band_loan$Default = sapply(band_loan$Default, factor)

str(band_loan)

#build the model 

tree_model = rpart(Default ~ ., data = band_loan, method = 'class')
tree_model

#analyze results 
printcp(tree_model)
plotcp(tree_model)
print(tree_model)
summary(tree_model)
plot(tree_model)

# k-fold cross validation
folded_up = createFolds(band_loan, k= 10 , list = TRUE, returnTrain = FALSE)

train_set = names(folded_up[1])
band_loan[folded_up$train_set,]


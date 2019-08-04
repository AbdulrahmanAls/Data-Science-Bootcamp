setwd("/Users/abdulrahman/Desktop/data\ scientist/R/L8")
getwd()
customer_churn = read.csv("Lesson 8_Classification/Demo 1_ Support Vector Machines.csv")

View(customer_churn)

count(customer_churn$Churn)
# 483 customers have churend '1'; 2850 have not churned 0


str(customer_churn)
install.packages("plyr")
library("plyr")
customer_churn$Churn = sapply(customer_churn$Churn, factor)
str(customer_churn)

#split the data

sample_split = floor(.7 * nrow(customer_churn))
set.seed(1)
training = sample(seq_len(nrow(customer_churn)), size= sample_split)

churn_train = customer_churn[training, ]
churn_test  = customer_churn[-training, ]

# support vector machine 
install.packages("e1071") 
library(e1071)

svm_churn = svm(Churn ~ ., churn_train)
install.packages("caret")
library(caret)

confusionMatrix(churn_train$Churn, predict(svm_churn),positive = '1')

#test data 

Prediction = predict(svm_churn, churn_test[-1])

Prediction_results = table(pred=Prediction, true = churn_test[,1])
print(Prediction_results)




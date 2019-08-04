
#domo 2 naive byes 
setwd("/Users/abdulrahman/Desktop/data\ scientist/R/L10")
getwd()

install.packages("arules")
library(arules)
#load customer data

Groceries_item = read.transactions("Lesson 10_Association/Demo 1_Perform Association Using the Apriori Algorithm .csv")

inspect(Groceries_item[1:10])


AprioriForGroceries = apriori(Groceries_item, parameter = list(support= .006, confidence=.5))

summary(AprioriForGroceries)

inspect(AprioriForGroceries)
inspect(sort(AprioriForGroceries, by= "confidence"))

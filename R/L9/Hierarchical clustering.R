
#domo 2 naive byes 
setwd("/Users/abdulrahman/Desktop/data\ scientist/R/L9")
getwd()
set.seed(111)

#load customer data

customer_data = read.csv("Lesson 9_Clustering/Demo 4_K-Fold Cross validation.csv")

View(customer_data)
str(customer_data)

#data cleaning 

customer_data = na.omit(customer_data)

#hierarchial clustring

cluster_h = dist(customer_data, method = "euclidian")
fit = hclust(cluster_h, method = "ward")
groups = cutree(fit, k=3)
groups

customer_data = cbind(customer_data, ClusterNum = groups)
View(customer_data)

#graph 

plot(fit)

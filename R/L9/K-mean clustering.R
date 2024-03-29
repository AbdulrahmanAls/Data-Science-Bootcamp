
#domo 2 naive byes 
setwd("/Users/abdulrahman/Desktop/data\ scientist/R/L9")
getwd()
set.seed(111)

#load customer data

customer_data = read.csv("Lesson 9_Clustering/Demo 4_K-Fold Cross validation.csv")

View(customer_data)
str(customer_data)

cluster_up = kmeans(customer_data, 3, iter.max = 10) 

#data cleaning 

del_vars = names(customer_data) %in% c("job", "marital", "education", "default", "housing", "loan", "contact", "month", "poutcome")

customer_data_num = customer_data[!del_vars]
customer_data_num = na.omit(customer_data_num)
customer_data_num = scale(customer_data_num)
View(customer_data_num)

#k-mean clustering 
cluster_up = kmeans(customer_data_num, 3, iter.max = 10)
str(cluster_up)

customer_data_num = cbind(customer_data_num, ClusterNum = cluster_up$cluster )
View(customer_data_num)

#graph and count of expected clusters 

install.packages("mclust")
library(mclust)
fit = Mclust(customer_data_num)
plot(fit)



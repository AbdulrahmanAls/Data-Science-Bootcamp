

BankCustomer = read.csv('Lesson 3_Data Structures/Demo 2_ Assigning values and applying functions.csv')

View(BankCustomer)

install.packages('plyr')
library(plyr)

BankCustomer = rename(BankCustomer,c("X...age" = "Age"))
str(BankCustomer)


max(BankCustomer$Age)
min(BankCustomer$Age)


BankCustomerAgeCat  = transform(BankCustomer, Generation = ifelse(Age<22, "Z",ifelse(Age<41,"Y",ifelse(Age<53,"X","Baby Boomers"))))
BankCustomerAgeCat

#2 way Frequence Table

table(BankCustomerAgeCat$Generation, BankCustomerAgeCat$poutcome)


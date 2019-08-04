
setwd("/Users/abdulrahman/Desktop/data\ scientist/R/project-1")
getwd()

# 1-The team wants to analyze each variable of the data collected through data summarization to 
# get a basic understanding of the dataset and to prepare for further analysis.

library(readxl)
#read excel file 
internet_data = read_excel("internet_dataset.xlsx")

View(internet_data)
str(internet_data)

#analyze each variable of the data collected through data summarization to get a basic 
#understanding of the dataset and to prepare for further analysis.
summary(internet_data)

# we have numerical data excect continent Sourcegroup its char 
# continent and Sourcegroup is category data set so convert this column from char to factor to understand this data

library(dplyr)
# all character columns to factor:
internet_data <- mutate_if(internet_data, is.character, as.factor)
str(internet_data)
summary(internet_data)

# So bounces we have min = 0 and max =30 that mean number of times repeated to data
# Exits min = 0 and max = 36 
# We have 6 continent, most people vist website from N.America = 20043 
# The most visitor search in google to visit websit 
# Timeinpage,	It shows how long the user has spent on that particular page of the website, min = 0, max = 36745


# 2-As mentioned earlier, a unique page view represents the number of sessions during which that page
#was viewed one or more times. A visit counts all instances, no matter how many times the same visitor may
#have been to your site. So the team needs to know whether the unique page view value depends on visits.

cor(internet_data$Uniquepageviews,internet_data$Visits)

# its 81% unique page depends on visits 

analysis<-aov(Uniquepageviews~Visits, data=internet_data)
summary(analysis)  

# new we are sure that uniquepageviews depends on visitor 

# 3-Find out the probable factors from the dataset, which could affect the exits. Exit Page Analysis is usually 
#required to get an idea about why a user leaves the website for a session and moves on to another one.
#Please keep in mind that exits should not be confused with bounces.

analysis_2<-aov(Exits~.,data = internet_data)
summary(analysis_2)

# We can see that sourcegroup, bounces and uniquepageviews have more signficance
# The Visits less significance.
# Exit from the site is affected by the factors of source group, bounces, and unique.pageviews.  


# 4- Every site wants to increase the time on page for a visitor. This increases the chances of the 
#visitor understanding the site content better and hence there are more chances of a transaction taking place. 
#Find the variables which possibly have an effect on the time on page.

analysis_3 <-aov(Timeinpage~.,data = internet_data)
summary(analysis_3)

# All the variables effected Timeinpage except Sourcegroup

# 5-A high bounce rate is a cause of alarm for websites which depend on visitor engagement.
#Help the team in determining the factors that are impacting the bounce.

internet_data$Bounces=internet_data$Bounces*0.01
rmm<-glm(Bounces~Timeinpage+Continent+Exits+Sourcegroup+Uniquepageviews+Visits, data = internet_data, family = "binomial")
summary(rmm)
# we can see the that Uniquepageviews and visits variables effect bounce
?sort

#Apriori
install.packages("arules")
library(arules)
data<- read.csv("Market_Basket_Optimisation.csv", header = F)
data<- read.transactions(file = "Market_Basket_Optimisation.csv", sep=",")

# first,we must remove duplicate items 
data<- read.transactions("Market_Basket_Optimisation.csv", sep=",", rm.duplicates = T)
summary(data)
itemFrequencyPlot(data,topN=10)
# set minimum support and confidence to find the rules
rules<- apriori(data, parameter = list(support= 0.004, confidence=0.2))
# visualising the rules
inspect(sort(rules, by = "lift")[1:10])

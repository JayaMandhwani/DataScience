install.packages("arules")
library(arules)
Titanic<-read.csv("D:\\DS Assignments\\Association Rules\\Titanic.csv")

Titanic<-Titanic[,-c(1)]
rules <- apriori(Titanic)# to get apriori
arules::inspect(rules)
rules.sorted <- sort(rules, by="lift")
arules::inspect(rules.sorted)

# rules with rhs containing "Survived" only
rules <- apriori(Titanic,parameter = list(supp=0.5, conf=0.5)
                 ,appearance = list(rhs=c("Survived=No", "Survived=Yes")
                 ),control = list(verbose=F))## verbose is remove unnecessary information
arules::inspect(rules)

library(arules)
library(arulesViz)
Groceries<-read.csv("D:\\DS Assignments\\Association Rules\\groceries.csv")

Groceries

rules <- apriori(Groceries)# to get apriori
arules::inspect(rules)
rules.sorted <- sort(rules, by="lift")
arules::inspect(rules.sorted)
###Number of rules are more when support and confidence are high.

rules <- apriori(Groceries,parameter = list(supp=0.2, conf=0.3),control = list(verbose=F))
rules <- rules[!is.redundant(rules)]
arules::inspect(rules)

#  with supp=0.1, conf=0.5
rules <- apriori(Groceries,parameter = list(supp=0.1, conf=0.5),control = list(verbose=F))
rules <- rules[!is.redundant(rules)]
arules::inspect(rules)


#Change the minimum length in apriori algorithm

rules <- apriori(Groceries,parameter = list(supp=0.1, conf=0.1,minlen=2),control = list(verbose=F))
rules <- rules[!is.redundant(rules)]
arules::inspect(rules)

#Change the minimum length in apriori algorithm

rules <- apriori(Groceries,parameter = list(supp=0.1, conf=0.1,minlen=3),control = list(verbose=F))
rules <- sort(rules,by="lift")

rules <- rules[!is.redundant(rules)]
arules::inspect(rules)



plot(rules,method = "scatterplot")
plot(rules,method = "grouped")
plot(rules,method = "graph")


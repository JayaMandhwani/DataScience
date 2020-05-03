
library(arules)
library(arulesViz)
movies<-read.csv("D:\\DS Assignments\\Association Rules\\my_movies.csv")

movies<-movies[,6:15]
movies$Sixth.Sense<-factor(movies$Sixth.Sense, labels = c("Y", "N"))
movies$Gladiator<-factor(movies$Gladiator, labels = c("Y", "N"))
movies$LOTR1<-factor(movies$LOTR1, labels = c("Y", "N"))
movies$Harry.Potter1 <-factor(movies$Harry.Potter1, labels = c("Y", "N"))
movies$Patriot  <-factor(movies$Patriot, labels = c("Y", "N"))
movies$LOTR2  <-factor(movies$LOTR2, labels = c("Y", "N"))
movies$Harry.Potter2  <-factor(movies$Harry.Potter2, labels = c("Y", "N"))
movies$LOTR  <-factor(movies$LOTR, labels = c("Y", "N"))
movies$Braveheart  <-factor(movies$Braveheart, labels = c("Y", "N"))
movies$Green.Mile  <-factor(movies$Green.Mile , labels = c("Y", "N"))



rules <- apriori(movies)# to get apriori
arules::inspect(rules)
rules.sorted <- sort(rules, by="lift")
arules::inspect(rules.sorted)

###Number of rules are more when support and confidence are high.

rules <- apriori(movies,parameter = list(supp=0.3, conf=0.5),control = list(verbose=F))
arules::inspect(rules)

# rules with rhs containing "DoItYBks" only with supp=0.8, conf=0.9
rules <- apriori(movies,parameter = list(supp=0.8, conf=0.9)
                 ,control = list(verbose=F))
arules::inspect(rules)


#Change the minimum length in apriori algorithm

rules <- apriori(movies,parameter = list(supp=0.1, conf=0.1,minlen=8),control = list(verbose=F))
arules::inspect(rules)

#Change the minimum length in apriori algorithm

rules <- apriori(movies,parameter = list(supp=0.8, conf=0.8,maxlen=4),control = list(verbose=F))
arules::inspect(rules)
rules.sorted <- sort(rules, by="lift")
arules::inspect(rules.sorted)


plot(rules,method = "scatterplot")
plot(rules,method = "grouped")
plot(rules,method = "graph")
movies1 <- as(movies,"transactions")

itemFrequencyPlot(movies1,topN=3)



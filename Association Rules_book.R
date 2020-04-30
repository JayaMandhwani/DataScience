install.packages("arulesViz")
library(arules)
library(arulesViz)
Book<-read.csv("D:\\DS Assignments\\Association Rules\\book.csv")
Book$ChildBks<-factor(Book$ChildBks, labels = c("Y", "N"))
Book$YouthBks<-factor(Book$YouthBks, labels = c("Y", "N"))
Book$CookBks<-factor(Book$CookBks, labels = c("Y", "N"))
Book$DoItYBks<-factor(Book$DoItYBks, labels = c("Y", "N"))
Book$RefBks<-factor(Book$RefBks, labels = c("Y", "N"))
Book$ArtBks<-factor(Book$ArtBks, labels = c("Y", "N"))
Book$GeogBks<-factor(Book$GeogBks, labels = c("Y", "N"))
Book$ItalCook<-factor(Book$ItalCook, labels = c("Y", "N"))
Book$ItalAtlas<-factor(Book$ItalAtlas, labels = c("Y", "N"))
Book$ItalArt<-factor(Book$ItalArt, labels = c("Y", "N"))
Book$Florence<-factor(Book$Florence, labels = c("Y", "N"))

Book

rules <- apriori(Book)# to get apriori
arules::inspect(rules)
rules.sorted <- sort(rules, by="lift")
arules::inspect(rules.sorted)
###Number of rules are more when support and confidence are high.
# rules with rhs containing "DoItYBks" only with supp=0.2, conf=0.3
rules <- apriori(Book,parameter = list(supp=0.2, conf=0.3)
                 ,appearance = list(rhs=c("DoItYBks=N", "DoItYBks=Y")
                 ),control = list(verbose=F))
arules::inspect(rules)

# rules with rhs containing "DoItYBks" only with supp=0.7, conf=0.6
rules <- apriori(Book,parameter = list(supp=0.7, conf=0.6)
                 ,control = list(verbose=F))
arules::inspect(rules)


#Change the minimum length in apriori algorithm

rules <- apriori(Book,parameter = list(supp=0.1, conf=0.1,minlen=8)
                 ,appearance = list(rhs=c("DoItYBks=N", "DoItYBks=Y")
                 ),control = list(verbose=F))
arules::inspect(rules)

#Change the minimum length in apriori algorithm

rules <- apriori(Book,parameter = list(supp=0.1, conf=0.1,minlen=10)
                 ,appearance = list(rhs=c("DoItYBks=N", "DoItYBks=Y")
                 ),control = list(verbose=F))
arules::inspect(rules)



plot(rules,method = "scatterplot")
plot(rules,method = "grouped")
plot(rules,method = "graph")

Book1 <- as(Book,"transactions")

itemFrequencyPlot(Book1,topN=5)



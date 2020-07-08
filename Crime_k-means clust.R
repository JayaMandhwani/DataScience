crimes<-read.csv("D:\\DS Assignments\\Clustering\\crime_data.csv")
library(factoextra)
fviz_nbclust(crimes[,-1],kmeans,method="wss")+labs(subtitle="Elbow method")
km<-kmeans(crimes[,-1],3)
km$centers

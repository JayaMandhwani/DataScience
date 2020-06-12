install.packages("cluster")
install.packages("fpc")
library(cluster)
library(fpc)
Air<-read.csv("D:\\DS Assignments\\Clustering\\EastWestAirlines.csv")
library(factoextra)
fviz_nbclust(Air[,-1],kmeans,method="wss")+labs(subtitle="Elbow method")


###Cluster algorithm building

km<-kmeans(Air[,-1],5)
km$centers # averages of all clusters
km$cluster 
plot(Air,col=km$cluster)
points(km$center,col=1:2,pch=8,cex=1)
plotcluster(Air, km$cluster)
clusplot(Air, km$cluster, color=TRUE, shade=TRUE, 
         labels=2, lines=0)

sil <- silhouette(km$cluster , dist(5))
fviz_silhouette(sil)


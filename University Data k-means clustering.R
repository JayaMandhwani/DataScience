mydata1<-read.csv("D:\\DS Assignments\\Clustering\\Universities.csv")

##Elbow method
install.packages('factoextra')
library(factoextra)
fviz_nbclust(mydata1[,-1],kmeans,method="wss")+labs(subtitle="Elbow method")


###Cluster algorithm building

km<-kmeans(mydata1[,-1],4)
km$centers # averages of all clusters
km$cluster #cluster membership meansing 1st record will fall in 1st cluster, 2 nd recordm will fall in 4th cluster

###Animation

install.packages("animation")
library(animation)
windows()
km<-kmeans.ani(mydata1[,-1],4)

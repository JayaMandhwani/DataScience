mydata1<-read.csv("D:\\DS Assignments\\Clustering\\Universities.csv")


###################To normalize data as all columns have different scales

mydata<-scale(mydata1[,2:7])

mydata

######find distance between all varaibles##
d<-dist(mydata,method = "euclidean")
d

######Building algorithm with Average####
fit<-hclust(d,method = "average")
fit

plot(fit)  ####display dendogram


clusters<-cutree(fit,k=4) # cut tree into 4 clusters
rect.hclust(fit,k=4,border="red")# draw dendogram with red borders around 4 clusters


# Attach cluster numbers to umiversity

clusters=data.frame('Uni'=mydata1[,1],'Cluster'=clusters)
clusters

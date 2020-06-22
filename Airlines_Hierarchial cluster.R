Airlines<-read.csv("D:\\DS Assignments\\Clustering\\EastWestAirlines.csv")


Airline<-scale(Airlines[,2:11])

distance<-dist(Airline,method = "euclidean")

fit<-hclust(distance,method = "ward.D")
fit

plot(fit)####display dendogram

# fviz_dend(fit, rect = TRUE)
# fviz_silhouette(fit) 


Cluster<-cutree(fit,k=5) 
rect.hclust(fit,k=5,border="red")



tapply(Airlines$Balance,Cluster,mean)
tapply(Airlines$Qual_miles,Cluster,mean)
tapply(Airlines$cc1_miles,Cluster,mean)
tapply(Airlines$cc2_miles,Cluster,mean)
tapply(Airlines$cc3_miles,Cluster,mean)
tapply(Airlines$Bonus_miles,Cluster,mean)
tapply(Airlines$Bonus_trans,Cluster,mean)
tapply(Airlines$Flight_miles_12mo,Cluster,mean)
tapply(Airlines$Flight_trans_12,Cluster,mean)
tapply(Airlines$Days_since_enroll,Cluster,mean)
tapply(Airlines$Award.,Cluster,mean)


       

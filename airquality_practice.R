library(datasets)
data("airquality")

airquality<-datasets::airquality

airquality$Ozone

summary(airquality$Temp)
summary(airquality)
########################################

plot(airquality$Ozone,airquality$Temp)
plot(airquality)

plot(airquality$Ozone,type='l')#p:points,l: labels,b:both

plot(airquality$Ozone,xlab = 'concentration',ylab = "numbe of instances",
     main="levels in city",col='green' )

#Horizontal bar plot

barplot(airquality$Ozone,xlab = 'concentration',ylab = "numbe of instances",
         main="levels in city",col='green',horiz=T)

#Histogram


hist (airquality$Ozone,xlab = 'concentration',ylab = "numbe of instances",
      main="levels in city",col='green')

#single box plot

boxplot(airquality$Ozone)

#Multiple box plot

boxplot(airquality[,1:4],main="multiple")


#no of rows and columns(mfrow)
#margin mar what we want from all 4 sides
#whether a border to be included(bty)
#labels(las:1 for horizontal.0:for vertical)


par(mfrow=c(3,3),mar=c(2,5,2,1), las=1,bty='o')

plot(airquality$Ozone)
plot(airquality$ozone,airquality$Wind)
plot(airquality$Ozone,type='l')
plot(airquality$Ozone,type='l')
plot(airquality$Ozone,type='l')
plot(airquality$Ozone,type='l')
barplot(airquality$Ozone,xlab = 'concentration',ylab = "numbe of instances",
        main="levels in city",col='green',horiz=T)
hist (airquality$Solar.R)
boxplot(airquality$Solar.R)

boxplot(airquality[,0:4],main="multiple")



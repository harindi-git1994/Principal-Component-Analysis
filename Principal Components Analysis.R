#Principal Components Analysis

#read the wine.csv file to a new variable named mydata
mydata <- read.csv("C:\\Users\\yhari\\OneDrive\\Documents\\4. Github\\wine.csv")


#remove the type  column and consider other columns
data <- mydata[-1]
attach(data)


#normalize the data using scale function
normalized <- scale(data)
 
#implementing Principal components analysis on normalized data  
#and store those in a variable call pcawine
pcawine <- princomp(normalized, cor=TRUE)
pcawine

#summary statistics of the normalized data/ probability of variance
summary(pcawine)

#weights on each variables
loadings (pcawine)

#graph showing the importance of PCA
#Comp.1 having the highest importance(highest variance: )
windows()
plot(pcawine)

#PCA scores which represents the whole data
pcawine$scores

# using column bind function, bind the PCA scores to data
#considering only top 6 PCA's 
newdata <- cbind(data, pcawine$scores[, 1:6])

norm_wine <- scale(pcawine$score)
newdata2 <- cbind(norm_wine[,1:6])

#distance matrix and use the "euclidean"method
dista <- dist(newdata2,method="euclidean")

#hierarchical clustering using "complete"method
clus <- hclust(dista, method="complete")
#display dendrogram
plot(clus)

#set the dendrogram hanging level as -3
plot(clus, hang=-3)
#set the numbers of clustering as 7
group <- cutree(clus, k=7)
group

#use the red color borders to divide those 7 culsters
rect.hclust(clus, k=7, border="red")

clusno <- as.data.frame(group)
clusno

#convert into a dataframe
final <- data.frame(clusno,newdata)



data$cluster <- clusno$group
data_clus_1 <- final[final$group ==3,]

#summary statistics of data
summary(data)

#build the model m1 using linear regression function lm
m1 <- lm(Alcohol ~ Malic+Ash+Alcalinity+Magnesium+Phenols+Flavanoids+Nonflavanoids+Proanthocyanins+Color+Hue+Dilution+Proline, data=data_clus_1)
summary(m1)

m2<- lm(Alcohol~Comp.1+Comp.2+Comp.3+Comp.4+Comp.5+Comp.6, data =data_clus_1)
summary(m2)
cor(data)



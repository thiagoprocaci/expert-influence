


library(ggplot2)
#options(warn=-1)



graphData <- read.csv(file = "homophily-degree-dist.csv", header = TRUE, sep = ";", dec = ",", row.names = NULL)
graphData[ , "expert"] <- ifelse(graphData$ex  == 1, 'yes', 'no')
modularityClassList = unique(graphData$modularity_class)


x <- c("expertCount", "subcommunity", "subcommunitySize", "avgIndegree", "avgOutdegree", "nonexpertCount"
       , "avgExIndegree", "avgExOutdegree", "avgNonExIndegree", "avgNonExOutdegree")
nodata <- as.data.frame(matrix(nrow = 0, ncol = length(x)))


for(m in modularityClassList) {
  slice = subset(graphData, graphData$modularity_class == m)
  exSlice = subset(slice, slice$ex == 1)
  otherSlice = subset(slice, slice$ex == 0)
  avgIndegree = mean(slice$indegree)
  avgOutdegree = mean(slice$outdegree)
  
  avgExIndegree = mean(exSlice$indegree)
  avgExOutdegree = mean(exSlice$outdegree)
  
  avgNonExIndegree = mean(otherSlice$indegree)
  avgNonExOutdegree = mean(otherSlice$outdegree)
  
  nodata <- rbind(nodata, c(nrow(exSlice), m, nrow(slice), avgIndegree, avgOutdegree, nrow(otherSlice),avgExIndegree, avgExOutdegree, avgNonExIndegree,  avgNonExOutdegree))
}

colnames(nodata) = x

nodata[, "expertPercent"] = (nodata$expertCount * 100) / nodata$subcommunitySize
nodata[is.na(nodata)] <- 0

dataMore10Member = subset(nodata, nodata$subcommunitySize > 10)

p <- ggplot(nodata, aes(x=subcommunity, y=subcommunitySize)) +
  
  labs(y = "Number of Members", x = "Subcommunity", colour = "Approx. Num. Non Experts") + 
  geom_point(aes(size=expertCount, colour=nonexpertCount) ) + 
  scale_size_continuous(limits=c(0, 260), name="Approx. Num. Experts")
  
print(p)

p <- ggplot(dataMore10Member, aes(x=subcommunity, y=subcommunitySize)) +
  
  labs(y = "Number of Members", x = "Subcommunity With More Than 10 Members", colour = "Approx. Num. Non Experts") + 
  geom_point(aes(size=expertCount, colour=nonexpertCount) ) + 
  scale_size_continuous(limits=c(30, 260), name="Approx. Num. Experts")

print(p)

#print(summary(nodata$subcommunitySize))

print("Degree Distribution avgExIndegree")
print(summary(dataMore10Member$avgExIndegree))
print("Degree Distribution avgExOutdegree")
print(summary(dataMore10Member$avgExOutdegree))
print("Degree Distribution avgNonExIndegree")
print(summary(dataMore10Member$avgNonExIndegree))
print("Degree Distribution avgNonExOutdegree")
print(summary(dataMore10Member$avgNonExOutdegree))



#print(nodata)

# fim da analise da subcomunidades

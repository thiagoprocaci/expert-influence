library(ggplot2)

graphData <- read.csv(file = "edges.csv", header = TRUE, sep = ";", dec = ".", row.names = NULL)



other2other = subset(graphData, graphData$relation == 0)
ex2ex = subset(graphData, graphData$relation == 1)
ex2other = subset(graphData, graphData$relation == 2)

percentEx2Ex = (nrow(ex2ex) * 100) / nrow(graphData)
percentEx2Other = (nrow(ex2other) * 100) / nrow(graphData)
percentOthe2Other = (nrow(other2other) * 100) / nrow(graphData)

print("percentEx2Ex ")
print(percentEx2Ex)
print("percentEx2Other ")
print(percentEx2Other)
print("percentOther2Other ")
print(percentOthe2Other)


print("ex2ex")
print(summary(ex2ex$weight))
print("ex2other")
print(summary(ex2other$weight))
print("other2other")
print(summary(other2other$weight))

p <- ggplot(graphData,  aes(log(weight), colour = as.character(relation))) +
  labs(x = "Relation Weight - Log Scale", colour="Relation") +
  scale_color_manual(labels = c("Non Exp to Non Exp", "Exp to Exp", "Exp to Non Exp"), values=c("red", "green" , "blue") )  +
  geom_density()
print(p)

#p <- ggplot(graphData, aes(x=relation, colour = weight)) +
#  labs(x = "Relation", y = "Frequency") + 
#  geom_histogram(binwidth = 1)
  
#print(p)

#print(hist(graphData$relation))
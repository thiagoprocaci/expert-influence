#E. Discussion Length Analysis
options(warn=-1)

source("../../functions/Functions.R")


library(ggplot2)
allData <- read.csv(file = "thread-len-tag-10.csv", header = TRUE, sep = ";", dec = ",")

tagNameList = unique(allData$tagname)

allData[ , "contains_expert"] <- ifelse(allData$hasExp == 1, 'yes', 'no')

for(tagName in tagNameList) {
  selectedData = subset(allData, allData$tagname ==  tagName )
  obj <- qplot(monthid, avgThreadLen, colour=contains_expert, data =  selectedData, xlab = "Time Slice", ylab = "Avg. Discussion Length", main = tagName)
  print(obj)
  experts = subset(selectedData, selectedData$hasExp == 1)
  nonexperts = subset(selectedData, selectedData$hasExp == 0)
 # hist(selectedData$avgThreadLen)
  existsDiff(experts$avgThreadLen, nonexperts$avgThreadLen, paste("Influence thread Length - Expert x NonExpert - ", tagName, sep = " ") )
}

#experts = subset(allData, allData$hasExp == 1)
#nonexperts = subset(allData, allData$hasExp == 0)

#cdfExperts = ecdf(experts$avgThreadLen)
#cdfNonExperts = ecdf(allData$avgThreadLen)

#plot(cdfExperts, pch = 20,  lty=1, col="red",ylab="CDF", xlab="Avg. Thread Length", main = "Cumulative Distribution Function" )
#lines(cdfNonExperts, pch = 20, lty=2, col="blue")

#legend(20, 0.6, legend=c("Experts", "Others"),
#       col=c("red", "blue"), lty=1:1, cex=0.9, lwd = 2:2)

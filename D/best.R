#D. Best Answers Analysis
options(warn=-1)

source("../functions/Functions.R")


allData <- read.csv(file = "best.csv", header = TRUE, sep = ";")
experts = subset(allData, allData$ex == 1)
others = subset(allData, allData$ex == 0)

correlation(experts$bestAnswer, experts$reputation, "Experts best answer x reputation")

correlation(others$bestAnswer, others$reputation, "others best answer x reputation")

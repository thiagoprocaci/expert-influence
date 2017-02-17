
graphData <- read.csv(file = "../graph-query.csv", header = TRUE, sep = ";", dec = ",", row.names = NULL)

graphData[, "indegree"] <- ifelse(graphData$indegree == "\\N", 0, graphData$indegree)
graphData[, "outdegree"] <- ifelse(graphData$outdegree == "\\N", 0, graphData$outdegree)
graphData[, "pagerank"] <- ifelse(graphData$pagerank == "\\N", 0, graphData$pagerank)
graphData[, "eccentricity"] <- ifelse(graphData$eccentricity == "\\N", 0, graphData$eccentricity)
graphData[, "closeness"] <- ifelse(graphData$closeness == "\\N", 0, graphData$closeness)
graphData[, "betweeness"] <- ifelse(graphData$betweeness == "\\N", 0, graphData$betweeness)
graphData[, "eigenvector"] <- ifelse(graphData$eigenvector == "\\N", 0, graphData$eigenvector)


graphData[ , "goodDiscussion"] <- ifelse(graphData$finished  == 1, 'yes', 'no')

good = subset(graphData, graphData$goodDiscussion == 'yes')
bad = subset(graphData, graphData$goodDiscussion == 'no')

#print(summary(good$indegree))
#print(summary(bad$indegree))


runModel = TRUE

if(runModel) {
  library(caret)
  set.seed(825)
  trainIndex <- createDataPartition(graphData$goodDiscussion, p = .6, 
                                    list = FALSE, 
                                    times = 1)
  dataTrain <- graphData[ trainIndex,]
  dataTest  <- graphData[-trainIndex,]
  
  
  fitControl <- trainControl(## 10-fold CV
    method = "repeatedcv",
    number = 10, 
    classProbs = TRUE,
    repeats = 10,
    summaryFunction = twoClassSummary)  
  
  
  modelFit <- train(goodDiscussion ~ experts + indegree + outdegree + pagerank + betweeness + eigenvector, data = dataTrain, 
                    method = "svmLinearWeights",  
                    trControl = fitControl,
                    metric = "ROC",
                    verbose = FALSE)
  print(modelFit)
  
  print("Prediction")
  predictions <- predict(modelFit, newdata = dataTest)
  
  cm = confusionMatrix(predictions, dataTest$goodDiscussion)
  
  print(cm)
  
  trellis.par.set(caretTheme())
  print(plot(modelFit, metric = "ROC"))
  
  print(plot(modelFit, metric = "ROC", plotType = "level",
             scales = list(x = list(rot = 90))))
}


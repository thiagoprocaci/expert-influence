#A. Reputation and Participation Analysis
options(warn=-1)

source("../functions/Functions.R")

#change the file path
data <- read.csv(file = "user.csv", header = TRUE, sep = ";")

data[, "weightedSum"] =  ((0.7 * data$answers) + (0.6 * data$answer_comments) + (0.5 * data$question_comments)  )
data[, "weightedSum2"] =  ((0.7 * data$answers) + (0.6 * data$answer_comments) + (0.5 * data$question_comments)) / (data$questions + 1)

print("Summary reputation")
print(summary(data$reputation))


expertsData = subset(data, data$expert == 'yes')
nonExpertData = subset(data, data$expert == 'no')

correlation(expertsData$reputation, expertsData$answers, "Reputation X Answers - Experts")
correlation(nonExpertData$reputation, nonExpertData$answers, "Reputation X Answers - Non Experts")

correlation(expertsData$reputation, expertsData$questions, "Reputation X Questions - Experts")
correlation(nonExpertData$reputation, nonExpertData$questions, "Reputation X Questions - Non Experts")

correlation(expertsData$reputation, expertsData$answer_comments, "Reputation X Answer Comments - Experts")
correlation(nonExpertData$reputation, nonExpertData$answer_comments, "Reputation X Answer Comments - Non Experts")

correlation(expertsData$reputation, expertsData$question_comments, "Reputation X Question Comments - Experts")
correlation(nonExpertData$reputation, nonExpertData$question_comments, "Reputation X Question Comments - Non Experts")



correlation(expertsData$reputation, expertsData$weightedSum, "Reputation X  Weighted Sum - Experts")
correlation(nonExpertData$reputation, nonExpertData$weightedSum, "Reputation X Weighted Sum - Non Experts")

correlation(expertsData$reputation, expertsData$weightedSum2, "Reputation X  Weighted Sum 2 - Experts")
correlation(nonExpertData$reputation, nonExpertData$weightedSum2, "Reputation X Weighted Sum 2 - Non Experts")



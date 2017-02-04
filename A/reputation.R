#A. Reputation and Participation Analysis
options(warn=-1)

source("../functions/Functions.R")

#change the file path
data <- read.csv(file = "user.csv", header = TRUE, sep = ";")

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




#B. Quality of Interactions
options(warn=-1)

source("../functions/Functions.R")

#change the file path
data <- read.csv(file = "user.csv", header = TRUE, sep = ";")

print("Summary reputation")
print(summary(data$reputation))


expertsData = subset(data, data$expert == 'yes')
nonExpertData = subset(data, data$expert == 'no')

existsDiff(subset(expertsData, expertsData$answers > 0)$avgAnswersUpVote, subset(expertsData, expertsData$answers > 0)$avgAnswersDownVote, "Experts Answer VoteUp X Experts Answer VoteDown")



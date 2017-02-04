#C. Users Interactions and Evolution Analysis
options(warn=-1)

source("../functions/Functions.R")

dataAnswer <- read.csv(file = "answer-evolution.csv", header = TRUE, sep = ";", dec = ",")
dataAnswerComment <- read.csv(file = "answer-comment-evolution.csv", header = TRUE, sep = ";", dec = ",")
dataQuestionComment <- read.csv(file = "question-comment-evolution.csv", header = TRUE, sep = ";", dec = ",")


dataAnswerExp = subset(dataAnswer, dataAnswer$expert == 1)
dataAnswerNonExp = subset(dataAnswer, dataAnswer$expert == 0)

dataAnswerCommentExp = subset(dataAnswerComment, dataAnswerComment$expert == 1)
dataAnswerCommentNonExp = subset(dataAnswerComment, dataAnswerComment$expert == 0)

dataQuestionCommentExp = subset(dataQuestionComment, dataQuestionComment$expert == 1)
dataQuestionCommentNonExp = subset(dataQuestionComment, dataQuestionComment$expert == 0)

yrange <- range(c(dataAnswer$answerByUser, dataAnswerComment$answerCommentByUser, dataQuestionComment$questionCommentByUser ))
xrange <- range(c(dataAnswer$monthId, dataAnswerComment$monthId, dataQuestionComment$monthId))


plot(xrange, yrange, xlab="Time Slice", ylab="Avg. Participation", type = "n" )

lines(dataAnswerExp$monthId, dataAnswerExp$answerByUser, col="red", lwd = 2.1 )
lines(dataAnswerNonExp$monthId, dataAnswerNonExp$answerByUser, col="blue", lwd = 2.1)
lines(dataAnswerCommentExp$monthId, dataAnswerCommentExp$answerCommentByUser, col="green", lwd = 2.1)
lines(dataAnswerCommentNonExp$monthId, dataAnswerCommentNonExp$answerCommentByUser, col="orange", lwd = 2.1)
lines(dataQuestionCommentExp$monthId, dataQuestionCommentExp$questionCommentByUser, col="gray", lwd = 2.1)
lines(dataQuestionCommentNonExp$monthId, dataQuestionCommentNonExp$questionCommentByUser, col="black", lwd = 2.1)
legend(-1, 9.3, legend=c("Exp Avg Answer", "Non Exp Avg Answer", "Exp Avg Com Answer" , "Non Exp Avg Com Answer", "Exp Avg Com Question", "Non Exp Avg Com Question"),    
       col=c("red", "blue", "green", "orange", "gray", "black"), lty=1:1, cex=0.8, lwd = 5.1)


print("Summary dataAnswerExp answerByUser")
print(summary(dataAnswerExp$answerByUser))

print("Summary dataAnswerNonExp answerByUser")
print(summary(dataAnswerNonExp$answerByUser))

print("Summary dataAnswerCommentExp answerCommentByUser" )
print(summary(dataAnswerCommentExp$answerCommentByUser))

print("Summary dataAnswerCommentNonExp answerCommentByUser")
print(summary(dataAnswerCommentNonExp$answerCommentByUser))

print("Summary dataQuestionCommentExp questionCommentByUser")
print(summary(dataQuestionCommentExp$questionCommentByUser))

print("Summary dataQuestionCommentNonExp questionCommentByUser")
print(summary(dataQuestionCommentNonExp$questionCommentByUser))


print("Summary dataAnswerExp avgVoteUp")
print(summary(dataAnswerExp$avgUpVote))

print("Summary dataAnswerNonExp avgVoteUp")
print(summary(dataAnswerNonExp$avgUpVote))

print("Summary dataAnswerExp avgVoteDown")
print(summary(dataAnswerExp$avgDownVote))

print("Summary dataAnswerNonExp avgVoteDown")
print(summary(dataAnswerNonExp$avgDownVote))

existsDiff(dataAnswerExp$answerByUser, dataAnswerNonExp$answerByUser, "Exp answerByUser X Non Exp answerByUser")
existsDiff(dataAnswerCommentExp$answerCommentByUser, dataAnswerCommentNonExp$answerCommentByUser, "Exp answerCommentByUser X Non Exp answerCommentByUser")
existsDiff(dataQuestionCommentExp$questionCommentByUser, dataQuestionCommentNonExp$questionCommentByUser, "Exp questionCommentByUser X Non Exp questionCommentByUser")


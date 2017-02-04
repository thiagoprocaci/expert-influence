select u.id as id, u.reputation as reputation, 

(select B.expert from (
 SELECT
	  A.rank,
	  A.id,
	  CASE WHEN A.rank<=674 THEN 1
	       WHEN A.rank>674 THEN 0
	  END AS 'expert'
	FROM (select @rownum:=@rownum+1 rank, p.* from user p , 
	(SELECT @rownum:=0) r order by reputation desc 
	
	)A )B where B.id = u.id) as expert,


-- questions
(select count(distinct q.id) from question q where u.id = q.userid) as questions,
(select count(q.answered) from question q where u.id = q.userid and q.answered = 1) as countQuestionsAnswered,

(select avg(q.downVoteCount)  from question q where u.id = q.userid) as avgQuestionsDownVote,
(select std(q.downVoteCount)  from question q where u.id = q.userid) as stdQuestionsDownVote,
(select variance(q.downVoteCount)  from question q where u.id = q.userid) as varQuestionsDownVote,
(select min(q.downVoteCount) from question q where u.id = q.userid) as minQuestionsDownVote,
(select max(q.downVoteCount) from question q where u.id = q.userid) as maxQuestionsDownVote,
(select sum(q.downVoteCount) from question q where u.id = q.userid) as sumQuestionsDownVote,

(select avg(q.upVoteCount)  from question q where u.id = q.userid) as avgQuestionsUpVote,
(select std(q.upVoteCount)  from question q where u.id = q.userid) as stdQuestionsUpVote,
(select variance(q.upVoteCount)  from question q where u.id = q.userid) as varQuestionsUpVote,
(select min(q.upVoteCount) from question q where u.id = q.userid) as minQuestionsUpVote,
(select max(q.upVoteCount) from question q where u.id = q.userid) as maxQuestionsUpVote,
(select sum(q.upVoteCount) from question q where u.id = q.userid) as sumQuestionsUpVote,

(select avg(q.viewCount)  from question q where u.id = q.userid) as avgQuestionsViewCount,
(select std(q.viewCount)  from question q where u.id = q.userid) as stdQuestionsViewCount,
(select variance(q.viewCount)  from question q where u.id = q.userid) as varQuestionsViewCount,
(select min(q.viewCount) from question q where u.id = q.userid) as minQuestionsViewCount,
(select max(q.viewCount) from question q where u.id = q.userid) as maxQuestionsViewCount,
(select sum(q.viewCount) from question q where u.id = q.userid) as sumQuestionsViewCount,

(select avg(q.score)  from question q where u.id = q.userid) as avgQuestionsScore,
(select std(q.score)  from question q where u.id = q.userid) as stdQuestionsScore,
(select variance(q.score)  from question q where u.id = q.userid) as varQuestionsScore,
(select min(q.score) from question q where u.id = q.userid) as minQuestionsScore,
(select max(q.score) from question q where u.id = q.userid) as maxQuestionsScore,
(select sum(q.score) from question q where u.id = q.userid) as sumQuestionsScore,

(select avg(q.answerCount)  from question q where u.id = q.userid) as avgQuestionsAnswerCount,
(select std(q.answerCount)  from question q where u.id = q.userid) as stdQuestionsAnswerCount,
(select variance(q.answerCount)  from question q where u.id = q.userid) as varQuestionsAnswerCount,
(select min(q.answerCount) from question q where u.id = q.userid) as minQuestionsAnswerCount,
(select max(q.answerCount) from question q where u.id = q.userid) as maxQuestionsAnswerCount,
(select sum(q.answerCount) from question q where u.id = q.userid) as sumQuestionsAnswerCount,

(select min(q.creationDate) from question q where u.id = q.userid) as minQuestionsCreationDate,
(select max(q.creationDate) from question q where u.id = q.userid) as maxQuestionsCreationDate,

(select min(q.lastActivityDate) from question q where u.id = q.userid) as minQuestionsLastActivityDate,
(select max(q.lastActivityDate) from question q where u.id = q.userid) as maxQuestionsLastActivityDate,



(select avg(CHAR_LENGTH(q.title)) from question q where u.id = q.userid) as avgQuestionsTitleChar,
(select std(CHAR_LENGTH(q.title)) from question q where u.id = q.userid) as stdQuestionsTitleChar,
(select variance(CHAR_LENGTH(q.title)) from question q where u.id = q.userid) as varQuestionsTitleChar,
(select min(CHAR_LENGTH(q.title)) from question q where u.id = q.userid) as minQuestionsTitleChar,
(select max(CHAR_LENGTH(q.title)) from question q where u.id = q.userid) as maxQuestionsTitleChar,
(select sum(CHAR_LENGTH(q.title)) from question q where u.id = q.userid) as sumQuestionsTitleChar,

(select avg(CHAR_LENGTH(q.body)) from question q where u.id = q.userid) as avgQuestionsBodyChar,
(select std(CHAR_LENGTH(q.body)) from question q where u.id = q.userid) as stdQuestionsBodyChar,
(select variance(CHAR_LENGTH(q.body)) from question q where u.id = q.userid) as varQuestionsBodyChar,
(select min(CHAR_LENGTH(q.body)) from question q where u.id = q.userid) as minQuestionsBodyChar,
(select max(CHAR_LENGTH(q.body)) from question q where u.id = q.userid) as maxQuestionsBodyChar,
(select sum(CHAR_LENGTH(q.body)) from question q where u.id = q.userid) as sumQuestionsBodyChar,

-- answers

(select avg(a.downVoteCount)  from answer a where u.id = a.userid) as avgAnswersDownVote,
(select std(a.downVoteCount)  from answer a where u.id = a.userid) as stdAnswersDownVote,
(select variance(a.downVoteCount)  from answer a where u.id = a.userid) as varAnswersDownVote,
(select min(a.downVoteCount) from answer a where u.id = a.userid) as minAnswersDownVote,
(select max(a.downVoteCount) from answer a where u.id = a.userid) as maxAnswersDownVote,
(select sum(a.downVoteCount) from answer a where u.id = a.userid) as sumAnswersDownVote,

(select avg(a.upVoteCount)  from answer a where u.id = a.userid) as avgAnswersUpVote,
(select std(a.upVoteCount)  from answer a where u.id = a.userid) as stdAnswersUpVote,
(select variance(a.upVoteCount)  from answer a where u.id = a.userid) as varAnswersUpVote,
(select min(a.upVoteCount) from answer a where u.id = a.userid) as minAnswersUpVote,
(select max(a.upVoteCount) from answer a where u.id = a.userid) as maxAnswersUpVote,
(select sum(a.upVoteCount) from answer a where u.id = a.userid) as sumAnswersUpVote,

(select avg(a.score)  from answer a where u.id = a.userid) as avgAnswersScore,
(select std(a.score)  from answer a where u.id = a.userid) as stdAnswersScore,
(select variance(a.score)  from answer a where u.id = a.userid) as varAnswersScore,
(select min(a.score) from answer a where u.id = a.userid) as minAnswersScore,
(select max(a.score) from answer a where u.id = a.userid) as maxAnswersScore,
(select sum(a.score) from answer a where u.id = a.userid) as sumAnswersScore,


(select min(a.creationDate) from answer a where u.id = a.userid) as minAnswersCreationDate,
(select max(a.creationDate) from answer a where u.id = a.userid) as maxAnswersCreationDate,

(select min(a.lastActivityDate) from answer a where u.id = a.userid) as minAnswersLastActivityDate,
(select max(a.lastActivityDate) from answer a where u.id = a.userid) as maxAnswersLastActivityDate,

(select avg(CHAR_LENGTH(a.body)) from answer a where u.id = a.userid) as avgAnswersBodyChar,
(select std(CHAR_LENGTH(a.body)) from answer a where u.id = a.userid) as stdAnswersBodyChar,
(select variance(CHAR_LENGTH(a.body)) from answer a where u.id = a.userid) as varAnswersBodyChar,
(select min(CHAR_LENGTH(a.body)) from answer a where u.id = a.userid) as minAnswersBodyChar,
(select max(CHAR_LENGTH(a.body)) from answer a where u.id = a.userid) as maxAnswersBodyChar,
(select sum(CHAR_LENGTH(a.body)) from answer a where u.id = a.userid) as sumAnswersBodyChar,

(select count(distinct a.id) from answer a where u.id = a.userid) as answers,
(select count(a.accepted) from answer a where u.id = a.userid and a.accepted = 1) as countAnswersAccepted,

-- question_comment

(select count(distinct qc.id) from question_comment qc where u.id = qc.userid) as question_comments,

(select avg(qc.score)  from question_comment qc where u.id = qc.userid) as avgQuestionCommentScore,
(select std(qc.score)  from question_comment qc where u.id = qc.userid) as stdQuestionCommentScore,
(select variance(qc.score)  from question_comment qc where u.id = qc.userid) as varQuestionCommentScore,
(select min(qc.score) from question_comment qc where u.id = qc.userid) as minQuestionCommentScore,
(select max(qc.score) from question_comment qc where u.id = qc.userid) as maxQuestionCommentScore,
(select sum(qc.score) from question_comment qc where u.id = qc.userid) as sumQuestionCommentScore,

(select min(qc.creationDate) from question_comment qc where u.id = qc.userid) as minQuestionCommentCreationDate,
(select max(qc.creationDate) from question_comment qc where u.id = qc.userid) as maxQuestionCommentCreationDate,

(select avg(CHAR_LENGTH(qc.body)) from question_comment qc where u.id = qc.userid) as avgQuestionCommentBodyChar,
(select std(CHAR_LENGTH(qc.body)) from question_comment qc where u.id = qc.userid) as stdQuestionCommentBodyChar,
(select variance(CHAR_LENGTH(qc.body)) from question_comment qc where u.id = qc.userid) as varQuestionCommentBodyChar,
(select min(CHAR_LENGTH(qc.body)) from question_comment qc where u.id = qc.userid) as minQuestionCommentBodyChar,
(select max(CHAR_LENGTH(qc.body)) from question_comment qc where u.id = qc.userid) as maxQuestionCommentBodyChar,
(select sum(CHAR_LENGTH(qc.body)) from question_comment qc where u.id = qc.userid) as sumQuestionCommentBodyChar,

-- answer_comment

(select count(distinct ac.id) from answer_comment ac where u.id = ac.userid) as answer_comments,
(select avg(ac.score)  from answer_comment ac where u.id = ac.userid) as avgAnswerCommentScore,
(select std(ac.score)  from answer_comment ac where u.id = ac.userid) as stdAnswerCommentScore,
(select variance(ac.score)  from answer_comment ac where u.id = ac.userid) as varAnswerCommentScore,
(select min(ac.score) from answer_comment ac where u.id = ac.userid) as minAnswerCommentScore,
(select max(ac.score) from answer_comment ac where u.id = ac.userid) as maxAnswerCommentScore,
(select sum(ac.score) from answer_comment ac where u.id = ac.userid) as sumAnswerCommentScore,

(select min(ac.creationDate) from answer_comment ac where u.id = ac.userid) as minAnswerCommentCreationDate,
(select max(ac.creationDate) from answer_comment ac where u.id = ac.userid) as maxAnswerCommentCreationDate,

(select avg(CHAR_LENGTH(ac.body)) from answer_comment ac where u.id = ac.userid) as avgAnswerCommentBodyChar,
(select std(CHAR_LENGTH(ac.body)) from answer_comment ac where u.id = ac.userid) as stdAnswerCommentBodyChar,
(select variance(CHAR_LENGTH(ac.body)) from answer_comment ac where u.id = ac.userid) as varAnswerCommentBodyChar,
(select min(CHAR_LENGTH(ac.body)) from answer_comment ac where u.id = ac.userid) as minAnswerCommentBodyChar,
(select max(CHAR_LENGTH(ac.body)) from answer_comment ac where u.id = ac.userid) as maxAnswerCommentBodyChar,
(select sum(CHAR_LENGTH(ac.body)) from answer_comment ac where u.id = ac.userid) as sumAnswerCommentBodyChar

from user u
order by u.reputation desc













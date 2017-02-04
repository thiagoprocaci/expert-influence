select * from (

select A.monthid, A.tagname, ((sum(A.answers) + sum(A.question_comments)+ sum(answer_comments))/count(*)) as avgThreadLen, '1' as hasExp from (

select q.id  as questionId,
		q.monthid as monthId,
(select count(*) from answer a where a.questionId = q.id) as answers,
(select count(*) from answer a inner join user u on u.id = a.userId where u.ex = 1 and a.questionId = q.id) as answers_exp,
(select count(*) from question_comment qc where qc.questionId = q.id) as question_comments,
(select count(*) from question_comment qc inner join user u on u.id = qc.userId  where u.ex = 1 and qc.questionId = q.id) as question_comments_exp,
(select count(*) from answer_comment ac inner join answer a on a.id = ac.answerId where a.questionId = q.id) as answer_comments,
(select count(*) from answer_comment ac inner join user u on u.id = ac.userId inner join answer a on a.id = ac.answerId where u.ex = 1 and  a.questionId = q.id) as answer_comments_exp,
(select t.name from tag t inner join question_tag qt on t.id = qt.tagId where q.id = qt.questionId group by t.name order by count(*) desc limit 1) as tagname
from question q
order by q.monthId )A where A.answers_exp > 0 or A.question_comments_exp > 0 or A.answer_comments_exp > 0
								
group by A.monthid , A.tagname

union all


select A.monthid, A.tagname, ((sum(A.answers) + sum(A.question_comments)+ sum(answer_comments))/count(*)) as threadLen, '0' as hasExp from (

select q.id  as questionId,
		q.monthid as monthId,
(select count(*) from answer a where a.questionId = q.id) as answers,
(select count(*) from answer a inner join user u on u.id = a.userId where u.ex = 1 and a.questionId = q.id) as answers_exp,
(select count(*) from question_comment qc where qc.questionId = q.id) as question_comments,
(select count(*) from question_comment qc inner join user u on u.id = qc.userId  where u.ex = 1 and qc.questionId = q.id) as question_comments_exp,
(select count(*) from answer_comment ac inner join answer a on a.id = ac.answerId where a.questionId = q.id) as answer_comments,
(select count(*) from answer_comment ac inner join user u on u.id = ac.userId inner join answer a on a.id = ac.answerId where u.ex = 1 and  a.questionId = q.id) as answer_comments_exp,
(select t.name from tag t inner join question_tag qt on t.id = qt.tagId where q.id = qt.questionId group by t.name order by count(*) desc limit 1) as tagname
from question q
order by q.monthId )A where A.answers_exp = 0 and A.question_comments_exp = 0 and A.answer_comments_exp = 0

group by A.monthid, A.tagname

)B 
where B.tagname in (
		select * from (
		select t.name from tag t inner join question_tag qt on qt.tagId = t.id group by t.name order by count(*) desc  limit 10
	)C )
order by B.monthid, B.avgThreadLen desc

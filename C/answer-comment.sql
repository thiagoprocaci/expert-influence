select a.monthId as monthId,  
		count(distinct a.id) as answerComments,
		count(distinct u.id) as users,
		count(distinct a.id)/count(distinct u.id) as answerCommentByUser,
		'1' as expert
	from user u 
	inner join answer_comment a on a.userId = u.id 
	where u.ex = 1
group by a.monthId

union all

select a.monthId as monthId,  
		count(distinct a.id) as answerComments,
		count(distinct u.id) as users,
		count(distinct a.id)/count(distinct u.id) as answerCommentByUser,
		'0' as expert
	from user u 
	inner join answer_comment a on a.userId = u.id 
	where u.ex = 0
group by a.monthId

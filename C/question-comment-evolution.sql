select a.monthId as monthId,  
		count(distinct a.id) as questionComments,
		count(distinct u.id) as users,
		count(distinct a.id)/count(distinct u.id) as questionCommentByUser,
		'1' as expert
	from user u 
	inner join question_comment a on a.userId = u.id 
	where u.ex = 1
group by a.monthId

union all

select a.monthId as monthId,  
		count(distinct a.id) as questionComments,
		count(distinct u.id) as users,
		count(distinct a.id)/count(distinct u.id) as questionCommentByUser,
		'0' as expert
	from user u 
	inner join question_comment a on a.userId = u.id 
	where u.ex = 0
group by a.monthId

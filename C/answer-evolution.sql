select a.monthId as monthId,  
		avg(a.upVoteCount) avgUpVote, 
		avg(a.downVoteCount) as avgDownVote,
		count(distinct a.id) as answers,
		count(distinct u.id) as users,
		count(distinct a.id)/count(distinct u.id) as answerByUser,
		'1' as expert
	from user u 
	inner join answer a on a.userId = u.id 
	where u.ex = 1
group by a.monthId

union all

select a.monthId as monthId,  
		avg(a.upVoteCount) avgUpVote, 
		avg(a.downVoteCount) as avgDownVote,
		count(distinct a.id) as answers,
		count(distinct u.id) as users,
		count(distinct a.id)/count(distinct u.id) as answerByUser,
		'0' as expert
	from user u 
	inner join answer a on a.userId = u.id 
	where u.ex = 0
group by a.monthId

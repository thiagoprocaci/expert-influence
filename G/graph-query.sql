select B.questionId,  B.finished, sum(B.ex) as experts, 
	avg(B.indegree) as indegree,
 	avg(B.outdegree) as outdegree,
 	avg(B.pagerank) as pagerank,
  	avg(B.eccentricity) as eccentricity,
   avg(B.closeness) as closeness,
   avg(B.betweeness) as betweeness,
   avg(B.eigenvector) as eigenvector
from (

select q.id as questionId , 
(select count(*) from answer a where a.questionId = q.id and a.accepted = 1) as finished,
(select count(u.id) from answer a  inner join user u on a.userId = u.id where u.ex=1 and a.questionId = q.id and a.accepted = 1) as ex,
 g.*
from question q
left join answer a on q.id = a.questionId
left join graph_user_metric g on g.userId = a.userId

)B group by B.questionId

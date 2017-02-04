select count(a.id) as bestAnswer, u.ex, u.reputation  from answer a 
inner join user u on a.userId = u.id
where a.accepted = 1
group by a.userId

select u.id, u.reputation, u.ex,
g.indegree, g.outdegree, g.pagerank,
g.eccentricity, g.closeness, g.betweeness, g.eigenvector
 from user u 
inner join graph_user_metric g
on u.id = g.userId

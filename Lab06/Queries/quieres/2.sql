SELECT COUNT(cnt)
FROM 
(SELECT COUNT(DISTINCT(o_custkey)) AS cnt
FROM customer, orders
WHERE c_custkey = o_custkey AND o_orderdate LIKE "1995-08-__"
GROUP BY o_custkey
HAVING COUNT(o_orderkey) <= 2) AS sq1;
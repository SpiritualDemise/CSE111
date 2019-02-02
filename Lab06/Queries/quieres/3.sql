SELECT COUNT(cnt) FROM 
(SELECT COUNT(DISTINCT(p_partkey)) AS cnt
FROM part,partsupp, supplier, nation
WHERE p_partkey = ps_partkey AND s_suppkey = ps_suppkey AND s_nationkey = n_nationkey AND n_name = "CANADA"
GROUP BY p_partkey
HAVING COUNT(s_suppkey) > 1);
SELECT COUNT(cnt)
FROM
(SELECT COUNT(DISTINCT(s_suppkey)) AS cnt
FROM part, partsupp, supplier, nation
WHERE p_partkey = ps_partkey AND ps_suppkey = s_suppkey  AND n_nationkey = s_nationkey AND n_name = "CANADA"
GROUP BY s_suppkey
HAVING COUNT(p_partkey) >= 4) AS sq1;
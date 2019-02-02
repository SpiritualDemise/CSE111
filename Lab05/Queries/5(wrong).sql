SELECT s_name, p_size , MIN(ps_supplycost)
FROM nation, supplier, partsupp, part,region
WHERE n_nationkey = s_nationkey AND r_regionkey = n_regionkey AND s_suppkey = ps_suppkey AND ps_partkey = p_partkey AND p_type LIKE "%STEEL%" AND 
r_name = "AMERICA"
GROUP BY s_name, ps_supplycost;
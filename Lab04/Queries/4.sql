SELECT s_name, COUNT(ps_partkey)
FROM nation, part, partsupp, supplier
WHERE n_nationkey = s_nationkey AND ps_suppkey = s_suppkey AND ps_partkey = p_partkey AND p_size < 20 AND n_name = "BRAZIL"
GROUP BY s_name;
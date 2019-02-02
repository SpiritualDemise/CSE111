SELECT COUNT(DISTINCT(s_suppkey))
FROM part, partsupp, supplier
WHERE p_partkey = ps_partkey AND s_suppkey = ps_suppkey AND p_retailprice = (SELECT MIN(p_retailprice) FROM part);
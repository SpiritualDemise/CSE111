SELECT r_name , COUNT(s_acctbal)
FROM region, nation, supplier
WHERE r_regionkey = n_regionkey AND s_nationkey = n_nationkey AND s_acctbal > 
(SELECT AVG(s_acctbal) FROM supplier, nation, region WHERE r_regionkey = n_regionkey AND n_nationkey = s_nationkey GROUP BY r_name)
GROUP BY r_name;
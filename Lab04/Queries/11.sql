SELECT r_name, s_name
FROM region r1, supplier, nation
WHERE r_regionkey = n_regionkey AND n_nationkey = s_nationkey AND s_acctbal = 
(SELECT MAX(s_acctbal)
FROM region r2, supplier, nation
WHERE r2.r_regionkey = n_regionkey AND n_nationkey = s_nationkey AND r1.r_regionkey = r2.r_regionkey
GROUP BY r_name)

ORDER BY r_name;
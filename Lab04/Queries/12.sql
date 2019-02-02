SELECT r_name, s_acctbal
FROM region, supplier, nation
WHERE r_regionkey = n_regionkey AND n_nationkey = s_nationkey
GROUP BY r_name
ORDER BY r_name, MAX(s_acctbal);
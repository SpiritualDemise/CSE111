SELECT DISTINCT(c_name), SUM(o_totalprice), n_name
FROM customer, orders, nation
WHERE c_nationkey = n_nationkey AND o_custkey = c_custkey AND n_name = "FRANCE"
GROUP BY c_name;
SELECT n_name, COUNT(c_custkey)
FROM customer, orders, nation, region
WHERE n_regionkey = r_regionkey AND c_nationkey = n_nationkey AND o_custkey = c_custkey AND r_name = "EUROPE"
GROUP BY n_name;
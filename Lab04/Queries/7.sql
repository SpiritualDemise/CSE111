SELECT n_name, o_orderstatus, COUNT(o_orderstatus) 
FROM customer, orders, nation, region
WHERE c_custkey = o_custkey AND c_nationkey = n_nationkey AND r_regionkey = n_regionkey AND r_name = "ASIA"
GROUP BY n_name,o_orderstatus;
SELECT r_name, COUNT(o_orderstatus) AS total
FROM orders, customer, region, nation
WHERE n_regionkey = r_regionkey AND c_custkey = o_custkey AND c_nationkey = n_nationkey AND o_orderstatus = "F"
GROUP BY r_name
ORDER BY total DESC;

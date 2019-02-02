SELECT c_name, COUNT(o_orderkey)
FROM customer, orders, nation
WHERE c_custkey = o_custkey AND n_nationkey = c_nationkey AND n_name = "GERMANY" AND o_orderdate LIKE "1995-__-__"
GROUP BY c_name;
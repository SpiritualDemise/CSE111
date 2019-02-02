SELECT COUNT(c_custkey)
FROM customer,nation,region
WHERE c_nationkey = n_nationkey AND r_regionkey = n_regionkey AND NOT r_name = "EUROPE" AND NOT r_name = "AFRICA";
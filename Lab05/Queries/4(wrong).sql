SELECT n_name, COUNT(s_suppkey), COUNT(c_custkey)
FROM nation, region,

(SELECT s_suppkey
FROM supplier,nation,region
WHERE s_nationkey = n_nationkey AND r_regionkey = n_regionkey AND r_name = "EUROPE") sq1,

(SELECT c_custkey
FROM customer,nation,region
WHERE c_nationkey = n_nationkey AND r_regionkey = n_regionkey AND r_name = "EUROPE") sq2

WHERE n_nationkey = sq1.n_nationkey AND r_regionkey = sq2.r_regionkey AND sq1.n_nationkey = sq2.n_nationkey

GROUP BY n_name;
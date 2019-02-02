SELECT sq2.r_name, sq1.r_name, SUM(l_extendedprice)

FROM lineitem, orders, 
    (SELECT *
FROM supplier, nation, region
WHERE s_nationkey = n_nationkey AND r_regionkey = n_regionkey) sq1, 

(SELECT *
FROM customer, nation, region
WHERE c_nationkey = n_nationkey AND r_regionkey = n_regionkey) sq2

WHERE l_orderkey = o_orderkey AND o_custkey = sq2.c_custkey AND l_suppkey = sq1.s_suppkey
GROUP BY sq2.r_name, sq1.r_name;

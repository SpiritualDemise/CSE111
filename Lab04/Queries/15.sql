SELECT COUNT(DISTINCT(o_orderkey))
FROM orders, customer, supplier, lineitem
WHERE o_custkey = c_custkey AND l_suppkey = s_suppkey AND o_orderkey = l_orderkey AND c_acctbal < 0 AND s_acctbal > 0;
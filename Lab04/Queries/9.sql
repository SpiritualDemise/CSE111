SELECT COUNT(DISTINCT(o_clerk))
FROM orders, nation, supplier, lineitem
WHERE n_nationkey = s_nationkey AND l_orderkey = o_orderkey AND l_suppkey = s_suppkey AND n_name = "RUSSIA";
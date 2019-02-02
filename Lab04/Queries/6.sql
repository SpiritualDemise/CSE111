SELECT p_mfgr, o_orderpriority, COUNT(o_orderpriority)
FROM part, orders , lineitem
WHERE l_orderkey = o_orderkey AND p_partkey = l_partkey
GROUP BY p_mfgr, o_orderpriority;
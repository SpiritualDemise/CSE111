CREATE VIEW Q5 AS 
SELECT o_orderkey, o_custkey, o_orderstatus, o_totalprice, o_orderdate AS o_orderyear, o_orderpriority, o_clerk, o_shippriority, o_comment
FROM orders;

SELECT p_mfgr,o_orderpriority,COUNT(o_orderkey)
FROM Q5,lineitem,part
WHERE o_orderkey = l_orderkey AND l_partkey = p_partkey
GROUP BY p_mfgr,o_orderpriority;
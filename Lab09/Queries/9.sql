CREATE VIEW Q2 AS 
SELECT s_suppkey, s_name,s_address,s_phone,s_acctbal,s_comment,n_name AS s_nation, r_name AS s_region
FROM supplier,nation,region
WHERE s_nationkey = n_nationkey AND r_regionkey = n_regionkey;

CREATE VIEW Q5 AS 
SELECT o_orderkey, o_custkey, o_orderstatus, o_totalprice, o_orderdate AS o_orderyear, o_orderpriority, o_clerk, o_shippriority, o_comment
FROM orders;

SELECT COUNT(DISTINCT(o_clerk))
FROM Q2, Q5, lineitem
WHERE s_suppkey = l_suppkey AND o_orderkey = l_orderkey AND s_nation = "RUSSIA";
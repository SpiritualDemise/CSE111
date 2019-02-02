CREATE VIEW Q1 AS 
SELECT c_custkey,c_name,c_address,c_phone,c_acctbal,c_mktsegment,c_comment,n_name AS c_nation, r_name AS c_region
FROM customer, region,nation
WHERE n_nationkey = c_nationkey AND n_regionkey = r_regionkey;

CREATE VIEW Q2 AS 
SELECT s_suppkey, s_name,s_address,s_phone,s_acctbal,s_comment,n_name AS s_nation, r_name AS s_region
FROM supplier,nation,region
WHERE s_nationkey = n_nationkey AND r_regionkey = n_regionkey;

SELECT COUNT(DISTINCT(o_orderkey))
FROM Q1, Q2, orders, lineitem
WHERE c_custkey = o_custkey AND o_orderkey = l_orderkey AND s_suppkey = l_suppkey AND s_region = "EUROPE" AND c_nation = "CANADA";
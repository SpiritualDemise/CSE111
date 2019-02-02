CREATE VIEW Q1 AS 
SELECT c_custkey,c_name,c_address,c_phone,c_acctbal,c_mktsegment,c_comment,n_name AS c_nation, r_name AS c_region
FROM customer, region,nation
WHERE n_nationkey = c_nationkey AND n_regionkey = r_regionkey;

CREATE VIEW Q5 AS 
SELECT o_orderkey, o_custkey, o_orderstatus, o_totalprice, o_orderdate AS o_orderyear, o_orderpriority, o_clerk, o_shippriority, o_comment
FROM orders;

SELECT c_name, COUNT(o_orderyear)
FROM Q1,Q5
WHERE c_custkey = o_custkey AND c_nation = "GERMANY" AND o_orderyear LIKE "1995-__-__"
GROUP BY c_name;
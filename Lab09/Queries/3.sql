CREATE VIEW Q1 AS 
SELECT c_custkey,c_name,c_address,c_phone,c_acctbal,c_mktsegment,c_comment,n_name AS c_nation, r_name AS c_region
FROM customer, region,nation
WHERE n_nationkey = c_nationkey AND n_regionkey = r_regionkey;

SELECT c_nation,COUNT(o_orderdate)
FROM orders,Q1
WHERE o_custkey = c_custkey AND c_region = "EUROPE"
GROUP BY c_nation;
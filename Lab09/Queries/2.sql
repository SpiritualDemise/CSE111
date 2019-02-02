CREATE VIEW Q1 AS 
SELECT c_custkey,c_name,c_address,c_phone,c_acctbal,c_mktsegment,c_comment,n_name AS c_nation, r_name AS c_region
FROM customer, region,nation
WHERE n_nationkey = c_nationkey AND n_regionkey = r_regionkey;

CREATE VIEW Q2 AS 
SELECT s_suppkey, s_name,s_address,s_phone,s_acctbal,s_comment,n_name AS s_nation, r_name AS s_region
FROM supplier,nation,region
WHERE s_nationkey = n_nationkey AND r_regionkey = n_regionkey;

SELECT s_nation,COUNT(s_name)
FROM Q2
GROUP BY s_nation;
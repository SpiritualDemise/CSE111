CREATE VIEW Q2 AS 
SELECT s_suppkey, s_name,s_address,s_phone,s_acctbal,s_comment,n_name AS s_nation, r_name AS s_region
FROM supplier,nation,region
WHERE s_nationkey = n_nationkey AND r_regionkey = n_regionkey;

SELECT s_region, s_name
FROM Q2 q1
WHERE s_acctbal = (SELECT MAX(s_acctbal) FROM Q2 q2 WHERE q1.s_region = q2.s_region GROUP BY s_region)
ORDER BY s_region;
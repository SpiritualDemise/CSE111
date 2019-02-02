CREATE VIEW Q2 AS 
SELECT s_suppkey, s_name,s_address,s_phone,s_acctbal,s_comment,n_name AS s_nation, r_name AS s_region
FROM supplier,nation,region
WHERE s_nationkey = n_nationkey AND r_regionkey = n_regionkey;

SELECT s_name,COUNT(p_size)
FROM Q2,partsupp,part
WHERE s_suppkey = ps_suppkey AND p_partkey = ps_partkey AND p_size < 20 AND s_nation = "BRAZIL"
GROUP BY s_name;
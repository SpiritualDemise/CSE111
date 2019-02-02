CREATE VIEW Q151 AS 
SELECT c_custkey, c_name, c_nationkey, c_acctbal
FROM customer
WHERE c_acctbal < 0;

CREATE VIEW Q152 AS
SELECT s_suppkey, s_name, s_nationkey, s_acctbal
FROM supplier
WHERE s_acctbal > 0;

SELECT COUNT(DISTINCT(o_orderkey))
FROM Q151, Q152, orders, lineitem
WHERE o_custkey = Q151.c_custkey AND l_orderkey = o_orderkey AND l_suppkey = Q152.s_suppkey;
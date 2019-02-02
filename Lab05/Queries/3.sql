SELECT MAX(l_discount)
FROM lineitem, orders
WHERE l_orderkey = o_orderkey AND o_orderdate LIKE "1995-05-__" AND l_discount < (SELECT AVG(l_discount) FROM lineitem);
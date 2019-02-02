SELECT strftime('%m',l_shipdate),AVG(l_quantity)
FROM lineitem
WHERE l_shipdate LIKE "1996-__-__"
GROUP BY strftime('%m',l_shipdate);
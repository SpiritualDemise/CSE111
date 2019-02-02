CREATE VIEW Q10 AS
SELECT p_type, MAX(l_discount) AS max_discount
FROM lineitem, part
WHERE l_partkey = p_partkey
GROUP BY p_name;

SELECT p_type, MAX(max_discount)
FROM Q10
WHERE p_type LIKE "ECONOMY %"
GROUP BY p_type;
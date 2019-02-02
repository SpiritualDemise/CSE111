SELECT p_type , MAX(l_discount)
FROM lineitem, part
WHERE p_type LIKE "ECONOMY %"
GROUP BY p_type;
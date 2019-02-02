SELECT n_name, COUNT(s_suppkey)
FROM nation, supplier
WHERE n_nationkey = s_nationkey
GROUP BY n_name;
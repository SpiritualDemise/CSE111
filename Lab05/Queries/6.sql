SELECT p_mfgr
FROM supplier, partsupp, part
WHERE s_suppkey = ps_suppkey AND ps_partkey = p_partkey AND s_name = "Supplier#000000053" AND ps_availqty = (SELECT MIN(ps_availqty) FROM partsupp,part, supplier WHERE s_suppkey = ps_suppkey AND ps_partkey = p_partkey AND s_name = "Supplier#000000053");
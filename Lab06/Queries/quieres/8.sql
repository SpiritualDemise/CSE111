SELECT COUNT(DISTINCT (c_custkey) ) 
  FROM customer,
       orders
 WHERE c_custkey = o_custkey AND 
       o_orderkey NOT IN (
           SELECT DISTINCT (o_orderkey) 
             FROM region,
                  nation,
                  supplier,
                  orders,
                  lineitem
            WHERE r_regionkey = n_regionkey AND 
                  n_nationkey = s_nationkey AND 
                  s_suppkey = l_suppkey AND 
                  o_orderkey = l_orderkey AND 
                  r_name NOT IN ("ASIA") 
       );

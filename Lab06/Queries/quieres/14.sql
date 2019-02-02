SELECT name,
       (extsum - extsumm) 
  FROM (
           SELECT n_name AS name,
                  SUM(l_extendedprice) AS extsum
             FROM customer,
                  orders,
                  lineitem,
                  supplier,
                  nation
            WHERE c_custkey = o_custkey AND 
                  l_orderkey = o_orderkey AND 
                  l_suppkey = s_suppkey AND 
                  s_nationkey = n_nationkey AND 
                  c_nationkey != n_nationkey AND 
                  l_shipdate LIKE "1996-__-__"
          GROUP BY n_name
       ),
       (
           SELECT n_name AS namee,
                  SUM(l_extendedprice) AS extsumm
             FROM customer,
                  orders,
                  lineitem,
                  supplier,
                  nation
            WHERE c_custkey = o_custkey AND 
                  l_orderkey = o_orderkey AND 
                  l_suppkey = s_suppkey AND 
                  c_nationkey = n_nationkey AND 
                  s_nationkey != n_nationkey AND 
                  l_shipdate LIKE "1996-__-__"
                  GROUP BY n_name
       )
 WHERE name = namee;

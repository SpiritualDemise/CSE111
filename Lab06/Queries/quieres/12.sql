SELECT n_name
FROM (

SELECT n_name, MAX(ttlmax) 
  FROM (
           SELECT n_name,
                  SUM(o_totalprice) AS ttlmax
             FROM orders,
                  nation,
                  customer
            WHERE n_nationkey = c_nationkey AND 
                  o_custkey = c_custkey
            GROUP BY n_name
       )

);

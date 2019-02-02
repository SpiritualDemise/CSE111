select n_name
from customer,
       nation
 WHERE c_nationkey = n_nationkey
 GROUP BY n_name having count(*) =

(SELECT MAX(cnt)
FROM (SELECT COUNT(c_custkey) as cnt
  FROM customer,
       nation
 WHERE c_nationkey = n_nationkey
 GROUP BY n_name
 )
 ) ;

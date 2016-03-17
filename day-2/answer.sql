-- Association Rules
-- 1. Munculkan jumlah order yang support count nya > 3
SELECT productCode, count(productCode) as supportcount
  FROM orderdetails
  GROUP BY productCode
  having count(productCode) > 3
  ORDER BY supportcount DESC

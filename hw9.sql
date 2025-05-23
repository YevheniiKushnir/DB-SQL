-- 1
SELECT
  purchase_order_id,
  MIN(unit_cost) OVER (PARTITION BY purchase_order_id) AS min_unit_cost,
  MAX(unit_cost) OVER (PARTITION BY purchase_order_id) AS max_unit_cost,
  AVG(unit_cost) OVER (PARTITION BY purchase_order_id) AS avg_unit_cost
FROM
	purchase_order_details;

-- 2
SELECT DISTINCT
  purchase_order_id,
  MIN(unit_cost) OVER (PARTITION BY purchase_order_id) AS min_unit_cost,
  MAX(unit_cost) OVER (PARTITION BY purchase_order_id) AS max_unit_cost,
  AVG(unit_cost) OVER (PARTITION BY purchase_order_id) AS avg_unit_cost
FROM
	purchase_order_details;
    
-- 3
SELECT 
	purchase_order_id, product_id,
	SUM( quantity*unit_cost) over (PARTITION BY purchase_order_id) AS total_price
FROM
	purchase_order_details;

SELECT 
    purchase_order_id,
    product_id,
    SUM(quantity * unit_cost) AS total_price
FROM
    purchase_order_details
GROUP BY 
	purchase_order_id;

-- 4
SELECT  
  purchase_order_id, 
  date_received, 
  COUNT(*) OVER (PARTITION BY date_received, posted_to_inventory) as amount,
  IF(
	COUNT(*) OVER (PARTITION BY date_received, posted_to_inventory) > 1,
    '>1',
    '=1'
  ) AS result
FROM purchase_order_details;


-- 1
SELECT 
    product_id,
    inventory_id,
    LAG(inventory_id) OVER (PARTITION BY product_id ORDER BY quantity desc) AS prev_inventory_id,
    LEAD(inventory_id) OVER (PARTITION BY product_id ORDER BY quantity desc) AS next_inventory_id
FROM
    order_details;
    
-- 2
SELECT 
	order_id,
    unit_price,
	FIRST_VALUE(unit_price) OVER (PARTITION BY order_id ORDER BY unit_price DESC) AS max_unit_price,
	FIRST_VALUE(unit_price) OVER (PARTITION BY order_id ORDER BY unit_price) AS min_unit_price
FROM
    order_details;
    
-- 3
SELECT 
	order_id,
    unit_price - FIRST_VALUE(unit_price) OVER (PARTITION BY order_id ORDER BY unit_price) AS result1,
    unit_price - MIN(unit_price) OVER (PARTITION BY order_id) AS result2
FROM
    order_details;

-- 4
SELECT 
	order_id,
	quantity,
    RANK() OVER (ORDER BY quantity DESC) AS result_rank
FROM 
    order_details;

-- 5
SELECT *
FROM (
  SELECT 
    order_id,
    quantity,
    RANK() OVER (ORDER BY quantity DESC) AS result_rank
  FROM 
    order_details
) AS ranked
WHERE result_rank <= 10;

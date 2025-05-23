USE northwind;

-- 1
SELECT 
    AVG(unit_cost) AS avg_unit_cost,
    SUM(unit_cost) AS sum_unit_cost,
    MIN(unit_cost) AS min_unit_cost,
    MAX(unit_cost) AS max_unit_cost
FROM
    purchase_order_details;
    
-- 2
SELECT 
    COUNT(DISTINCT purchase_order_id) AS count_uniq_purchase_order_id
FROM
    purchase_order_details;
    
-- 3
SELECT 
    purchase_order_id, COUNT(product_id) AS amount_product
FROM
    purchase_order_details
GROUP BY purchase_order_id
ORDER BY amount_product DESC;

-- 4
SELECT 
    date_received, COUNT(product_id) AS amount_product
FROM
    purchase_order_details
WHERE
    quantity > 30
GROUP BY date_received;

-- 5
SELECT 
    date_received, SUM( quantity * unit_cost) AS total_order_cost
FROM
    purchase_order_details
GROUP BY date_received;

-- 6
SELECT 
    unit_cost,
    AVG(quantity) AS avg_quantity,
    MAX(quantity) AS max_quantity
FROM
    purchase_order_details
WHERE
    purchase_order_id <= 100
GROUP BY unit_cost;

-- 7
SELECT 
    IF(unit_cost > 20, 'Expensive', 'others') AS category,
    COUNT(product_id) AS amount_product
FROM
    purchase_order_details
WHERE
    inventory_id IS NOT NULL
GROUP BY category;
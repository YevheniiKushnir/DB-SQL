USE northwind;

-- 1

SELECT 
    *
FROM
    suppliers;

-- 2

SELECT 
    id,
    order_id,
    CASE
        WHEN unit_price > 10 THEN 'Expensive'
        ELSE 'Cheap'
    END AS category
FROM
    order_details;
SELECT 
    id,
    order_id,
    IF(unit_price > 10,
        'Expensive',
        'Cheap') AS category
FROM
    order_details;
    
-- 3

SELECT 
    *, quantity * unit_price AS total_price
FROM
    order_details
WHERE
    purchase_order_id IS NULL;
    
-- 4

SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name
FROM
    employees
LIMIT 3 OFFSET 1;

-- 5

SELECT 
    LEFT(order_date, 7)
FROM
    orders
LIMIT 1; 

-- 6

SELECT DISTINCT
    company
FROM
    customers
ORDER BY company DESC;
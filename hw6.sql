-- 1
SELECT 
    id, employee_id
FROM
    orders 
UNION SELECT 
    id, created_by AS employee_id
FROM
    purchase_orders;

-- 2
SELECT 
    id, employee_id, 'orders' AS from_table
FROM
    orders
WHERE
    employee_id IS NOT NULL 
UNION SELECT 
    id,
    created_by AS employee_id,
    'purchase_orders' AS from_table
FROM
    purchase_orders
WHERE
    created_by IS NOT NULL;

-- 3
SELECT 
    od.*, po.payment_method
FROM
    order_details od
        JOIN
    purchase_orders po ON od.purchase_order_id = po.id
WHERE
    po.payment_method IS NOT NULL;
    
-- 4
SELECT 
    o.id as order_id, CONCAT(c.first_name, ' ', c.last_name) as customer_full_name, i.invoice_date
FROM
    orders o
        JOIN
    customers c ON o.customer_id = c.id
        JOIN
    invoices i ON o.id = i.order_id;
    
-- 5
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS customer_full_name,
    COUNT(*) AS amount_invoices
FROM
    orders o
        JOIN
    customers c ON o.customer_id = c.id
        JOIN
    invoices i ON o.id = i.order_id
GROUP BY customer_full_name;
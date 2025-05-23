-- 1.1
SELECT p.product_name,

  (SELECT SUM(od.quantity)
   FROM order_details od
   WHERE od.product_id = p.id) AS quantity
FROM products p;

-- 1.2
WITH cte_product_quantities AS
  (SELECT product_id,
          SUM(quantity) AS quantity
   FROM order_details
   GROUP BY product_id)
SELECT p.product_name,
       pq.quantity AS quantity
FROM products p
LEFT JOIN cte_product_quantities pq ON p.id = pq.product_id;

-- чтобы понять кто именно из Lee первый
SELECT c.id AS customer_id,
       c.first_name,
       c.last_name,
       MIN(o.order_date) AS first_order
FROM customers c
JOIN orders o ON c.id = o.customer_id
WHERE c.last_name = 'Lee'
GROUP BY c.id,
         c.first_name,
         c.last_name;

-- 2.1
SELECT id,
       customer_id,
       order_date,
       ship_name,

  (SELECT MIN(order_date)
   FROM orders
   WHERE customer_id IN
       (SELECT id
        FROM customers
        WHERE last_name = 'Lee')) AS first_date_order_lee
FROM orders
WHERE order_date >
    (SELECT MIN(order_date)
     FROM orders
     WHERE customer_id IN
         (SELECT id
          FROM customers
          WHERE last_name = 'Lee'));

-- 2.2
WITH cte_min_order_date_client_lee AS
  (SELECT MIN(order_date) AS min_date
   FROM orders
   WHERE customer_id IN
       (SELECT id
        FROM customers
        WHERE last_name = 'Lee'))
SELECT o.id,
       o.customer_id,
       o.order_date,
       o.ship_name,
       cte.min_date AS first_date_order_lee
FROM orders o
CROSS JOIN cte_min_order_date_client_lee cte
WHERE o.order_date > cte.min_date;

-- 3.1
SELECT *,

  (SELECT MAX(target_level)
   FROM products) AS max_target_level
FROM products
WHERE target_level =
    (SELECT MAX(target_level)
     FROM products);

-- 3.2
WITH cte_max_target_level AS
  (SELECT MAX(target_level) AS max_target_level
   FROM products)
SELECT p.*,
       cte.max_target_level AS max_target_level
FROM products p
CROSS JOIN cte_max_target_level cte
WHERE p.target_level = cte.max_target_level;
USE northwind;

-- 1
SELECT TIMESTAMPDIFF(SECOND, '2000-10-17', NOW()) AS lifespan_in_seconds;

-- 2
SELECT CURDATE() + INTERVAL 51 DAY AS date_in_51_days;

-- 3
SELECT DAYNAME(CURDATE() + INTERVAL 51 DAY) AS weekday_in_51_days;
SELECT DATE_FORMAT(CURDATE() + INTERVAL 51 DAY, '%W') AS weekday_in_51_days;

-- 4
SELECT transaction_created_date, transaction_created_date + INTERVAL 3 HOUR  AS 'transaction_created_date + 3' FROM inventory_transactions;

-- 5
SELECT  CONCAT('Клиент с id ', customer_id, ' сделал заказ ', order_date) AS info FROM orders;
SELECT CONCAT('Клиент с id ', CAST(customer_id AS CHAR), ' сделал заказ ', CAST(order_date AS CHAR)) AS info FROM orders;

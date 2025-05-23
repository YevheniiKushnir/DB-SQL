USE northwind;
/* 1 */
SELECT 
    *
FROM
    suppliers;
/* 2 */
SELECT 
    *
FROM
    suppliers
WHERE
    company LIKE 'Supplier A';
/* 3 */
SELECT 
    *
FROM
    purchase_orders;
/* 4 */
SELECT 
    *
FROM
    purchase_orders
WHERE
    supplier_id = 2;
/* 5 */
SELECT 
    supplier_id, shipping_fee
FROM
    purchase_orders
WHERE
    created_by = 1 AND supplier_id = 5;
/* НЕЧЕГО НЕТУ 
supplier_id created_by
1				1	2006-03-24 00:00:00	2006-03-24 00:00:00	2		0.0000	0.0000		0.0000		Purchase generated based on Order #41	2	2006-04-04 00:00:00	1
2				1	2006-03-24 00:00:00	2006-03-24 00:00:00	2		0.0000	0.0000		0.0000		Purchase generated based on Order #42	2	2006-04-04 00:00:00	1
2				1	2006-03-24 00:00:00	2006-03-24 00:00:00	2		0.0000	0.0000		0.0000		Purchase generated based on Order #45	2	2006-04-04 00:00:00	1
*/
/* 6 */
SELECT 
    last_name, first_name
FROM
    employees
WHERE
    address IN ('123 2nd Avenue' , '123 8th Avenue');
SELECT 
    last_name, first_name
FROM
    employees
WHERE
    address = '123 2nd Avenue'
        OR address = '123 8th Avenue';
/* 7 */
SELECT 
    first_name
FROM
    employees
WHERE
    last_name LIKE '_%p%_'
        AND last_name NOT LIKE 'p%'
        AND last_name NOT LIKE '%p';
/* 8 */
SELECT 
    *
FROM
    orders
WHERE
    shipper_id IS NULL;
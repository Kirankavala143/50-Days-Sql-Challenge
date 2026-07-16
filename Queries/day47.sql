-- USE sql_challenge;

-- ===========================================
-- DAY 47 : ORDER ANALYSIS
-- ===========================================

-- 1. Find number of orders placed daily

SELECT
    order_date,
    COUNT(order_id) AS total_orders
FROM cleaned_orders
GROUP BY order_date
ORDER BY order_date;


-- 2. Find monthly order trend

SELECT
    MONTH(order_date) AS month_no,
    MONTHNAME(order_date) AS month_name,
    COUNT(order_id) AS total_orders
FROM cleaned_orders
GROUP BY
    MONTH(order_date),
    MONTHNAME(order_date)
ORDER BY month_no;


-- 3. Find the highest value order

SELECT
    o.order_id,
    o.order_date,
    SUM(od.quantity * p.price) AS order_value
FROM cleaned_orders o
JOIN cleaned_order_details od
    ON o.order_id = od.order_id
JOIN cleaned_products p
    ON od.product_id = p.product_id
GROUP BY
    o.order_id,
    o.order_date
ORDER BY order_value DESC
LIMIT 1;


-- 4. Find the lowest value order

SELECT
    o.order_id,
    o.order_date,
    SUM(od.quantity * p.price) AS order_value
FROM cleaned_orders o
JOIN cleaned_order_details od
    ON o.order_id = od.order_id
JOIN cleaned_products p
    ON od.product_id = p.product_id
GROUP BY
    o.order_id,
    o.order_date
ORDER BY order_value ASC
LIMIT 1;


-- 5. Find average quantity per order

SELECT
    order_id,
    AVG(quantity) AS avg_quantity
FROM cleaned_order_details
GROUP BY order_id
ORDER BY avg_quantity DESC;


-- 6. Categorize orders by quantity size
-- Small : <=5
-- Medium: 6-10
-- Large : >10

SELECT
    order_id,
    SUM(quantity) AS total_quantity,

    CASE
        WHEN SUM(quantity) <= 5 THEN 'Small Order'
        WHEN SUM(quantity) <= 10 THEN 'Medium Order'
        ELSE 'Large Order'
    END AS order_category

FROM cleaned_order_details
GROUP BY order_id
ORDER BY total_quantity DESC;


-- 7. Find the day with the highest number of orders

SELECT
    order_date,
    COUNT(order_id) AS total_orders
FROM cleaned_orders
GROUP BY order_date
ORDER BY total_orders DESC
LIMIT 1;
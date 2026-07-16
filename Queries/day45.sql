-- -- USE sql_challenge;

SELECT COUNT(*) FROM cleaned_payments;

-- 1. Top Customers by Orders  Find customers who placed the most orders
SELECT
    c.customer_id,

    c.customer_name,

    COUNT(o.order_id) AS total_orders

FROM cleaned_customers c

JOIN cleaned_orders o
ON c.customer_id = o.customer_id

GROUP BY
    c.customer_id,
    c.customer_name

ORDER BY total_orders DESC;

-- 2. Top Customers by Revenue   Find customers generating highest revenue
SELECT

    c.customer_id,

    c.customer_name,

    SUM(p.payment_amount) AS total_revenue

FROM cleaned_customers c

JOIN cleaned_orders o
ON c.customer_id = o.customer_id

JOIN cleaned_payments p
ON o.order_id = p.order_id

GROUP BY
    c.customer_id,
    c.customer_name

ORDER BY total_revenue DESC;

-- 3. Customers with No Orders  Find inactive customers

SELECT

    c.customer_id,

    c.customer_name

FROM cleaned_customers c

LEFT JOIN cleaned_orders o
ON c.customer_id = o.customer_id

WHERE o.order_id IS NULL;

-- 4. New Customer Signup Trend    Find customer signup trend month-wise
SELECT

    MONTH(signup_date) AS month_no,

    MONTHNAME(signup_date) AS month_name,

    COUNT(customer_id) AS new_customers

FROM cleaned_customers

GROUP BY

    MONTH(signup_date),

    MONTHNAME(signup_date)

ORDER BY month_no;

-- 5. Repeat Customers       Find customers with multiple orders
SELECT

    customer_id,

    COUNT(order_id) AS total_orders

FROM cleaned_orders

GROUP BY customer_id

HAVING COUNT(order_id) > 1;

-- 6. Customer Lifetime Value   Find total spending of each customer
SELECT

    c.customer_id,

    c.customer_name,

    SUM(p.payment_amount) AS lifetime_value

FROM cleaned_customers c

JOIN cleaned_orders o
ON c.customer_id = o.customer_id

JOIN cleaned_payments p
ON o.order_id = p.order_id

GROUP BY

    c.customer_id,

    c.customer_name

ORDER BY lifetime_value DESC;

-- 7. Average Spend Per Customer    Find average spending by each customer
SELECT

    c.customer_id,

    c.customer_name,

    AVG(p.payment_amount) AS avg_spend

FROM cleaned_customers c

JOIN cleaned_orders o
ON c.customer_id = o.customer_id

JOIN cleaned_payments p
ON o.order_id = p.order_id

GROUP BY

    c.customer_id,

    c.customer_name

ORDER BY avg_spend DESC;

-- 8. Customers Per City   Find number of customers in each city
SELECT

    city,

    COUNT(customer_id) AS total_customers

FROM cleaned_customers

GROUP BY city

ORDER BY total_customers DESC;

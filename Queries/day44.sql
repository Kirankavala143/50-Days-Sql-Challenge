-- USE sql_challenge;

-- Day 44: Basic Analysis
-- Task 1: Total Customers
SELECT COUNT(*) AS total_customers
FROM cleaned_customers;

-- Task 2: Total Orders
SELECT COUNT(*) AS total_orders
FROM cleaned_orders;

-- Task 3: Total Revenue
SELECT SUM(payment_amount) AS total_revenue
FROM cleaned_payments;

-- Task 4: Average Order Value
SELECT AVG(payment_amount) AS avg_order_value
FROM cleaned_payments;

-- Task 5: Total Products Sold
SELECT SUM(quantity) AS total_products_sold
FROM cleaned_order_details;

-- Task 6: Orders Per Customer 
SELECT
    customer_id,
    COUNT(order_id) AS total_orders
FROM cleaned_orders
GROUP BY customer_id
ORDER BY total_orders DESC;
-- USE sql_challenge;

-- ===========================================
-- DAY 49 : ADVANCED ANALYSIS
-- ===========================================

-- 1. Find Top 5 Customers by Revenue using CTE

WITH customer_revenue AS
(
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
)

SELECT *
FROM customer_revenue
ORDER BY total_revenue DESC
LIMIT 5;



-- 2. Find Top 5 Products by Quantity Sold using CTE

WITH product_sales AS
(
    SELECT
        p.product_id,
        p.product_name,
        SUM(od.quantity) AS total_quantity
    FROM cleaned_products p
    JOIN cleaned_order_details od
        ON p.product_id = od.product_id
    GROUP BY
        p.product_id,
        p.product_name
)

SELECT *
FROM product_sales
ORDER BY total_quantity DESC
LIMIT 5;



-- 3. Rank Customers based on Revenue using DENSE_RANK()

SELECT
    c.customer_id,
    c.customer_name,
    SUM(p.payment_amount) AS total_revenue,

    DENSE_RANK() OVER(
        ORDER BY SUM(p.payment_amount) DESC
    ) AS revenue_rank

FROM cleaned_customers c

JOIN cleaned_orders o
    ON c.customer_id = o.customer_id

JOIN cleaned_payments p
    ON o.order_id = p.order_id

GROUP BY
    c.customer_id,
    c.customer_name;



-- 4. Rank Products based on Quantity Sold using RANK()

SELECT
    p.product_id,
    p.product_name,
    SUM(od.quantity) AS total_quantity,

    RANK() OVER(
        ORDER BY SUM(od.quantity) DESC
    ) AS product_rank

FROM cleaned_products p

JOIN cleaned_order_details od
    ON p.product_id = od.product_id

GROUP BY
    p.product_id,
    p.product_name;



-- 5. Find Category-wise Revenue using CTE

WITH category_revenue AS
(
    SELECT
        p.category,
        SUM(od.quantity * p.price) AS total_revenue
    FROM cleaned_products p

    JOIN cleaned_order_details od
        ON p.product_id = od.product_id

    GROUP BY
        p.category
)

SELECT *
FROM category_revenue
ORDER BY total_revenue DESC;



-- 6. Categorize Customers into High / Medium / Low Revenue

SELECT

    c.customer_id,

    c.customer_name,

    SUM(p.payment_amount) AS total_revenue,

    CASE

        WHEN SUM(p.payment_amount) >= 150000
            THEN 'High Revenue'

        WHEN SUM(p.payment_amount) >= 80000
            THEN 'Medium Revenue'

        ELSE 'Low Revenue'

    END AS revenue_category

FROM cleaned_customers c

JOIN cleaned_orders o
    ON c.customer_id = o.customer_id

JOIN cleaned_payments p
    ON o.order_id = p.order_id

GROUP BY
    c.customer_id,
    c.customer_name

ORDER BY total_revenue DESC;



-- 7. Stored Procedure for Customer Revenue Report

DELIMITER $$

CREATE PROCEDURE CustomerRevenueReport()

BEGIN

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

END $$

DELIMITER ;



-- Execute Stored Procedure

CALL CustomerRevenueReport();
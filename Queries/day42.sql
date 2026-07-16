-- USE sql_challenge;


-- CREATE TABLE cleaned_customers AS
-- SELECT * FROM raw_customers;

-- CREATE TABLE cleaned_products AS
-- SELECT * FROM raw_products;

CREATE TABLE cleaned_orders AS
SELECT *
FROM raw_orders;

-- CREATE TABLE cleaned_order_details AS
-- SELECT * FROM raw_order_details;

-- CREATE TABLE cleaned_payments AS
-- SELECT * FROM raw_payments;


-- Step 2: Remove Spaces
-- UPDATE cleaned_customers
-- SET
--     customer_id = TRIM(customer_id),
--     customer_name = TRIM(customer_name),
--     city = TRIM(city),
--     signup_date = TRIM(signup_date);

-- Step 3: Standardize Text
-- UPDATE cleaned_customers
-- SET
--     customer_name = UPPER(customer_name),
--     city = UPPER(city);

 -- Step 4: Replace NULL Values
-- UPDATE cleaned_customers
-- SET city = 'UNKNOWN'
-- WHERE city IS NULL;

-- UPDATE cleaned_customers
-- SET customer_name = 'UNKNOWN'
-- WHERE customer_name IS NULL;

-- UPDATE cleaned_customers
-- SET signup_date = '01-01-2024'
-- WHERE signup_date IS NULL;

-- Step 5: Remove Duplicate Customers
-- DELETE FROM cleaned_customers
-- WHERE customer_id IN (
--     SELECT customer_id
--     FROM (
--         SELECT customer_id,
--                ROW_NUMBER() OVER (
--                    PARTITION BY customer_id
--                    ORDER BY customer_id
--                ) AS rn
--         FROM cleaned_customers
--     ) t
--     WHERE rn > 1
-- );

-- 1. cleaned_products Remove Spaces
-- UPDATE cleaned_products
-- SET
--     product_id = TRIM(product_id),
--     product_name = TRIM(product_name),
--     category = TRIM(category),
--     price = TRIM(price);

-- Standardize Text
-- UPDATE cleaned_products
-- SET
--     product_name = UPPER(product_name),
--     category = UPPER(category);

-- Replace NULL Values
-- UPDATE cleaned_products
-- SET product_name = 'UNKNOWN'
-- WHERE product_name IS NULL;

-- UPDATE cleaned_products
-- SET category = 'UNKNOWN'
-- WHERE category IS NULL;

-- UPDATE cleaned_products
-- SET price = '0'
-- WHERE price IS NULL;

-- Remove Duplicates
-- DELETE FROM cleaned_products
-- WHERE product_id IN (
--     SELECT product_id
--     FROM (
--         SELECT product_id,
--                ROW_NUMBER() OVER(
--                     PARTITION BY product_id
--                     ORDER BY product_id
--                ) rn
--         FROM cleaned_products
--     ) t
--     WHERE rn > 1
-- );

-- 2. cleaned_orders Remove Spaces
-- UPDATE cleaned_orders
-- SET
--     order_id = TRIM(order_id),
--     customer_id = TRIM(customer_id),
--     order_date = TRIM(order_date);

-- Replace NULL Values
-- UPDATE cleaned_orders
-- SET customer_id = '0'
-- WHERE customer_id IS NULL;

-- UPDATE cleaned_orders
-- SET order_date = '01-01-2024'
-- WHERE order_date IS NULL;

-- Remove Duplicates
-- DELETE FROM cleaned_orders
-- WHERE order_id IN (
--     SELECT order_id
--     FROM (
--         SELECT order_id,
--                ROW_NUMBER() OVER(
--                     PARTITION BY order_id
--                     ORDER BY order_id
--                ) rn
--         FROM cleaned_orders
--     ) t
--     WHERE rn > 1
-- );

-- 3. cleaned_order_details Remove Spaces
-- UPDATE cleaned_order_details
-- SET
--     order_detail_id = TRIM(order_detail_id),
--     order_id = TRIM(order_id),
--     product_id = TRIM(product_id),
--     quantity = TRIM(quantity);

-- Replace NULL Values
-- UPDATE cleaned_order_details
-- SET
--     order_detail_id = TRIM(order_detail_id),
--     order_id = TRIM(order_id),
--     product_id = TRIM(product_id),
--     quantity = TRIM(quantity);

--  UPDATE remove duplicates
-- DELETE FROM cleaned_order_details
-- WHERE order_detail_id IN (
--     SELECT order_detail_id
--     FROM (
--         SELECT order_detail_id,
--                ROW_NUMBER() OVER(
--                     PARTITION BY order_detail_id
--                     ORDER BY order_detail_id
--                ) rn
--         FROM cleaned_order_details
--     ) t
--     WHERE rn > 1
-- );

-- 4. cleaned_payments Remove Spaces
-- UPDATE cleaned_payments
-- SET
--     payment_id = TRIM(payment_id),
--     order_id = TRIM(order_id),
--     payment_amount = TRIM(payment_amount),
--     payment_date = TRIM(payment_date);

-- Replace NULL Values
-- UPDATE cleaned_payments
-- SET payment_amount = '0'
-- WHERE payment_amount IS NULL;

-- UPDATE cleaned_payments
-- SET payment_date = '01-01-2024'
-- WHERE payment_date IS NULL;

-- Remove Duplicates
-- DELETE FROM cleaned_payments
-- WHERE payment_id IN (
--     SELECT payment_id
--     FROM (
--         SELECT payment_id,
--                ROW_NUMBER() OVER(
--                     PARTITION BY payment_id
--                     ORDER BY payment_id
--                ) rn
--         FROM cleaned_payments
--     ) t
--     WHERE rn > 1
-- );
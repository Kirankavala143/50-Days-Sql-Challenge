-- USE sql_challenge;

-- -- Step 1: Date Formatting (Payments)
-- UPDATE cleaned_payments
-- SET payment_date =
-- CASE

--     -- DD-MM-YYYY
--     WHEN CAST(SUBSTRING(payment_date,1,2) AS UNSIGNED) > 12
--     THEN DATE_FORMAT(
--         STR_TO_DATE(payment_date,'%d-%m-%Y'),
--         '%Y-%m-%d'
--     )

--     -- MM-DD-YYYY
--     WHEN CAST(SUBSTRING(payment_date,4,2) AS UNSIGNED) > 12
--     THEN DATE_FORMAT(
--         STR_TO_DATE(payment_date,'%m-%d-%Y'),
--         '%Y-%m-%d'
--     )

--     ELSE payment_date

-- END;

-- UPDATE cleaned_payments
-- SET payment_date =
-- DATE_FORMAT(
--     STR_TO_DATE(payment_date,'%d-%m-%Y'),
--     '%Y-%m-%d'
-- );

-- Step 2: Datatype Fix & Constraints
-- -- cleaned_customers
-- ALTER TABLE cleaned_customers
-- MODIFY customer_id INT PRIMARY KEY,
-- MODIFY customer_name VARCHAR(100),
-- MODIFY city VARCHAR(100),
-- MODIFY signup_date DATE;

-- -- cleaned_products
-- ALTER TABLE cleaned_products
-- MODIFY product_id INT PRIMARY KEY,
-- MODIFY product_name VARCHAR(100),
-- MODIFY category VARCHAR(100),
-- MODIFY price DECIMAL(10,2);

-- -- cleaned_orders
-- ALTER TABLE cleaned_orders
-- MODIFY order_id INT PRIMARY KEY,
-- MODIFY customer_id INT,
-- MODIFY order_date DATE;

-- ALTER TABLE cleaned_orders
-- ADD CONSTRAINT fk_customer
-- FOREIGN KEY (customer_id)
-- REFERENCES cleaned_customers(customer_id);

-- -- cleaned_order_details
-- ALTER TABLE cleaned_order_details
-- MODIFY order_detail_id INT PRIMARY KEY,
-- MODIFY order_id INT,
-- MODIFY product_id INT,
-- MODIFY quantity INT;

-- ALTER TABLE cleaned_order_details
-- ADD CONSTRAINT fk_order
-- FOREIGN KEY (order_id)
-- REFERENCES cleaned_orders(order_id);

-- ALTER TABLE cleaned_order_details
-- ADD CONSTRAINT fk_product
-- FOREIGN KEY (product_id)
-- REFERENCES cleaned_products(product_id);

-- -- cleaned_payments
-- ALTER TABLE cleaned_payments
-- MODIFY payment_id INT PRIMARY KEY,
-- MODIFY order_id INT,
-- MODIFY payment_amount DECIMAL(10,2),
-- MODIFY payment_date DATE;

-- ALTER TABLE cleaned_payments
-- ADD CONSTRAINT fk_payment_order
-- FOREIGN KEY (order_id)
-- REFERENCES cleaned_orders(order_id);

SELECT MIN(order_id), MAX(order_id)
FROM cleaned_order_details;
USE sql_challenge;

-- CREATE TABLE cleaned_customers AS
-- SELECT * FROM raw_customers;

-- CREATE TABLE cleaned_orders AS
-- SELECT * FROM raw_orders;

-- CREATE TABLE cleaned_restaurants AS
-- SELECT * FROM raw_restaurants;

-- CREATE TABLE cleaned_menu_items AS
-- SELECT * FROM raw_menu_items;

-- CREATE TABLE cleaned_order_details AS
-- SELECT * FROM raw_order_details;

-- Clean cleaned_customers
-- UPDATE cleaned_customers
-- SET
-- customer_id = TRIM(customer_id),
-- customer_name = TRIM(customer_name),
-- email = TRIM(email),
-- city = TRIM(city),
-- signup_date = TRIM(signup_date);

-- Standardize Text
-- UPDATE cleaned_customers
-- SET
-- customer_name = UPPER(customer_name),
-- city = UPPER(city);

-- Replace NULL Values
-- UPDATE cleaned_customers
-- SET city = 'UNKNOWN'
-- WHERE city IS NULL;

-- UPDATE cleaned_customers
-- SET customer_name = 'UNKNOWN'
-- WHERE customer_name IS NULL;

-- UPDATE cleaned_customers
-- SET email = 'UNKNOWN'
-- WHERE email IS NULL;

-- UPDATE cleaned_customers
-- SET signup_date = '2024-01-01'
-- WHERE signup_date IS NULL;

-- Remove Duplicate Customers
-- DELETE FROM cleaned_customers
-- WHERE customer_id IN
-- (
-- SELECT customer_id
-- FROM
-- (
-- SELECT customer_id,
-- ROW_NUMBER() OVER(
-- PARTITION BY customer_id
-- ORDER BY customer_id
-- ) AS rn
-- FROM cleaned_customers
-- )t
-- WHERE rn > 1
-- );

-- Step 3: Clean Orders
UPDATE cleaned_orders
SET
order_id = TRIM(order_id),
customer_id = TRIM(customer_id),
restaurant_id = TRIM(restaurant_id),
order_date = TRIM(order_date);

UPDATE cleaned_orders
SET order_date='2024-01-01'
WHERE order_date IS NULL;

-- Step 4: Clean Restaurants
UPDATE cleaned_restaurants
SET
restaurant_id = TRIM(restaurant_id),
restaurant_name = TRIM(restaurant_name),
city = TRIM(city),
registration_date = TRIM(registration_date);

UPDATE cleaned_restaurants
SET
restaurant_name = UPPER(restaurant_name),
city = UPPER(city);

-- Step 5: Clean Menu Items
UPDATE cleaned_menu_items
SET
item_id = TRIM(item_id),
restaurant_id = TRIM(restaurant_id),
item_name = TRIM(item_name),
price = TRIM(price);

UPDATE cleaned_menu_items
SET item_name = UPPER(item_name);

-- Step 6: Clean Order Details
UPDATE cleaned_order_details
SET
order_detail_id = TRIM(order_detail_id),
order_id = TRIM(order_id),
item_id = TRIM(item_id),
quantity = TRIM(quantity);


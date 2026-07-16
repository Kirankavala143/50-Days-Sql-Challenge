USE sql_challenge;

CREATE TABLE raw_customers (
    customer_id VARCHAR(50),
    customer_name VARCHAR(100),
    city VARCHAR(50),
    signup_date VARCHAR(50)
);

CREATE TABLE raw_orders (
    order_id VARCHAR(50),
    customer_id VARCHAR(50),
    order_date VARCHAR(50)
);

CREATE TABLE raw_products (
    product_id VARCHAR(50),
    product_name VARCHAR(100),
    category VARCHAR(100),
    price VARCHAR(50)
);

CREATE TABLE raw_order_details (
    order_detail_id VARCHAR(50),
    order_id VARCHAR(50),
    product_id VARCHAR(50),
    quantity VARCHAR(50)
);

CREATE TABLE raw_payments (
    payment_id VARCHAR(50),
    order_id VARCHAR(50),
    payment_amount VARCHAR(50),
    payment_date VARCHAR(50)
);
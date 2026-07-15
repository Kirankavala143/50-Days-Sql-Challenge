-- USE sql_challenge;

create table raw_customers(

customer_id VARCHAR(50),
customer_name varchar(100),
city varchar(50),
sighnup_date varchar(50)

);

create table raw_orders
(order_id varchar(50), customer_id varchar(50), order_date varchar(50));

-- load the ddata uysibng mysql
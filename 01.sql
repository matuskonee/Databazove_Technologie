-- Active: 1790168927777@@127.0.0.1@5432@superstore
-- Active: 1790168927777@@127.0.0.1@5432@Northwind-- Active: 1790168927777@@127.0.0.1@5432@superstore-- Active: 1790168927777@@127.0.0.1@5432@Northwind
CREATE TABLE customers (
    customer_id VARCHAR(20) PRIMARY KEY,
    customer_name VARCHAR(100),
    segment VARCHAR(50),
    country VARCHAR (50),
    region VARCHAR(50)
);
CREATE TABLE products (
    product_id VARCHAR(20) PRIMARY KEY,
    category VARCHAR(50),
    sub_category VARCHAR(50),
    product_name VARCHAR(100)
);
CREATE TABLE orders (
    order_id VARCHAR(20) PRIMARY KEY,
    customer_id VARCHAR(20) REFERENCES customers(customer_id),
    product_id VARCHAR(20) REFERENCES products(product_id),
    order_date DATE, 
    ship_date DATE,
    sales FLOAT,
    quantity INT,
    discount FLOAT,
    profit FLOAT
);

SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;
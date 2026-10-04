-- Active: 1790534484644@@127.0.0.1@5432@datacraftinglab_db
CREATE DATABASE datacraftinglab_db;

CREATE TABLE flourmills_sales (
    sales_id INT PRIMARY KEY NOT NULL,
    sale_date DATE NOT NULL,
    region VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    product_category VARCHAR(100) NOT NULL,
    product_name VARCHAR(150) NOT NULL,
    customer_type VARCHAR(100) NOT NULL,
    customer_id INT NOT NULL,
    quantity_sold INT,
    unit_price DECIMAL(10, 2) NOT NULL,
    discount_rate INT,
    payment_method VARCHAR(100) NOT NULL,
    sales_rep VARCHAR(150) NOT NULL,
    warehouse VARCHAR(100) NOT NULL,
    delivery_status VARCHAR(100) NOT NULL,
    order_channel VARCHAR(100) NOT NULL,
    batch_number INT NOT NULL,
    production_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,

)
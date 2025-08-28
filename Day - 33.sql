-- Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100),
    region VARCHAR(50)
);

-- Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    unit_price DECIMAL(10,2)
);

-- Sales Table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    sale_date DATE,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


-- Insert Customers
INSERT INTO customers (customer_name, region) VALUES
('Alice Johnson', 'North'),
('Bob Smith', 'South'),
('Catherine Lee', 'East'),
('David Brown', 'West'),
('Emily Davis', 'North'),
('Frank Harris', 'South'),
('Grace Miller', 'East'),
('Henry Wilson', 'West'),
('Ivy Moore', 'North'),
('Jack Taylor', 'South');

-- Insert Products
INSERT INTO products (product_name, category, unit_price) VALUES
('Laptop', 'Electronics', 800.00),
('Smartphone', 'Electronics', 600.00),
('Headphones', 'Accessories', 120.00),
('Desk Chair', 'Furniture', 250.00),
('Office Desk', 'Furniture', 400.00),
('Printer', 'Electronics', 300.00),
('Tablet', 'Electronics', 350.00),
('Monitor', 'Electronics', 200.00),
('Keyboard', 'Accessories', 50.00),
('Mouse', 'Accessories', 30.00);

-- Insert Customers
INSERT INTO customers (customer_name, region) VALUES
('Alice Johnson', 'North'),
('Bob Smith', 'South'),
('Charlie Brown', 'East'),
('Diana Prince', 'West'),
('Ethan Hunt', 'North'),
('Fiona Davis', 'South'),
('George Miller', 'East'),
('Hannah Wilson', 'West'),
('Ian Clark', 'North'),
('Julia Roberts', 'South');

-- Insert Products
INSERT INTO products (product_name, category, unit_price) VALUES
('Laptop', 'Electronics', 800.00),
('Smartphone', 'Electronics', 600.00),
('Headphones', 'Accessories', 120.00),
('Keyboard', 'Accessories', 50.00),
('Chair', 'Furniture', 150.00),
('Desk', 'Furniture', 300.00),
('Shoes', 'Fashion', 80.00),
('Jacket', 'Fashion', 200.00),
('Book', 'Stationery', 20.00),
('Pen', 'Stationery', 5.00);

-- Insert Sales (100 records: 50 for 2024, 50 for 2025)
INSERT INTO sales (customer_id, product_id, sale_date, quantity) VALUES
-- 2024 Sales (50 records)
(1, 1, '2024-01-05', 2),
(2, 2, '2024-01-10', 1),
(3, 3, '2024-01-12', 3),
(4, 4, '2024-02-01', 2),
(5, 5, '2024-02-05', 1),
(6, 6, '2024-02-14', 2),
(7, 7, '2024-02-20', 4),
(8, 8, '2024-03-01', 1),
(9, 9, '2024-03-05', 3),
(10, 10, '2024-03-10', 5),
(1, 2, '2024-03-15', 2),
(2, 3, '2024-03-20', 1),
(3, 4, '2024-04-01', 3),
(4, 5, '2024-04-07', 2),
(5, 6, '2024-04-14', 1),
(6, 7, '2024-04-20', 4),
(7, 8, '2024-05-01', 2),
(8, 9, '2024-05-05', 1),
(9, 10, '2024-05-10', 2),
(10, 1, '2024-05-15', 3),
(1, 3, '2024-06-01', 2),
(2, 4, '2024-06-05', 1),
(3, 5, '2024-06-10', 3),
(4, 6, '2024-06-15', 2),
(5, 7, '2024-06-20', 1),
(6, 8, '2024-07-01', 4),
(7, 9, '2024-07-05', 2),
(8, 10, '2024-07-10', 1),
(9, 1, '2024-07-15', 3),
(10, 2, '2024-07-20', 2),
(1, 4, '2024-08-01', 1),
(2, 5, '2024-08-05', 3),
(3, 6, '2024-08-10', 2),
(4, 7, '2024-08-15', 1),
(5, 8, '2024-08-20', 4),
(6, 9, '2024-09-01', 2),
(7, 10, '2024-09-05', 1),
(8, 1, '2024-09-10', 3),
(9, 2, '2024-09-15', 2),
(10, 3, '2024-09-20', 1),
(1, 5, '2024-10-01', 3),
(2, 6, '2024-10-05', 2),
(3, 7, '2024-10-10', 1),
(4, 8, '2024-10-15', 4),
(5, 9, '2024-10-20', 2),
(6, 10, '2024-11-01', 1),
(7, 1, '2024-11-05', 3),
(8, 2, '2024-11-10', 2),
(9, 3, '2024-11-15', 1),
(10, 4, '2024-12-01', 4),

-- 2025 Sales (50 records)
(1, 1, '2025-01-05', 2),
(2, 2, '2025-01-10', 1),
(3, 3, '2025-01-12', 3),
(4, 4, '2025-02-01', 2),
(5, 5, '2025-02-05', 1),
(6, 6, '2025-02-14', 2),
(7, 7, '2025-02-20', 4),
(8, 8, '2025-03-01', 1),
(9, 9, '2025-03-05', 3),
(10, 10, '2025-03-10', 5),
(1, 2, '2025-03-15', 2),
(2, 3, '2025-03-20', 1),
(3, 4, '2025-04-01', 3),
(4, 5, '2025-04-07', 2),
(5, 6, '2025-04-14', 1),
(6, 7, '2025-04-20', 4),
(7, 8, '2025-05-01', 2),
(8, 9, '2025-05-05', 1),
(9, 10, '2025-05-10', 2),
(10, 1, '2025-05-15', 3),
(1, 3, '2025-06-01', 2),
(2, 4, '2025-06-05', 1),
(3, 5, '2025-06-10', 3),
(4, 6, '2025-06-15', 2),
(5, 7, '2025-06-20', 1),
(6, 8, '2025-07-01', 4),
(7, 9, '2025-07-05', 2),
(8, 10, '2025-07-10', 1),
(9, 1, '2025-07-15', 3),
(10, 2, '2025-07-20', 2),
(1, 4, '2025-08-01', 1),
(2, 5, '2025-08-05', 3),
(3, 6, '2025-08-10', 2),
(4, 7, '2025-08-15', 1),
(5, 8, '2025-08-20', 4),
(6, 9, '2025-09-01', 2),
(7, 10, '2025-09-05', 1),
(8, 1, '2025-09-10', 3),
(9, 2, '2025-09-15', 2),
(10, 3, '2025-09-20', 1),
(1, 5, '2025-10-01', 3),
(2, 6, '2025-10-05', 2),
(3, 7, '2025-10-10', 1),
(4, 8, '2025-10-15', 4),
(5, 9, '2025-10-20', 2),
(6, 10, '2025-11-01', 1),
(7, 1, '2025-11-05', 3),
(8, 2, '2025-11-10', 2),
(9, 3, '2025-11-15', 1),
(10, 4, '2025-12-01', 4);



/* Business Question
The Sales Director wants to analyze revenue trends by both Month and Day of the Week. 
Find the total revenue generated per month and also per day of the week (Monday–Sunday) to understand peak business periods.*/


SELECT
    YEAR(sales.sale_date) AS Year,
    MONTHNAME(sales.sale_date) AS Month,
    COALESCE(SUM(CASE WHEN WEEKDAY(sales.sale_date) = 0 THEN products.unit_price * sales.quantity END), 0) AS Monday,
    COALESCE(SUM(CASE WHEN WEEKDAY(sales.sale_date) = 1 THEN products.unit_price * sales.quantity END), 0) AS Tuesday,
    COALESCE(SUM(CASE WHEN WEEKDAY(sales.sale_date) = 2 THEN products.unit_price * sales.quantity END), 0) AS Wednesday,
    COALESCE(SUM(CASE WHEN WEEKDAY(sales.sale_date) = 3 THEN products.unit_price * sales.quantity END), 0) AS Thursday,
    COALESCE(SUM(CASE WHEN WEEKDAY(sales.sale_date) = 4 THEN products.unit_price * sales.quantity END), 0) AS Friday,
    COALESCE(SUM(CASE WHEN WEEKDAY(sales.sale_date) = 5 THEN products.unit_price * sales.quantity END), 0) AS Saturday,
    COALESCE(SUM(CASE WHEN WEEKDAY(sales.sale_date) = 6 THEN products.unit_price * sales.quantity END), 0) AS Sunday
FROM products
INNER JOIN sales ON products.product_id = sales.product_id
GROUP BY YEAR(sales.sale_date), MONTH(sales.sale_date), MONTHNAME(sales.sale_date)
ORDER BY YEAR(sales.sale_date), MONTH(sales.sale_date);


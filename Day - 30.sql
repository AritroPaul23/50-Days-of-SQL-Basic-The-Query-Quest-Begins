CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    region VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    unit_price DECIMAL(10,2)
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    sale_date DATE,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


-- Customers
INSERT INTO customers (customer_id, customer_name, region) VALUES
(1, 'Alice', 'North'),
(2, 'Bob', 'South'),
(3, 'Charlie', 'East'),
(4, 'Diana', 'West'),
(5, 'Ethan', 'North'),
(6, 'Fiona', 'South'),
(7, 'George', 'East'),
(8, 'Hannah', 'West'),
(9, 'Ivy', 'North'),
(10, 'Jack', 'South'),
(11, 'Paul', 'South');

-- Products
INSERT INTO products (product_id, product_name, category, unit_price) VALUES
(1, 'Laptop', 'Electronics', 800.00),
(2, 'Phone', 'Electronics', 500.00),
(3, 'Tablet', 'Electronics', 300.00),
(4, 'Headphones', 'Accessories', 100.00),
(5, 'Mouse', 'Accessories', 40.00),
(6, 'Keyboard', 'Accessories', 60.00),
(7, 'Monitor', 'Electronics', 200.00),
(8, 'Smartwatch', 'Electronics', 150.00),
(9, 'Printer', 'Electronics', 180.00),
(10, 'Charger', 'Accessories', 25.00);

-- Sales (40 rows across customers/products/dates)
INSERT INTO sales (sale_id, customer_id, product_id, sale_date, quantity) VALUES
(1, 1, 1, '2024-01-05', 1),
(2, 1, 4, '2024-02-15', 2),
(3, 1, 2, '2024-03-01', 1),
(4, 3, 3, '2024-03-10', 1),
(5, 3, 7, '2024-04-05', 1),
(6, 4, 6, '2024-04-12', 1),
(7, 5, 5, '2024-05-01', 3),
(8, 6, 8, '2024-05-07', 1),
(9, 6, 1, '2024-06-15', 1),
(10, 7, 9, '2024-06-20', 1),
(11, 8, 2, '2024-07-10', 2),
(12, 8, 10, '2024-07-25', 1),
(13, 9, 3, '2024-08-02', 1),
(14, 9, 4, '2024-08-15', 2),
(15, 10, 5, '2024-09-01', 1),
(16, 4, 6, '2024-09-12', 1),
(17, 3, 8, '2024-09-25', 1),
(18, 4, 9, '2024-10-01', 1),
(19, 5, 7, '2024-10-10', 1),
(20, 6, 1, '2024-10-15', 1),
(21, 7, 2, '2024-11-01', 1),
(22, 8, 3, '2024-11-10', 1),
(23, 9, 4, '2024-11-15', 1),
(24, 10, 6, '2024-11-20', 1),
(25, 1, 7, '2024-12-01', 1),
(26, 8, 8, '2024-12-05', 1),
(27, 3, 9, '2024-12-10', 1),
(28, 4, 10, '2024-12-15', 1),
(29, 5, 1, '2024-12-20', 1),
(30, 6, 2, '2024-12-25', 1),
(31, 7, 3, '2024-12-28', 1),
(32, 8, 4, '2024-12-30', 1),
(33, 9, 5, '2025-01-02', 1),
(34, 10, 6, '2025-01-05', 2),
(35, 1, 8, '2025-01-10', 1),
(36, 6, 9, '2025-01-12', 1),
(37, 3, 10, '2025-01-15', 1),
(38, 4, 1, '2025-01-18', 1),
(39, 5, 2, '2025-01-20', 1),
(40, 6, 3, '2025-01-22', 1);

SELECT * FROM customers;

SELECT * FROM products;

SELECT * FROM sales;

/* Business Question (Complex Version with JOINs)

Find each customer’s most recent purchase date and the name of the product they bought. 
If a customer hasn’t purchased anything, display No Purchases. Use COALESCE to handle missing values."*/

SELECT 
    customers.customer_id,
    customers.customer_name,
    COALESCE(MAX(sales.sale_date), 'No Purchases') AS last_purchase_date,
    COALESCE(
        (
            SELECT products.product_name
            FROM sales s2
            INNER JOIN products ON s2.product_id = products.product_id
            WHERE s2.customer_id = customers.customer_id
            ORDER BY s2.sale_date DESC
            LIMIT 1
        ), 
        'No Purchases'
    ) AS last_product
FROM customers
LEFT JOIN sales 
    ON customers.customer_id = sales.customer_id
GROUP BY customers.customer_id, customers.customer_name
ORDER BY customers.customer_id ASC;

        
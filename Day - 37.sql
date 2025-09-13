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

-- Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    order_date DATE,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Insert Customers
INSERT INTO customers (customer_name, region) VALUES
('Alice Johnson', 'North'),
('Bob Smith', 'East'),
('Charlie Davis', 'West'),
('Diana Carter', 'South'),
('Ethan Brown', 'Central'),
('Fiona Clark', 'North'),
('George Adams', 'East'),
('Hannah Wilson', 'West'),
('Ian Thomas', 'South'),
('Julia White', 'Central');

-- Insert Products
INSERT INTO products (product_name, category, unit_price) VALUES
('Laptop', 'Electronics', 1000.00),
('Headphones', 'Electronics', 150.00),
('Office Chair', 'Furniture', 250.00),
('Desk', 'Furniture', 300.00),
('Smartphone', 'Electronics', 800.00),
('Tablet', 'Electronics', 500.00),
('Coffee Machine', 'Appliances', 200.00),
('Blender', 'Appliances', 120.00),
('Monitor', 'Electronics', 350.00),
('Keyboard', 'Electronics', 80.00);

-- Insert 50 Orders (2024 & 2025 mixed, random customers/products)
INSERT INTO orders (customer_id, product_id, order_date, quantity) VALUES
(1, 1, '2024-01-05', 1),
(1, 2, '2024-02-10', 2),
(1, 5, '2025-01-15', 1),
(2, 3, '2024-03-12', 1),
(2, 4, '2024-04-18', 1),
(2, 2, '2025-02-25', 3),
(3, 5, '2024-01-20', 1),
(3, 1, '2024-05-22', 1),
(3, 9, '2025-03-15', 1),
(4, 6, '2024-02-01', 1),
(4, 7, '2024-06-10', 2),
(4, 3, '2025-01-30', 1),
(5, 8, '2024-01-09', 1),
(5, 2, '2024-07-20', 1),
(5, 1, '2025-03-12', 2),
(6, 4, '2024-03-15', 1),
(6, 6, '2024-08-05', 1),
(6, 9, '2025-02-19', 1),
(7, 1, '2024-01-12', 1),
(7, 3, '2024-02-20', 2),
(7, 5, '2025-03-22', 1),
(8, 10, '2024-01-25', 1),
(8, 9, '2024-09-10', 1),
(8, 8, '2025-04-11', 1),
(9, 2, '2024-02-18', 1),
(9, 4, '2024-05-28', 1),
(9, 6, '2025-01-05', 1),
(10, 7, '2024-01-30', 1),
(10, 1, '2024-03-17', 1),
(10, 5, '2025-02-14', 1),
(1, 6, '2024-06-25', 1),
(2, 7, '2024-07-05', 1),
(3, 8, '2024-08-15', 1),
(4, 9, '2024-09-05', 1),
(5, 10, '2024-10-10', 1),
(6, 1, '2024-11-12', 1),
(7, 2, '2024-12-20', 1),
(8, 3, '2025-01-10', 1),
(9, 4, '2025-03-05', 1),
(10, 5, '2025-04-15', 1),
(1, 7, '2024-04-22', 1),
(2, 8, '2024-05-11', 1),
(3, 9, '2024-06-18', 1),
(4, 10, '2024-07-22', 1),
(5, 1, '2024-08-09', 1),
(6, 2, '2024-09-14', 1),
(7, 3, '2024-10-19', 1),
(8, 4, '2024-11-23', 1),
(9, 5, '2024-12-28', 1),
(10, 6, '2024-12-31', 1);

SELECT * FROM customers;

SELECT * FROM products;

SELECT * FROM orders;


/* Business Question

You work for an e-commerce company that wants to analyze customer behavior.
For each customer, find their first purchase in 2024 (earliest order).
Output the customer_id, order_id, order_date, and product_name.*/

SELECT customer_id,
		order_id,
        order_date,
        product_name
FROM (SELECT customers.customer_id,
		orders.order_id,
        orders.order_date,
        products.product_name,
        ROW_NUMBER() OVER ( PARTITION BY customers.customer_id ORDER BY orders.order_date ASC ) Rnk
FROM customers INNER JOIN orders
		ON customers.customer_id = orders.customer_id
			INNER JOIN products
				ON orders.product_id = products.product_id
WHERE orders.order_date BETWEEN '2024-01-01' AND '2024-12-31') AS temptbl
WHERE Rnk = 1;
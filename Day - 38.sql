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

-- Insert 10 Customers
INSERT INTO customers (customer_name, region) VALUES
('Alice', 'North'),
('Bob', 'South'),
('Charlie', 'East'),
('David', 'West'),
('Eva', 'North'),
('Frank', 'South'),
('Grace', 'East'),
('Helen', 'West'),
('Ian', 'North'),
('Jane', 'South');

-- Insert 10 Products
INSERT INTO products (product_name, category, unit_price) VALUES
('Laptop', 'Electronics', 800),
('Phone', 'Electronics', 500),
('Tablet', 'Electronics', 300),
('Headphones', 'Accessories', 100),
('Monitor', 'Electronics', 250),
('Keyboard', 'Accessories', 50),
('Mouse', 'Accessories', 40),
('Chair', 'Furniture', 150),
('Desk', 'Furniture', 200),
('Printer', 'Electronics', 180);

-- Insert 50 Sales Records (2024 purchases)
INSERT INTO sales (customer_id, product_id, sale_date, quantity) VALUES
(1, 1, '2024-01-05', 1),
(2, 2, '2024-01-07', 2),
(3, 3, '2024-01-10', 3),
(4, 4, '2024-02-02', 1),
(5, 5, '2024-02-14', 2),
(6, 6, '2024-02-21', 4),
(7, 7, '2024-03-03', 1),
(8, 8, '2024-03-08', 2),
(9, 9, '2024-03-11', 1),
(10, 10, '2024-03-15', 3),
(1, 2, '2024-04-01', 1),
(2, 3, '2024-04-05', 2),
(3, 4, '2024-04-09', 3),
(4, 5, '2024-04-13', 1),
(5, 6, '2024-05-04', 2),
(6, 7, '2024-05-08', 3),
(7, 8, '2024-05-10', 1),
(8, 9, '2024-05-14', 2),
(9, 10, '2024-05-20', 3),
(10, 1, '2024-06-01', 1),
(1, 3, '2024-06-05', 2),
(2, 4, '2024-06-08', 1),
(3, 5, '2024-06-11', 2),
(4, 6, '2024-06-15', 1),
(5, 7, '2024-06-18', 3),
(6, 8, '2024-07-01', 2),
(7, 9, '2024-07-05', 1),
(8, 10, '2024-07-07', 2),
(9, 1, '2024-07-10', 1),
(10, 2, '2024-07-15', 2),
(1, 4, '2024-08-02', 3),
(2, 5, '2024-08-07', 2),
(3, 6, '2024-08-10', 1),
(4, 7, '2024-08-15', 2),
(5, 8, '2024-08-20', 1),
(6, 9, '2024-09-01', 2),
(7, 10, '2024-09-05', 3),
(8, 1, '2024-09-07', 1),
(9, 2, '2024-09-11', 2),
(10, 3, '2024-09-15', 3),
(1, 5, '2024-10-01', 1),
(2, 6, '2024-10-05', 2),
(3, 7, '2024-10-09', 3),
(4, 8, '2024-10-12', 1),
(5, 9, '2024-10-20', 2),
(6, 10, '2024-11-02', 1),
(7, 1, '2024-11-05', 2),
(8, 2, '2024-11-07', 3),
(9, 3, '2024-11-10', 1),
(10, 4, '2024-12-01', 2);

SELECT * FROM customers;

SELECT * FROM products;

SELECT * FROM sales;


/* Business Question

A retail company wants to segment customers into 4 spending tiers (quartiles) based on their total purchase amount in 2024. 
Use NTILE(4) to divide customers into quartiles and output each customer’s ID, name, total purchase amount, and spending tier (1 = lowest spenders, 4 = top spenders).*/

SELECT customer_id,
		customer_name,
        total_purchase_amount,
        NTILE(4) OVER ( ORDER BY total_purchase_amount ASC ) AS spending_tier
FROM (SELECT customers.customer_id,
		customers.customer_name,
		SUM(sales.quantity*products.unit_price) AS total_purchase_amount
FROM customers INNER JOIN sales
		ON customers.customer_id = sales.customer_id
				INNER JOIN products
					ON products.product_id = sales.product_id
WHERE sales.sale_date BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY customers.customer_id, customers.customer_name ) AS temptbl;


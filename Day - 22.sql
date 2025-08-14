CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    channel VARCHAR(50),
    sale_date DATE,
    quantity INT,
    unit_price DECIMAL(10,2)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    region VARCHAR(50)
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50)
);


INSERT INTO customers VALUES
(1, 'Alice Johnson', 'North'),
(2, 'Bob Smith', 'South'),
(3, 'Charlie Davis', 'East'),
(4, 'Diana Miller', 'West'),
(5, 'Ethan Brown', 'North'),
(6, 'Fiona Clark', 'South'),
(7, 'George Hall', 'East'),
(8, 'Hannah Young', 'West'),
(9, 'Ian Lee', 'North'),
(10, 'Julia Scott', 'South');


INSERT INTO products VALUES
(1, 'Laptop Pro 15', 'Electronics'),
(2, 'Smartphone X', 'Electronics'),
(3, 'Wireless Headphones', 'Electronics'),
(4, 'Office Chair', 'Furniture'),
(5, 'Standing Desk', 'Furniture'),
(6, 'LED Monitor', 'Electronics'),
(7, 'Blender Plus', 'Home Appliances'),
(8, 'Air Purifier', 'Home Appliances'),
(9, 'Coffee Maker', 'Home Appliances'),
(10, 'Tablet Air', 'Electronics');


INSERT INTO sales (sale_id, customer_id, product_id, channel, sale_date, quantity, unit_price) VALUES
(1, 4, 7, 'Online', '2024-01-03', 4, 850.00),
(2, 1, 5, 'Retail', '2024-01-07', 3, 1200.00),
(3, 7, 3, 'Distributor', '2024-01-10', 5, 500.00),
(4, 9, 8, 'Online', '2024-01-12', 1, 300.00),
(5, 3, 10, 'Retail', '2024-01-14', 2, 1500.00),
(6, 6, 2, 'Online', '2024-01-18', 4, 750.00),
(7, 10, 6, 'Distributor', '2024-01-22', 5, 600.00),
(8, 8, 1, 'Retail', '2024-01-25', 3, 400.00),
(9, 5, 4, 'Online', '2024-01-28', 2, 900.00),
(10, 2, 9, 'Distributor', '2024-02-01', 1, 1100.00),
(11, 7, 5, 'Retail', '2024-02-04', 4, 1200.00),
(12, 4, 3, 'Online', '2024-02-07', 3, 500.00),
(13, 6, 7, 'Distributor', '2024-02-10', 2, 850.00),
(14, 1, 10, 'Online', '2024-02-13', 5, 1500.00),
(15, 3, 1, 'Retail', '2024-02-15', 1, 400.00),
(16, 9, 6, 'Distributor', '2024-02-17', 2, 600.00),
(17, 5, 8, 'Online', '2024-02-20', 4, 300.00),
(18, 10, 2, 'Retail', '2024-02-22', 3, 750.00),
(19, 2, 4, 'Distributor', '2024-02-25', 1, 900.00),
(20, 8, 9, 'Online', '2024-02-28', 5, 1100.00),
(21, 6, 1, 'Distributor', '2024-03-02', 2, 400.00),
(22, 4, 7, 'Retail', '2024-03-05', 3, 850.00),
(23, 7, 3, 'Online', '2024-03-07', 5, 500.00),
(24, 9, 10, 'Distributor', '2024-03-10', 1, 1500.00),
(25, 1, 6, 'Retail', '2024-03-12', 4, 600.00),
(26, 3, 2, 'Online', '2024-03-15', 3, 750.00),
(27, 8, 4, 'Distributor', '2024-03-18', 5, 900.00),
(28, 2, 5, 'Online', '2024-03-21', 1, 1200.00),
(29, 10, 8, 'Retail', '2024-03-24', 2, 300.00),
(30, 5, 9, 'Distributor', '2024-03-26', 4, 1100.00),
(31, 6, 7, 'Online', '2024-03-29', 3, 850.00),
(32, 7, 3, 'Retail', '2024-04-01', 1, 500.00),
(33, 4, 10, 'Distributor', '2024-04-04', 5, 1500.00),
(34, 9, 1, 'Online', '2024-04-07', 2, 400.00),
(35, 1, 6, 'Retail', '2024-04-09', 4, 600.00),
(36, 8, 2, 'Distributor', '2024-04-12', 3, 750.00),
(37, 2, 4, 'Online', '2024-04-15', 1, 900.00),
(38, 10, 5, 'Retail', '2024-04-17', 5, 1200.00),
(39, 5, 8, 'Distributor', '2024-04-20', 2, 300.00),
(40, 3, 9, 'Online', '2024-04-23', 3, 1100.00),
(41, 7, 7, 'Distributor', '2024-04-25', 4, 850.00),
(42, 6, 3, 'Online', '2024-04-28', 5, 500.00),
(43, 4, 10, 'Retail', '2024-05-01', 1, 1500.00),
(44, 9, 6, 'Distributor', '2024-05-03', 2, 600.00),
(45, 1, 2, 'Online', '2024-05-06', 3, 750.00),
(46, 8, 4, 'Retail', '2024-05-09', 5, 900.00),
(47, 2, 5, 'Distributor', '2024-05-12', 1, 1200.00),
(48, 10, 8, 'Online', '2024-05-14', 4, 300.00),
(49, 5, 9, 'Retail', '2024-05-17', 2, 1100.00),
(50, 3, 7, 'Distributor', '2024-05-20', 3, 850.00),
(51, 6, 3, 'Online', '2024-05-22', 5, 500.00),
(52, 7, 10, 'Retail', '2024-05-25', 1, 1500.00),
(53, 4, 1, 'Distributor', '2024-05-28', 2, 400.00),
(54, 9, 6, 'Online', '2024-05-30', 3, 600.00),
(55, 1, 2, 'Retail', '2024-06-02', 4, 750.00),
(56, 8, 4, 'Distributor', '2024-06-05', 1, 900.00),
(57, 2, 5, 'Online', '2024-06-07', 5, 1200.00),
(58, 10, 8, 'Retail', '2024-06-10', 2, 300.00),
(59, 5, 9, 'Distributor', '2024-06-13', 3, 1100.00),
(60, 3, 7, 'Online', '2024-06-15', 4, 850.00),
(61, 7, 3, 'Distributor', '2024-06-18', 5, 500.00),
(62, 6, 10, 'Online', '2024-06-21', 1, 1500.00),
(63, 4, 1, 'Retail', '2024-06-24', 2, 400.00),
(64, 9, 6, 'Distributor', '2024-06-26', 3, 600.00),
(65, 1, 2, 'Online', '2024-06-29', 4, 750.00),
(66, 8, 4, 'Retail', '2024-07-02', 1, 900.00),
(67, 2, 5, 'Distributor', '2024-07-05', 5, 1200.00),
(68, 10, 8, 'Online', '2024-07-07', 2, 300.00),
(69, 5, 9, 'Retail', '2024-07-10', 3, 1100.00),
(70, 3, 7, 'Distributor', '2024-07-13', 4, 850.00),
(71, 6, 3, 'Online', '2024-07-15', 5, 500.00),
(72, 7, 10, 'Retail', '2024-07-18', 1, 1500.00),
(73, 4, 1, 'Distributor', '2024-07-21', 2, 400.00),
(74, 9, 6, 'Online', '2024-07-24', 3, 600.00),
(75, 1, 2, 'Retail', '2024-07-27', 4, 750.00),
(76, 8, 4, 'Distributor', '2024-07-29', 5, 900.00),
(77, 2, 5, 'Online', '2024-08-01', 1, 1200.00),
(78, 10, 8, 'Retail', '2024-08-03', 4, 300.00),
(79, 5, 9, 'Distributor', '2024-08-06', 2, 1100.00),
(80, 3, 7, 'Online', '2024-08-09', 3, 850.00),
(81, 7, 3, 'Distributor', '2024-08-12', 5, 500.00),
(82, 6, 10, 'Online', '2024-08-15', 1, 1500.00),
(83, 4, 1, 'Retail', '2024-08-17', 2, 400.00),
(84, 9, 6, 'Distributor', '2024-08-20', 3, 600.00),
(85, 1, 2, 'Online', '2024-08-23', 4, 750.00),
(86, 8, 4, 'Retail', '2024-08-26', 1, 900.00),
(87, 2, 5, 'Distributor', '2024-08-28', 5, 1200.00),
(88, 10, 8, 'Online', '2024-08-31', 2, 300.00),
(89, 5, 9, 'Retail', '2024-09-02', 3, 1100.00),
(90, 3, 7, 'Distributor', '2024-09-05', 4, 850.00),
(91, 6, 3, 'Online', '2024-09-08', 5, 500.00),
(92, 7, 10, 'Retail', '2024-09-11', 1, 1500.00),
(93, 4, 1, 'Distributor', '2024-09-13', 2, 400.00),
(94, 9, 6, 'Online', '2024-09-16', 3, 600.00),
(95, 1, 2, 'Retail', '2024-09-19', 4, 750.00),
(96, 8, 4, 'Distributor', '2024-09-21', 5, 900.00),
(97, 2, 5, 'Online', '2024-09-24', 1, 1200.00),
(98, 10, 8, 'Retail', '2024-09-27', 4, 300.00),
(99, 5, 9, 'Distributor', '2024-09-29', 2, 1100.00),
(100, 3, 7, 'Online', '2024-09-30', 3, 850.00);


/* Business Question (with subquery in WHERE)

Identify all customers whose total purchase amount in 2024 is above the average total purchase amount of all customers.*/

SELECT * FROM customers;

SELECT * FROM products;

SELECT * FROM sales;

SELECT
	customers.customer_name,
    SUM(sales.quantity*sales.unit_price) AS total_purchase
FROM customers INNER JOIN sales
		ON customers.customer_id = sales.customer_id
WHERE YEAR(sales.sale_date) = 2024
GROUP BY customers.customer_id, customers.customer_name
HAVING total_purchase > (SELECT AVG(total_amount)
							FROM
							( SELECT sales.customer_id,
									SUM(sales.quantity*sales.unit_price) AS total_amount
							FROM sales
                            WHERE YEAR(sales.sale_date) = 2024
                            GROUP BY sales.customer_id) AS temp_tbl)
ORDER BY 2 DESC;

SELECT AVG(total_amount)
							FROM
							( SELECT sales.customer_id,
									SUM(sales.quantity*sales.unit_price) AS total_amount
							FROM sales
                            WHERE YEAR(sales.sale_date) = 2024
                            GROUP BY sales.customer_id) AS temp_tbl;
                            
                            

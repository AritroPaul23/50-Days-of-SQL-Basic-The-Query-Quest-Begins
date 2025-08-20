-- Customers table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    region VARCHAR(50)
);

-- Sales table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_name VARCHAR(100),
    quantity INT,
    unit_price DECIMAL(10,2),
    sale_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


-- Insert 10 customers
INSERT INTO customers (customer_id, customer_name, region) VALUES
(1, 'Alice', 'North'),
(2, 'Bob', 'South'),
(3, 'Charlie', 'East'),
(4, 'David', 'West'),
(5, 'Eva', 'North'),
(6, 'Frank', 'South'),
(7, 'Grace', 'East'),
(8, 'Hannah', 'West'),
(9, 'Ian', 'North'),
(10, 'Jane', 'South');

-- Insert 50 sales records across 2024
INSERT INTO sales (customer_id, product_name, quantity, unit_price, sale_date) VALUES
(1, 'Laptop', 2, 800.00, '2024-01-15'),
(1, 'Phone', 1, 600.00, '2024-02-10'),
(2, 'Tablet', 3, 300.00, '2024-03-05'),
(2, 'Headphones', 2, 150.00, '2024-04-12'),
(3, 'Laptop', 1, 800.00, '2024-05-18'),
(3, 'Monitor', 2, 200.00, '2024-06-25'),
(4, 'Phone', 2, 600.00, '2024-07-07'),
(4, 'Tablet', 1, 300.00, '2024-08-03'),
(5, 'Laptop', 1, 800.00, '2024-09-22'),
(5, 'Headphones', 4, 150.00, '2024-10-01'),
(6, 'Monitor', 3, 200.00, '2024-11-14'),
(6, 'Phone', 1, 600.00, '2024-12-09'),
(7, 'Laptop', 2, 800.00, '2024-01-25'),
(7, 'Tablet', 2, 300.00, '2024-02-18'),
(8, 'Monitor', 1, 200.00, '2024-03-21'),
(8, 'Headphones', 3, 150.00, '2024-04-19'),
(9, 'Phone', 2, 600.00, '2024-05-27'),
(9, 'Laptop', 1, 800.00, '2024-06-13'),
(10, 'Tablet', 3, 300.00, '2024-07-30'),
(10, 'Monitor', 2, 200.00, '2024-08-15'),

-- more to make 50
(1, 'Monitor', 1, 200.00, '2024-09-10'),
(2, 'Laptop', 1, 800.00, '2024-10-05'),
(3, 'Tablet', 2, 300.00, '2024-11-17'),
(4, 'Headphones', 2, 150.00, '2024-12-20'),
(5, 'Phone', 1, 600.00, '2024-01-09'),
(6, 'Laptop', 1, 800.00, '2024-02-14'),
(7, 'Monitor', 2, 200.00, '2024-03-11'),
(8, 'Tablet', 1, 300.00, '2024-04-23'),
(9, 'Headphones', 2, 150.00, '2024-05-16'),
(10, 'Phone', 1, 600.00, '2024-06-29'),
(1, 'Laptop', 1, 800.00, '2024-07-04'),
(2, 'Monitor', 2, 200.00, '2024-08-18'),
(3, 'Headphones', 1, 150.00, '2024-09-26'),
(4, 'Tablet', 1, 300.00, '2024-10-12'),
(5, 'Laptop', 2, 800.00, '2024-11-03'),
(6, 'Phone', 1, 600.00, '2024-12-21'),
(7, 'Tablet', 1, 300.00, '2024-01-14'),
(8, 'Laptop', 1, 800.00, '2024-02-27'),
(9, 'Monitor', 1, 200.00, '2024-03-30'),
(10, 'Headphones', 2, 150.00, '2024-04-07'),
(1, 'Phone', 2, 600.00, '2024-05-19'),
(2, 'Laptop', 1, 800.00, '2024-06-10'),
(3, 'Monitor', 2, 200.00, '2024-07-21'),
(4, 'Laptop', 1, 800.00, '2024-08-29'),
(5, 'Tablet', 2, 300.00, '2024-09-11'),
(6, 'Headphones', 1, 150.00, '2024-10-26'),
(7, 'Phone', 1, 600.00, '2024-11-13'),
(8, 'Monitor', 1, 200.00, '2024-12-28'),
(9, 'Laptop', 1, 800.00, '2024-01-06'),
(10, 'Tablet', 1, 300.00, '2024-02-22');


/* Business Question

Find the Top 3 customers who spent the most in 2024 (total purchase value), using a subquery.*/


SELECT
	customer_id,
    customer_name,
    total_purchase
FROM ( SELECT
			customers.customer_id, 
			customers.customer_name,
			SUM(sales.quantity*sales.unit_price) AS total_purchase
		FROM customers INNER JOIN sales
				ON customers.customer_id = sales.customer_id
		WHERE YEAR(sales.sale_date) = 2024
		GROUP BY customers.customer_id, customers.customer_name ) AS cutomer_total
ORDER BY total_purchase DESC LIMIT 3;

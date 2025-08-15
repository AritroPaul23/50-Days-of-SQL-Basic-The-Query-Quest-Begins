CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    region VARCHAR(50)
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    channel VARCHAR(20), -- Online, Retail, Distributor
    sale_date DATE,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers VALUES
(1, 'Alice', 'North'),
(2, 'Bob', 'East'),
(3, 'Charlie', 'West'),
(4, 'David', 'South'),
(5, 'Evelyn', 'North'),
(6, 'Frank', 'East'),
(7, 'Grace', 'West'),
(8, 'Hannah', 'South'),
(9, 'Ivy', 'North'),
(10, 'Jack', 'East');

INSERT INTO sales VALUES
(1, 1, 'Online', '2024-01-05', 2, 500.00),
(2, 2, 'Retail', '2024-01-12', 1, 700.00),
(3, 3, 'Distributor', '2024-01-15', 3, 200.00),
(4, 4, 'Online', '2024-01-20', 4, 150.00),
(5, 5, 'Retail', '2024-02-02', 1, 1200.00),
(6, 6, 'Online', '2024-02-08', 5, 300.00),
(7, 7, 'Distributor', '2024-02-14', 2, 450.00),
(8, 8, 'Retail', '2024-02-20', 1, 600.00),
(9, 9, 'Online', '2024-03-01', 3, 250.00),
(10, 10, 'Retail', '2024-03-10', 4, 500.00),
(11, 1, 'Online', '2024-03-15', 2, 800.00),
(12, 2, 'Distributor', '2024-03-20', 5, 150.00),
(13, 3, 'Retail', '2024-04-01', 1, 1100.00),
(14, 4, 'Online', '2024-04-05', 2, 900.00),
(15, 5, 'Retail', '2024-04-12', 3, 350.00),
(16, 6, 'Distributor', '2024-04-20', 2, 400.00),
(17, 7, 'Online', '2024-04-28', 1, 950.00),
(18, 8, 'Retail', '2024-05-05', 4, 250.00),
(19, 9, 'Online', '2024-05-12', 5, 300.00),
(20, 10, 'Distributor', '2024-05-18', 2, 500.00),
(21, 1, 'Retail', '2024-05-25', 1, 850.00),
(22, 2, 'Online', '2024-06-01', 3, 600.00),
(23, 3, 'Distributor', '2024-06-07', 4, 220.00),
(24, 4, 'Retail', '2024-06-15', 2, 950.00),
(25, 5, 'Online', '2024-06-20', 1, 1250.00),
(26, 6, 'Retail', '2024-07-01', 5, 200.00),
(27, 7, 'Online', '2024-07-08', 3, 500.00),
(28, 8, 'Distributor', '2024-07-15', 2, 400.00),
(29, 9, 'Retail', '2024-07-22', 1, 1350.00),
(30, 10, 'Online', '2024-07-30', 4, 275.00),
(31, 1, 'Distributor', '2024-08-05', 3, 350.00),
(32, 2, 'Online', '2024-08-12', 2, 650.00),
(33, 3, 'Retail', '2024-08-20', 1, 950.00),
(34, 4, 'Distributor', '2024-08-28', 5, 180.00),
(35, 5, 'Online', '2024-09-01', 2, 1050.00),
(36, 6, 'Retail', '2024-09-10', 3, 450.00),
(37, 7, 'Online', '2024-09-15', 1, 1200.00),
(38, 8, 'Distributor', '2024-09-22', 4, 210.00),
(39, 9, 'Retail', '2024-09-30', 2, 750.00),
(40, 10, 'Online', '2024-10-05', 5, 300.00),
(41, 1, 'Retail', '2024-10-12', 1, 1150.00),
(42, 2, 'Distributor', '2024-10-20', 2, 500.00),
(43, 3, 'Online', '2024-10-25', 3, 700.00),
(44, 4, 'Retail', '2024-11-01', 4, 250.00),
(45, 5, 'Distributor', '2024-11-10', 5, 200.00),
(46, 6, 'Online', '2024-11-18', 2, 800.00),
(47, 7, 'Retail', '2024-11-25', 1, 1300.00),
(48, 8, 'Online', '2024-12-01', 3, 600.00),
(49, 9, 'Distributor', '2024-12-10', 2, 450.00),
(50, 10, 'Retail', '2024-12-20', 4, 500.00);


/* Business Question
Which sales channels have customers whose average order value is above the overall company average order value in 2024?*/

SELECT * FROM customers;

SELECT * FROM sales;

SELECT
	sales.`channel`,
    COUNT(DISTINCT temp_tbl.customer_id) AS high_value_customers
FROM (SELECT
	customers.customer_id,
	customers.customer_name,
    AVG(sales.quantity*sales.unit_price) AS Avg_Order_Value_per_Customer
FROM customers INNER JOIN sales
		ON customers.customer_id = sales .customer_id
WHERE sales.sale_date BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY customers.customer_id, customers.customer_name
HAVING Avg_Order_Value_per_Customer > ( SELECT AVG(s2.quantity*s2.unit_price)
											FROM sales AS s2)) AS temp_tbl
	INNER JOIN sales
		ON temp_tbl.customer_id = sales.customer_id
GROUP BY sales.`channel`;

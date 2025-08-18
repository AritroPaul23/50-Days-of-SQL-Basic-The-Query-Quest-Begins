CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    region VARCHAR(50)
);


CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(100),
    channel VARCHAR(50),
    sale_date DATE,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


INSERT INTO customers VALUES
(1, 'Alice', 'North'),
(2, 'Bob', 'South'),
(3, 'Charlie', 'East'),
(4, 'Diana', 'West'),
(5, 'Ethan', 'North'),
(6, 'Fiona', 'South'),
(7, 'George', 'East'),
(8, 'Hannah', 'West'),
(9, 'Ian', 'North'),
(10, 'Julia', 'South');


INSERT INTO sales VALUES
(1, 1, 'Laptop', 'Online', '2024-01-15', 1, 1200.00),
(2, 1, 'Mouse', 'Retail', '2024-02-10', 2, 25.00),
(3, 2, 'Keyboard', 'Distributor', '2024-02-12', 1, 45.00),
(4, 2, 'Monitor', 'Retail', '2024-03-05', 1, 200.00),
(5, 3, 'Tablet', 'Online', '2024-03-18', 1, 350.00),
(6, 3, 'Laptop', 'Distributor', '2024-04-01', 1, 1150.00),
(7, 4, 'Headphones', 'Online', '2024-04-20', 2, 150.00),
(8, 5, 'Smartphone', 'Online', '2024-05-10', 1, 800.00),
(9, 6, 'Mouse', 'Retail', '2024-05-22', 3, 30.00),
(10, 7, 'Monitor', 'Online', '2024-06-15', 1, 220.00),
(11, 7, 'Keyboard', 'Online', '2024-06-18', 1, 50.00),
(12, 8, 'Tablet', 'Retail', '2024-07-05', 1, 400.00),
(13, 9, 'Laptop', 'Online', '2024-07-15', 1, 1300.00),
(14, 10, 'Smartphone', 'Retail', '2024-08-01', 1, 750.00),
(15, 1, 'Headphones', 'Online', '2024-08-10', 1, 180.00),
(16, 2, 'Mouse', 'Distributor', '2024-08-18', 2, 28.00),
(17, 4, 'Laptop', 'Retail', '2024-09-05', 1, 1100.00),
(18, 5, 'Tablet', 'Online', '2024-09-15', 1, 370.00),
(19, 6, 'Smartphone', 'Online', '2024-10-01', 1, 820.00),
(20, 7, 'Laptop', 'Retail', '2024-10-10', 1, 1250.00),
(21, 8, 'Monitor', 'Online', '2024-10-20', 1, 210.00),
(22, 9, 'Headphones', 'Retail', '2024-11-05', 1, 160.00),
(23, 10, 'Keyboard', 'Online', '2024-11-18', 1, 55.00),
(24, 1, 'Smartphone', 'Retail', '2024-11-25', 1, 770.00),
(25, 3, 'Tablet', 'Online', '2024-12-01', 1, 380.00),
(26, 4, 'Mouse', 'Distributor', '2024-12-05', 2, 30.00),
(27, 5, 'Laptop', 'Retail', '2024-12-10', 1, 1250.00),
(28, 6, 'Tablet', 'Online', '2024-12-15', 1, 360.00),
(29, 7, 'Smartphone', 'Retail', '2024-12-20', 1, 780.00),
(30, 8, 'Laptop', 'Online', '2024-12-25', 1, 1400.00),
(31, 9, 'Mouse', 'Online', '2024-12-28', 2, 32.00),
(32, 10, 'Tablet', 'Online', '2024-12-30', 1, 390.00),
(33, 2, 'Headphones', 'Retail', '2024-03-22', 1, 155.00),
(34, 3, 'Smartphone', 'Online', '2024-04-12', 1, 850.00),
(35, 6, 'Laptop', 'Distributor', '2024-06-01', 1, 1200.00),
(36, 8, 'Keyboard', 'Retail', '2024-07-15', 1, 48.00),
(37, 9, 'Tablet', 'Distributor', '2024-09-22', 1, 365.00),
(38, 5, 'Mouse', 'Online', '2024-10-18', 2, 29.00),
(39, 7, 'Headphones', 'Online', '2024-11-02', 1, 175.00),
(40, 10, 'Laptop', 'Distributor', '2024-12-12', 1, 1350.00);


/* Business Question

Find all customers who placed at least one order in 2024 but do not have any orders through the 'Distributor' channel.*/

SELECT * FROM customers;

SELECT * FROM sales;

SELECT
	customers.customer_id,
    customers.customer_name
FROM customers 
WHERE EXISTS ( SELECT customers.customer_id
				FROM sales
                WHERE sale_date BETWEEN '2024-01-01' AND '2024-12-31'
						AND
					  customers.customer_id = sales.customer_id )
		AND
			NOT EXISTS ( SELECT customers.customer_id
							FROM sales
                            WHERE `channel` = 'Distributor'
									AND
								   sale_date BETWEEN '2024-01-01' AND '2024-12-31'
									AND
								   customers.customer_id = sales.customer_id );


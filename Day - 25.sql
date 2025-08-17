-- Product master table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(30),
    unit_price DECIMAL(10,2)
);

-- Sales transactions
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    channel VARCHAR(30),
    sale_date DATE,
    quantity INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


INSERT INTO products (product_id, product_name, category, unit_price) VALUES
(1, 'Laptop A', 'Electronics', 800.00),
(2, 'Laptop B', 'Electronics', 950.00),
(3, 'Smartphone A', 'Electronics', 500.00),
(4, 'Smartphone B', 'Electronics', 650.00),
(5, 'Headphones', 'Accessories', 150.00),
(6, 'Keyboard', 'Accessories', 70.00),
(7, 'Chair', 'Furniture', 200.00),
(8, 'Desk', 'Furniture', 300.00),
(9, 'Monitor', 'Electronics', 400.00),
(10, 'Mouse', 'Accessories', 40.00);


INSERT INTO sales (sale_id, product_id, channel, sale_date, quantity) VALUES
(1, 1, 'Online', '2024-01-10', 5),
(2, 2, 'Retail Store', '2024-01-15', 3),
(3, 3, 'Discount Store', '2024-01-18', 7),
(4, 4, 'Online', '2024-02-05', 4),
(5, 5, 'Retail Store', '2024-02-08', 10),
(6, 6, 'Discount Store', '2024-02-12', 15),
(7, 7, 'Retail Store', '2024-02-14', 2),
(8, 8, 'Online', '2024-02-20', 6),
(9, 9, 'Discount Store', '2024-02-25', 8),
(10, 10, 'Online', '2024-03-01', 20),

(11, 1, 'Retail Store', '2024-03-05', 1),
(12, 2, 'Online', '2024-03-08', 4),
(13, 3, 'Discount Store', '2024-03-12', 9),
(14, 4, 'Retail Store', '2024-03-16', 3),
(15, 5, 'Discount Store', '2024-03-20', 11),
(16, 6, 'Online', '2024-03-22', 12),
(17, 7, 'Retail Store', '2024-03-26', 5),
(18, 8, 'Discount Store', '2024-03-29', 2),
(19, 9, 'Online', '2024-04-01', 7),
(20, 10, 'Retail Store', '2024-04-04', 8),

(21, 1, 'Discount Store', '2024-04-07', 2),
(22, 2, 'Online', '2024-04-10', 3),
(23, 3, 'Retail Store', '2024-04-14', 6),
(24, 4, 'Discount Store', '2024-04-18', 2),
(25, 5, 'Online', '2024-04-20', 14),
(26, 6, 'Retail Store', '2024-04-22', 7),
(27, 7, 'Discount Store', '2024-04-25', 4),
(28, 8, 'Online', '2024-04-28', 8),
(29, 9, 'Retail Store', '2024-05-01', 3),
(30, 10, 'Discount Store', '2024-05-04', 5),

(31, 1, 'Online', '2024-05-07', 6),
(32, 2, 'Retail Store', '2024-05-10', 2),
(33, 3, 'Discount Store', '2024-05-12', 4),
(34, 4, 'Online', '2024-05-15', 3),
(35, 5, 'Retail Store', '2024-05-18', 9),
(36, 6, 'Discount Store', '2024-05-20', 10),
(37, 7, 'Online', '2024-05-22', 5),
(38, 8, 'Retail Store', '2024-05-25', 2),
(39, 9, 'Discount Store', '2024-05-28', 6),
(40, 10, 'Online', '2024-05-30', 15),

(41, 1, 'Retail Store', '2024-06-01', 2),
(42, 2, 'Online', '2024-06-04', 3),
(43, 3, 'Discount Store', '2024-06-07', 5),
(44, 4, 'Retail Store', '2024-06-10', 4),
(45, 5, 'Discount Store', '2024-06-12', 6),
(46, 6, 'Online', '2024-06-15', 7),
(47, 7, 'Discount Store', '2024-06-18', 3),
(48, 8, 'Online', '2024-06-20', 9),
(49, 9, 'Retail Store', '2024-06-22', 4),
(50, 10, 'Discount Store', '2024-06-25', 11);


/* Business Question (Real-Life Style)

Find all products whose price is higher than the price of all products in the 'Discount Store' channel, 
and also find products whose price is greater than the price of any product in the 'Online' channel.*/

SELECT * FROM products;

SELECT * FROM sales;

SELECT
	product_name,
    unit_price
FROM products
WHERE unit_price > ALL ( SELECT DISTINCT products.unit_price
							FROM sales INNER JOIN products
									ON sales.product_id = products.product_id
							WHERE sales.`channel` = 'Discount Store');

SELECT
	product_name,
    unit_price
FROM products
WHERE unit_price > ANY ( SELECT
								DISTINCT products.unit_price
							FROM sales INNER JOIN products
									ON sales.product_id = products.product_id
							WHERE sales.`channel` = 'Online' );
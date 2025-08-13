CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(30),
    price DECIMAL(10,2)
);

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    region VARCHAR(30)
);

CREATE TABLE sales_channels (
    channel_id INT PRIMARY KEY,
    channel_name VARCHAR(30)
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    customer_id INT,
    channel_id INT,
    sale_date DATE,
    quantity INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (channel_id) REFERENCES sales_channels(channel_id)
);


INSERT INTO sales_channels VALUES
(1, 'Online'),
(2, 'Retail'),
(3, 'Distributor');

INSERT INTO products VALUES
(1, 'Laptop A', 'Electronics', 55000),
(2, 'Laptop B', 'Electronics', 65000),
(3, 'Phone X', 'Electronics', 30000),
(4, 'Phone Y', 'Electronics', 25000),
(5, 'Headphones Z', 'Accessories', 5000),
(6, 'Smartwatch S', 'Accessories', 15000),
(7, 'Tablet M', 'Electronics', 28000),
(8, 'Backpack Pro', 'Bags', 4000),
(9, 'Camera C', 'Electronics', 45000),
(10, 'Shoes R', 'Fashion', 3500);

INSERT INTO customers VALUES
(1, 'Amit Kumar', 'North'),
(2, 'Priya Singh', 'South'),
(3, 'Rohit Sharma', 'East'),
(4, 'Neha Verma', 'West'),
(5, 'Karan Patel', 'North'),
(6, 'Divya Iyer', 'South'),
(7, 'Vikas Gupta', 'East'),
(8, 'Sneha Das', 'West'),
(9, 'Manish Mehta', 'North'),
(10, 'Pooja Rani', 'South');

INSERT INTO sales (sale_id, product_id, customer_id, channel_id, sale_date, quantity) VALUES
(1, 3, 7, 1, '2024-01-05', 4),
(2, 5, 2, 2, '2024-01-09', 2),
(3, 1, 9, 3, '2024-01-15', 6),
(4, 8, 4, 1, '2024-01-19', 3),
(5, 6, 1, 2, '2024-01-25', 5),
(6, 2, 8, 3, '2024-01-28', 1),
(7, 10, 5, 1, '2024-02-02', 4),
(8, 7, 3, 2, '2024-02-08', 2),
(9, 4, 6, 3, '2024-02-11', 3),
(10, 9, 10, 1, '2024-02-17', 5),
(11, 3, 2, 2, '2024-02-21', 6),
(12, 5, 7, 3, '2024-02-25', 1),
(13, 8, 4, 1, '2024-02-29', 2),
(14, 6, 9, 2, '2024-03-03', 4),
(15, 2, 8, 3, '2024-03-09', 3),
(16, 1, 1, 1, '2024-03-12', 5),
(17, 7, 5, 2, '2024-03-16', 6),
(18, 4, 3, 3, '2024-03-20', 2),
(19, 9, 6, 1, '2024-03-25', 1),
(20, 10, 10, 2, '2024-03-29', 3),
(21, 3, 8, 3, '2024-04-04', 5),
(22, 5, 9, 1, '2024-04-09', 4),
(23, 1, 4, 2, '2024-04-14', 3),
(24, 8, 2, 3, '2024-04-18', 2),
(25, 6, 7, 1, '2024-04-22', 6),
(26, 2, 3, 2, '2024-04-26', 1),
(27, 7, 1, 3, '2024-05-01', 2),
(28, 4, 10, 1, '2024-05-05', 5),
(29, 9, 8, 2, '2024-05-10', 3),
(30, 10, 6, 3, '2024-05-14', 4),
(31, 3, 5, 1, '2024-05-19', 1),
(32, 5, 2, 2, '2024-05-23', 2),
(33, 1, 9, 3, '2024-05-27', 6),
(34, 8, 4, 1, '2024-06-01', 3),
(35, 6, 1, 2, '2024-06-05', 5),
(36, 2, 8, 3, '2024-06-10', 1),
(37, 7, 5, 1, '2024-06-14', 4),
(38, 4, 3, 2, '2024-06-18', 2),
(39, 9, 6, 3, '2024-06-22', 3),
(40, 10, 10, 1, '2024-06-27', 5),
(41, 3, 2, 2, '2024-07-02', 6),
(42, 5, 7, 3, '2024-07-06', 1),
(43, 8, 4, 1, '2024-07-10', 2),
(44, 6, 9, 2, '2024-07-15', 4),
(45, 2, 8, 3, '2024-07-20', 3),
(46, 1, 1, 1, '2024-07-25', 5),
(47, 7, 5, 2, '2024-07-29', 6),
(48, 4, 3, 3, '2024-08-02', 2),
(49, 9, 6, 1, '2024-08-07', 1),
(50, 10, 10, 2, '2024-08-12', 3),
(51, 3, 8, 3, '2024-08-16', 5),
(52, 5, 9, 1, '2024-08-20', 4),
(53, 1, 4, 2, '2024-08-25', 3),
(54, 8, 2, 3, '2024-08-30', 2),
(55, 6, 7, 1, '2024-09-04', 6),
(56, 2, 3, 2, '2024-09-09', 1),
(57, 7, 1, 3, '2024-09-14', 2),
(58, 4, 10, 1, '2024-09-18', 5),
(59, 9, 8, 2, '2024-09-23', 3),
(60, 10, 6, 3, '2024-09-27', 4),
(61, 3, 5, 1, '2024-10-01', 1),
(62, 5, 2, 2, '2024-10-05', 2),
(63, 1, 9, 3, '2024-10-10', 6),
(64, 8, 4, 1, '2024-10-15', 3),
(65, 6, 1, 2, '2024-10-19', 5),
(66, 2, 8, 3, '2024-10-23', 1),
(67, 7, 5, 1, '2024-10-27', 4),
(68, 4, 3, 2, '2024-11-01', 2),
(69, 9, 6, 3, '2024-11-05', 3),
(70, 10, 10, 1, '2024-11-09', 5),
(71, 3, 2, 2, '2024-11-14', 6),
(72, 5, 7, 3, '2024-11-18', 1),
(73, 8, 4, 1, '2024-11-22', 2),
(74, 6, 9, 2, '2024-11-26', 4),
(75, 2, 8, 3, '2024-11-30', 3),
(76, 1, 1, 1, '2024-12-04', 5),
(77, 7, 5, 2, '2024-12-08', 6),
(78, 4, 3, 3, '2024-12-12', 2),
(79, 9, 6, 1, '2024-12-16', 1),
(80, 10, 10, 2, '2024-12-20', 3),
(81, 3, 8, 3, '2024-12-24', 5),
(82, 5, 9, 1, '2024-12-28', 4),
(83, 1, 4, 2, '2024-01-07', 3),
(84, 8, 2, 3, '2024-02-13', 2),
(85, 6, 7, 1, '2024-03-15', 6),
(86, 2, 3, 2, '2024-04-19', 1),
(87, 7, 1, 3, '2024-05-22', 2),
(88, 4, 10, 1, '2024-06-26', 5),
(89, 9, 8, 2, '2024-07-30', 3),
(90, 10, 6, 3, '2024-08-15', 4),
(91, 3, 5, 1, '2024-09-19', 1),
(92, 5, 2, 2, '2024-10-23', 2),
(93, 1, 9, 3, '2024-11-27', 6),
(94, 8, 4, 1, '2024-12-31', 3),
(95, 6, 1, 2, '2024-01-11', 5),
(96, 2, 8, 3, '2024-02-16', 1),
(97, 7, 5, 1, '2024-03-21', 4),
(98, 4, 3, 2, '2024-04-25', 2),
(99, 9, 6, 3, '2024-05-29', 3),
(100, 10, 10, 1, '2024-06-04', 5);

/*Business Question
Which product categories generate the highest revenue per sales channel, and how does this change month-by-month?*/


SELECT 
    sc.channel_name,
    p.category,
    MONTH(s.sale_date) AS month_number,
    MONTHNAME( s.sale_date ) AS sale_month,
    SUM(s.quantity * p.price) AS total_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
JOIN sales_channels sc ON s.channel_id = sc.channel_id
GROUP BY sc.channel_name, p.category, MONTH(s.sale_date), MONTHNAME( s.sale_date )
ORDER BY sc.channel_name, MONTH(s.sale_date) ASC;

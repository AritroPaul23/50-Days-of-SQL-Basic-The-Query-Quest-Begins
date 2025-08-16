CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    region VARCHAR(50)
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(100),
    quantity INT,
    unit_price DECIMAL(10,2),
    sale_date DATE,
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
(1, 1, 'Laptop', 1, 1000, '2024-01-15'),
(2, 2, 'Mobile', 2, 500, '2024-01-20'),
(3, 3, 'Tablet', 1, 700, '2024-02-05'),
(4, 4, 'Laptop', 1, 1200, '2024-02-18'),
(5, 5, 'Headphones', 3, 150, '2024-02-25'),
(6, 6, 'Mobile', 2, 600, '2024-03-05'),
(7, 7, 'Laptop', 1, 1100, '2024-03-12'),
(8, 8, 'Tablet', 2, 750, '2024-03-18'),
(9, 9, 'Laptop', 1, 1300, '2024-03-25'),
(10, 10, 'Mobile', 3, 400, '2024-04-01'),
(11, 1, 'Headphones', 2, 200, '2024-04-10'),
(12, 2, 'Laptop', 1, 1150, '2024-04-20'),
(13, 3, 'Tablet', 2, 650, '2024-04-25'),
(14, 4, 'Mobile', 1, 550, '2024-05-02'),
(15, 5, 'Laptop', 1, 1250, '2024-05-10'),
(16, 6, 'Tablet', 1, 700, '2024-05-15'),
(17, 7, 'Mobile', 2, 450, '2024-05-22'),
(18, 8, 'Laptop', 1, 1350, '2024-06-01'),
(19, 9, 'Headphones', 4, 180, '2024-06-05'),
(20, 10, 'Tablet', 2, 720, '2024-06-10'),
(21, 1, 'Mobile', 1, 520, '2024-06-20'),
(22, 2, 'Laptop', 1, 1400, '2024-06-25'),
(23, 3, 'Headphones', 3, 160, '2024-07-01'),
(24, 4, 'Tablet', 2, 680, '2024-07-10'),
(25, 5, 'Mobile', 1, 490, '2024-07-18'),
(26, 6, 'Laptop', 1, 1280, '2024-07-25'),
(27, 7, 'Tablet', 1, 740, '2024-08-05'),
(28, 8, 'Headphones', 2, 170, '2024-08-12'),
(29, 9, 'Mobile', 2, 530, '2024-08-18'),
(30, 10, 'Laptop', 1, 1320, '2024-08-25'),
(31, 1, 'Tablet', 1, 710, '2024-09-01'),
(32, 2, 'Headphones', 2, 190, '2024-09-10'),
(33, 3, 'Laptop', 1, 1450, '2024-09-15'),
(34, 4, 'Mobile', 2, 560, '2024-09-20'),
(35, 5, 'Tablet', 1, 780, '2024-09-28'),
(36, 6, 'Headphones', 3, 200, '2024-10-01'),
(37, 7, 'Laptop', 1, 1500, '2024-10-10'),
(38, 8, 'Mobile', 1, 600, '2024-10-18'),
(39, 9, 'Tablet', 2, 750, '2024-10-25'),
(40, 10, 'Laptop', 1, 1550, '2024-11-01'),
(41, 1, 'Mobile', 2, 480, '2024-11-10'),
(42, 2, 'Laptop', 1, 1380, '2024-11-18'),
(43, 3, 'Tablet', 1, 720, '2024-11-25'),
(44, 4, 'Headphones', 2, 210, '2024-12-01'),
(45, 5, 'Laptop', 1, 1600, '2024-12-10'),
(46, 6, 'Mobile', 1, 590, '2024-12-15'),
(47, 7, 'Tablet', 2, 780, '2024-12-20'),
(48, 8, 'Laptop', 1, 1700, '2024-12-25'),
(49, 9, 'Mobile', 1, 610, '2024-12-28'),
(50, 10, 'Tablet', 1, 800, '2024-12-30');


/*Business Question (Industry-Style, Tricky)

For each customer, show their total purchases in 2024 along with the company-wide average purchase amount per customer
(so we can compare each customer vs the overall benchmark).*/

SELECT * FROM customers;

SELECT * FROM sales;

SELECT
	customers.customer_id,
	customers.customer_name,
    SUM(sales.quantity*sales.unit_price) AS total_purchase,
    (SELECT ROUND(AVG(total_per_customer),2)
		FROM ( 
				SELECT SUM(sales.quantity*sales.unit_price) AS total_per_customer
				FROM sales
                WHERE sales.sale_date BETWEEN '2024-01-01' AND '2024-12-31'
				GROUP BY customer_id
                ) AS avg_tbl 
                ) AS overall_avg_purchase_per_customer
FROM customers INNER JOIN sales
		ON customers.customer_id = sales.customer_id
WHERE sales.sale_date BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY customers.customer_id, customers.customer_name;

SELECT
    c.customer_id,
    c.customer_name,
    SUM(s.quantity * s.unit_price) AS total_purchase_2024,
    (SELECT AVG(total_per_customer)
     FROM (
         SELECT SUM(quantity*unit_price) AS total_per_customer
         FROM sales
         WHERE YEAR(sale_date) = 2024
         GROUP BY customer_id
     ) AS avg_tbl
    ) AS overall_avg_purchase_per_customer
FROM customers c
JOIN sales s
    ON c.customer_id = s.customer_id
WHERE YEAR(s.sale_date) = 2024
GROUP BY c.customer_id, c.customer_name;

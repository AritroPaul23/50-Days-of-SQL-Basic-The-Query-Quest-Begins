CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);


CREATE TABLE sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_name VARCHAR(100),
    quantity INT,
    unit_price DECIMAL(10,2),
    sale_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


-- Customers
INSERT INTO customers (customer_id, customer_name) VALUES
(1, 'Alice'), (2, 'Bob'), (3, 'Charlie'), (4, 'Diana'), (5, 'Ethan');

-- Sales (spread across months in 2024)
INSERT INTO sales (customer_id, product_name, quantity, unit_price, sale_date) VALUES
(1, 'Laptop', 1, 1000, '2024-01-15'),
(1, 'Mouse', 2, 25, '2024-02-10'),
(1, 'Keyboard', 1, 45, '2024-03-05'),
(2, 'Monitor', 1, 200, '2024-01-20'),
(2, 'Laptop', 1, 950, '2024-04-15'),
(2, 'Mouse', 3, 20, '2024-04-25'),
(3, 'Tablet', 1, 500, '2024-02-12'),
(3, 'Laptop', 1, 1200, '2024-05-18'),
(3, 'Headphones', 2, 80, '2024-06-22'),
(3, 'Keyboard', 1, 40, '2024-07-10'),
(4, 'Monitor', 2, 180, '2024-03-03'),
(4, 'Laptop', 1, 1100, '2024-05-05'),
(4, 'Mouse', 1, 25, '2024-08-14'),
(4, 'Keyboard', 1, 50, '2024-08-28'),
(5, 'Tablet', 1, 600, '2024-01-07'),
(5, 'Laptop', 1, 1050, '2024-02-16'),
(5, 'Monitor', 1, 220, '2024-05-09'),
(5, 'Mouse', 2, 20, '2024-06-11'),
(5, 'Keyboard', 1, 55, '2024-09-20'),
(1, 'Monitor', 1, 210, '2024-10-02'),
(2, 'Keyboard', 1, 50, '2024-11-22'),
(3, 'Mouse', 2, 25, '2024-12-15'),
(4, 'Tablet', 1, 650, '2024-09-05'),
(5, 'Headphones', 1, 90, '2024-12-29'),

-- Add extra rows to reach ~50 for realism
(1, 'Headphones', 1, 85, '2024-04-10'),
(1, 'Tablet', 1, 700, '2024-06-05'),
(2, 'Monitor', 1, 250, '2024-07-18'),
(2, 'Tablet', 1, 550, '2024-09-22'),
(3, 'Laptop', 1, 1300, '2024-11-11'),
(4, 'Mouse', 2, 25, '2024-12-02'),
(5, 'Monitor', 2, 240, '2024-07-25'),
(1, 'Laptop', 1, 1150, '2024-08-08'),
(2, 'Headphones', 1, 95, '2024-03-12'),
(3, 'Tablet', 1, 620, '2024-10-19'),
(4, 'Keyboard', 2, 60, '2024-11-28'),
(5, 'Mouse', 1, 22, '2024-03-30'),
(1, 'Monitor', 1, 230, '2024-05-27'),
(2, 'Laptop', 1, 980, '2024-06-09'),
(3, 'Keyboard', 1, 48, '2024-02-20'),
(4, 'Headphones', 1, 100, '2024-04-16'),
(5, 'Tablet', 1, 650, '2024-08-03'),
(1, 'Mouse', 2, 27, '2024-11-15'),
(2, 'Keyboard', 1, 55, '2024-10-06'),
(3, 'Monitor', 1, 260, '2024-01-28'),
(4, 'Laptop', 1, 1200, '2024-02-25'),
(5, 'Headphones', 1, 92, '2024-06-15'),
(1, 'Tablet', 1, 720, '2024-12-20');


/* Business Question

A retail company wants to see each customer’s monthly spending in 2024. 
Transform the row-level sales transactions into a pivot table where each month (Jan–Dec) is a separate column showing total purchase amount. 
If no purchase exists in a month, show 0.*/


SELECT
	customers.customer_id,
    customers.customer_name,
    COALESCE(SUM(CASE WHEN MONTH(sales.sale_date) = 1 THEN sales.quantity * sales.unit_price END), 0) AS Jan,
    COALESCE(SUM(CASE WHEN MONTH(sales.sale_date) = 2 THEN sales.quantity * sales.unit_price END), 0) AS Feb,
    COALESCE(SUM(CASE WHEN MONTH(sales.sale_date) = 3 THEN sales.quantity * sales.unit_price END), 0) AS Mar,
    COALESCE(SUM(CASE WHEN MONTH(sales.sale_date) = 4 THEN sales.quantity * sales.unit_price END), 0) AS Apr,
    COALESCE(SUM(CASE WHEN MONTH(sales.sale_date) = 5 THEN sales.quantity * sales.unit_price END), 0) AS May,
    COALESCE(SUM(CASE WHEN MONTH(sales.sale_date) = 6 THEN sales.quantity * sales.unit_price END), 0) AS Jun,
    COALESCE(SUM(CASE WHEN MONTH(sales.sale_date) = 7 THEN sales.quantity * sales.unit_price END), 0) AS Jul,
    COALESCE(SUM(CASE WHEN MONTH(sales.sale_date) = 8 THEN sales.quantity * sales.unit_price END), 0) AS Aug,
    COALESCE(SUM(CASE WHEN MONTH(sales.sale_date) = 9 THEN sales.quantity * sales.unit_price END), 0) AS Sep,
    COALESCE(SUM(CASE WHEN MONTH(sales.sale_date) = 10 THEN sales.quantity * sales.unit_price END), 0) AS Oct,
    COALESCE(SUM(CASE WHEN MONTH(sales.sale_date) = 11 THEN sales.quantity * sales.unit_price END), 0) AS Nov,
    COALESCE(SUM(CASE WHEN MONTH(sales.sale_date) = 12 THEN sales.quantity * sales.unit_price END), 0) AS `Dec`
FROM customers LEFT JOIN sales
		ON sales.customer_id = customers.customer_id
WHERE sales.sale_date BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY customers.customer_id, customers.customer_name;

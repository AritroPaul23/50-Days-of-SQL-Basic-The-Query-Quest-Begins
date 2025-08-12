CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    region VARCHAR(50),
    join_date DATE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    cost_price DECIMAL(10,2),
    selling_price DECIMAL(10,2)
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    sale_date DATE,
    quantity INT,
    channel VARCHAR(20),
    promo_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE promotions (
    promo_id INT PRIMARY KEY,
    promo_name VARCHAR(100),
    start_date DATE,
    end_date DATE
);

INSERT INTO customers VALUES
(1, 'Alice Johnson', 'North', '2023-03-15'),
(2, 'Bob Smith', 'East', '2022-07-10'),
(3, 'Carol White', 'West', '2024-01-05'),
(4, 'David Brown', 'South', '2023-06-20'),
(5, 'Eva Green', 'North', '2022-11-25');

INSERT INTO products VALUES
(1, 'Smartphone X', 'Electronics', 350.00, 500.00),
(2, 'Laptop Pro', 'Electronics', 700.00, 1000.00),
(3, 'Wireless Earbuds', 'Accessories', 50.00, 90.00),
(4, 'Coffee Maker', 'Home Appliances', 80.00, 120.00),
(5, 'Electric Kettle', 'Home Appliances', 25.00, 45.00);

INSERT INTO promotions VALUES
(101, 'Diwali Blast', '2024-10-15', '2024-10-30'),
(102, 'Black Friday', '2024-11-25', '2024-11-30'),
(103, 'Christmas Sale', '2024-12-20', '2024-12-27');

INSERT INTO sales VALUES
(1, 1, 1, '2024-10-18', 2, 'Online', 101),
(2, 2, 2, '2024-11-28', 1, 'Store', 102),
(3, 3, 3, '2024-12-22', 3, 'Online', 103),
(4, 4, 4, '2024-09-15', 2, 'Online', NULL),
(5, 5, 5, '2024-10-19', 4, 'Store', 101),
(6, 1, 2, '2024-11-26', 1, 'Store', 102),
(7, 2, 1, '2024-12-25', 1, 'Online', 103),
(8, 3, 5, '2024-11-15', 5, 'Online', NULL),
(9, 4, 3, '2024-10-20', 2, 'Store', 101),
(10, 5, 4, '2024-12-24', 1, 'Online', 103),
(11, 1, 3, '2024-08-15', 1, 'Online', NULL),
(12, 2, 4, '2024-11-27', 1, 'Online', 102),
(13, 3, 2, '2024-12-23', 1, 'Store', 103),
(14, 4, 1, '2024-10-16', 1, 'Store', 101),
(15, 5, 2, '2024-09-10', 2, 'Online', NULL),
(16, 1, 5, '2024-12-26', 2, 'Online', 103),
(17, 2, 5, '2024-11-29', 1, 'Store', 102),
(18, 3, 4, '2024-10-18', 1, 'Store', 101),
(19, 4, 2, '2024-12-21', 1, 'Online', 103),
(20, 5, 1, '2024-10-25', 1, 'Store', 101);


/*Business Question
Identify the top 5 customers who generated the highest total profit for the company during promotional campaigns in Q4 2024, segmented by sales channel.
Also, show how much of their total purchases were made during promotions vs. non-promotion periods.*/

WITH rankedinfo AS
(SELECT 
		sales.`channel`,
        customers.customer_name,
		SUM((products.selling_price - products.cost_price)*sales.quantity) AS total_profit,
        RANK() OVER ( PARTITION BY sales.`channel` ORDER BY SUM((products.selling_price - products.cost_price)*sales.quantity) DESC ) AS rnk
FROM sales INNER JOIN products
		ON sales.product_id = products.product_id
			INNER JOIN customers
		ON sales.customer_id = customers.customer_id
			INNER JOIN promotions
		ON sales.promo_id = promotions.promo_id
WHERE promotions.start_date >= '2024-10-01' AND promotions.end_date <= '2024-12-31'
GROUP BY sales.`channel`, customers.customer_id, customers.customer_name)

SELECT
	`channel`,
	customer_name,
	total_profit
FROM rankedinfo
WHERE rnk <= 5
ORDER BY 1, 3 DESC;

SELECT
    customers.customer_name,
    SUM(CASE 
        WHEN sales.promo_id IS NULL THEN products.selling_price * sales.quantity 
    END) AS Non_promotion,
    SUM(CASE 
        WHEN sales.promo_id IS NOT NULL THEN products.selling_price * sales.quantity 
    END) AS Promotion
FROM sales
INNER JOIN products
    ON sales.product_id = products.product_id
INNER JOIN customers
    ON sales.customer_id = customers.customer_id
LEFT JOIN promotions
    ON sales.promo_id = promotions.promo_id
    AND promotions.start_date >= '2024-10-01'
    AND promotions.end_date <= '2024-12-31'
GROUP BY customers.customer_id, customers.customer_name;
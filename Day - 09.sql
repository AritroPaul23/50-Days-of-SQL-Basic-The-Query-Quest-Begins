CREATE TABLE SalesTransactions (
    transaction_id INT PRIMARY KEY,
    transaction_date DATE,
    product_name VARCHAR(100),
    category VARCHAR(50),
    quantity_sold INT,
    unit_price DECIMAL(10, 2),
    status VARCHAR(20) -- 'Completed', 'Cancelled', etc.
);

INSERT INTO SalesTransactions (transaction_id, transaction_date, product_name, category, quantity_sold, unit_price, status) VALUES
(1001, '2024-01-05', 'iPhone 15', 'Smartphones', 5, 999.99, 'Completed'),
(1002, '2024-01-15', 'Samsung Galaxy S23', 'Smartphones', 3, 899.99, 'Completed'),
(1003, '2024-01-22', 'MacBook Pro 14"', 'Laptops', 2, 1999.99, 'Completed'),
(1004, '2024-02-10', 'Lenovo ThinkPad X1', 'Laptops', 4, 1399.99, 'Completed'),
(1005, '2024-02-18', 'iPad Air', 'Tablets', 6, 699.99, 'Completed'),
(1006, '2024-03-03', 'iPhone 15', 'Smartphones', 2, 999.99, 'Cancelled'),
(1007, '2024-03-10', 'iPad Pro', 'Tablets', 3, 999.99, 'Completed'),
(1008, '2024-04-15', 'Dell XPS 13', 'Laptops', 3, 1299.99, 'Completed'),
(1009, '2024-05-20', 'Samsung Galaxy Tab S8', 'Tablets', 5, 849.99, 'Completed'),
(1010, '2024-06-05', 'MacBook Air M2', 'Laptops', 6, 1099.99, 'Completed'),
(1011, '2024-06-15', 'iPhone 15 Pro', 'Smartphones', 4, 1199.99, 'Completed');


-- Business Question
/*Industry: Retail / E-commerce Analytics
As a revenue analyst at a leading online retail company, you are tasked with identifying the total, average, highest
and lowest monthly revenue generated from completed sales transactions for each product category in the first half of 2024. 
This insight will guide strategic decisions on inventory planning and marketing investments.*/


SELECT * FROM salestransactions;

SELECT 
	category,
    MONTHNAME(transaction_date) AS `month`,
    SUM(quantity_sold*unit_price) AS total_revenue,
    ROUND(AVG(quantity_sold*unit_price), 2) AS avg_revenue,
    MAX(quantity_sold*unit_price) AS highest_revenue,
    MIN(quantity_sold*unit_price) AS lowest_revenue
FROM salestransactions
WHERE transaction_date BETWEEN '2024-01-01' AND '2024-06-30'
		AND
	  `status` = 'Completed'
GROUP BY category , MONTH(transaction_date), MONTHNAME(transaction_date)
ORDER BY category ASC, MONTH(transaction_date) ASC;

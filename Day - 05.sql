CREATE TABLE sales_orders (
    order_id INT PRIMARY KEY,
    order_date DATE NOT NULL,
    customer_email VARCHAR(255) NOT NULL,
    product_category VARCHAR(100) NOT NULL,
    total_order_value DECIMAL(10, 2) NOT NULL
);

INSERT INTO sales_orders (order_id, order_date, customer_email, product_category, total_order_value) VALUES
(1001, '2024-01-15', 'john.doe@gmail.com', 'Smartphones', 799.99),
(1002, '2024-02-20', 'jane.smith@yahoo.com', 'Laptops', 1200.50),
(1003, '2024-03-01', 'mike.w@outlook.com', 'Tablets', 650.00),
(1004, '2024-04-10', 'susan.b@gmail.com', 'Accessories', 150.75),
(1005, '2024-05-05', 'david.lee@company.com', 'Smartphones', 950.00),
(1006, '2024-06-25', 'emily.c@outlook.com', 'Laptops', 1500.00),
(1007, '2024-07-01', 'chris.p@gmail.com', 'Tablets', 400.00), -- Outside date range
(1008, '2024-02-10', 'anna.m@outlook.com', 'Smartphones', 300.00), -- Below value threshold
(1009, '2024-03-15', 'peter.k@gmail.com', 'Laptops', 1100.00),
(1010, '2024-04-20', 'lisa.g@aol.com', 'Desktops', 800.00), -- Wrong email domain
(1011, '2024-01-05', 'robert.d@gmail.com', 'Smartphones', 600.00),
(1012, '2024-05-12', 'maria.s@outlook.com', 'Accessories', 250.00), -- Wrong category
(1013, '2024-06-01', 'james.t@gmail.com', 'Tablets', 520.00),
(1014, '2023-12-30', 'olivia.w@outlook.com', 'Laptops', 900.00), -- Outside date range
(1015, '2024-03-25', 'william.j@gmail.com', 'Smartphones', 499.99), -- Below value threshold
(1016, '2024-01-28', 'sophia.r@outlook.com', 'Laptops', 1800.00),
(1017, '2024-04-05', 'daniel.h@company.net', 'Tablets', 700.00), -- Wrong email domain
(1018, '2024-02-29', 'chloe.l@gmail.com', 'Smartphones', 850.00),
(1019, '2024-06-10', 'ben.p@outlook.com', 'Laptops', 600.00),
(1020, '2024-05-18', 'mia.k@gmail.com', 'Keyboards', 120.00); -- Wrong category, below value

-- Business Question
/*"Which sales orders, placed between January 1, 2024, and June 30, 2024, for products in the 'Smartphones', 'Laptops', or 'Tablets' categories, 
have a customer's email address that likes 'gmail.com' or 'outlook.com', and a total order value greater than $500?"*/

SELECT order_id,
	   order_date,
       product_category,
       customer_email,
       total_order_value
FROM sales_orders
WHERE product_category IN ( 'Smartphones', 'Laptops', 'Tablets')
	  AND 
      (customer_email LIKE '%gmail.com' OR customer_email LIKE '%outlook.com')
      AND
      order_date BETWEEN '2024-01-01' AND '2024-06-30'
      AND
      total_order_value > 500;

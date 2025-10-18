-- Stores Table
CREATE TABLE stores (
    store_id INT PRIMARY KEY AUTO_INCREMENT,
    store_name VARCHAR(100),
    region VARCHAR(50)
);

-- Sales Table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    store_id INT,
    sale_date DATE,
    product_name VARCHAR(100),
    unit_price DECIMAL(10,2),
    quantity INT,
    FOREIGN KEY (store_id) REFERENCES stores(store_id)
);

-- Insert 5 stores
INSERT INTO stores (store_name, region)
VALUES 
('Downtown Mart', 'North'),
('City Central', 'West'),
('Green Valley', 'East'),
('Metro Mall', 'South'),
('Ocean View', 'West');

-- Insert 50 random sales records across 2024-2025
INSERT INTO sales (store_id, sale_date, product_name, unit_price, quantity) VALUES
(1, '2024-01-10', 'Chocolate Bar', 2.50, 50),
(1, '2024-02-15', 'Energy Drink', 3.00, 60),
(1, '2024-03-20', 'Protein Bar', 2.20, 40),
(1, '2024-04-10', 'Snack Chips', 1.50, 100),
(1, '2024-05-25', 'Soda Can', 1.20, 80),

(2, '2024-01-12', 'Protein Bar', 2.00, 70),
(2, '2024-02-22', 'Snack Chips', 1.80, 90),
(2, '2024-03-19', 'Energy Drink', 3.20, 60),
(2, '2024-04-14', 'Chocolate Bar', 2.70, 40),
(2, '2024-05-28', 'Soda Can', 1.30, 110),

(3, '2024-01-18', 'Energy Drink', 3.10, 45),
(3, '2024-02-09', 'Protein Bar', 2.50, 65),
(3, '2024-03-23', 'Snack Chips', 1.60, 85),
(3, '2024-04-11', 'Chocolate Bar', 2.40, 75),
(3, '2024-05-30', 'Soda Can', 1.10, 120),

(4, '2024-01-20', 'Snack Chips', 1.90, 70),
(4, '2024-02-25', 'Protein Bar', 2.60, 50),
(4, '2024-03-29', 'Chocolate Bar', 2.80, 60),
(4, '2024-04-17', 'Soda Can', 1.40, 100),
(4, '2024-05-26', 'Energy Drink', 3.50, 55),

(5, '2024-01-14', 'Protein Bar', 2.10, 60),
(5, '2024-02-16', 'Snack Chips', 1.70, 90),
(5, '2024-03-18', 'Soda Can', 1.30, 80),
(5, '2024-04-15', 'Energy Drink', 3.00, 75),
(5, '2024-05-22', 'Chocolate Bar', 2.60, 70),

-- Add 25 more for 2025
(1, '2025-01-12', 'Energy Drink', 3.10, 65),
(1, '2025-02-18', 'Snack Chips', 1.60, 85),
(1, '2025-03-14', 'Soda Can', 1.40, 75),
(2, '2025-01-16', 'Chocolate Bar', 2.80, 55),
(2, '2025-02-20', 'Protein Bar', 2.30, 65),
(2, '2025-03-11', 'Snack Chips', 1.90, 95),
(3, '2025-01-25', 'Soda Can', 1.20, 100),
(3, '2025-02-27', 'Energy Drink', 3.20, 60),
(3, '2025-03-10', 'Chocolate Bar', 2.50, 90),
(4, '2025-01-21', 'Snack Chips', 1.80, 120),
(4, '2025-02-24', 'Soda Can', 1.30, 95),
(4, '2025-03-19', 'Protein Bar', 2.40, 80),
(5, '2025-01-13', 'Energy Drink', 3.30, 70),
(5, '2025-02-22', 'Snack Chips', 1.70, 110),
(5, '2025-03-27', 'Chocolate Bar', 2.70, 85),
(1, '2025-04-05', 'Protein Bar', 2.50, 95),
(2, '2025-04-09', 'Soda Can', 1.50, 105),
(3, '2025-04-15', 'Energy Drink', 3.40, 60),
(4, '2025-04-20', 'Chocolate Bar', 2.90, 65),
(5, '2025-04-28', 'Snack Chips', 1.90, 120),
(1, '2025-05-02', 'Soda Can', 1.20, 80),
(2, '2025-05-10', 'Energy Drink', 3.30, 75),
(3, '2025-05-12', 'Snack Chips', 1.60, 90),
(4, '2025-05-15', 'Protein Bar', 2.20, 85),
(5, '2025-05-25', 'Chocolate Bar', 2.60, 95);


/* Business Question:

"As a data analyst at a retail chain, you are asked to analyze how cumulative revenue grows for each store month by month.
Write a query to calculate the running total revenue per store across time to identify top-performing locations and their growth trend."*/

SELECT 
    sales.store_id,
    stores.store_name,
    DATE_FORMAT(sales.sale_date, '%Y-%m') AS month,
    SUM(sales.unit_price * sales.quantity) AS monthly_revenue,
    SUM(SUM(sales.unit_price * sales.quantity)) OVER (
        PARTITION BY stores.store_id
        ORDER BY DATE_FORMAT(sales.sale_date, '%Y-%m')
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_revenue
FROM sales
JOIN stores ON sales.store_id = stores.store_id
GROUP BY sales.store_id, stores.store_name, DATE_FORMAT(sales.sale_date, '%Y-%m')
ORDER BY sales.store_id, month;

CREATE TABLE daily_sales (
    sale_id INT PRIMARY KEY,
    sale_date DATE,
    product_id INT,
    store_id INT,
    quantity_sold INT,
    selling_price DECIMAL(10,2)
);

INSERT INTO daily_sales VALUES
(1, '2024-01-01', 101, 1, 5, 120.00),
(2, '2024-01-01', 102, 1, 3, 90.00),
(3, '2024-01-02', 103, 1, 4, 110.00),
(4, '2024-01-02', NULL, 1, 6, 130.00),          -- NULL product
(5, '2024-01-03', 101, 2, 2, 120.00),
(6, '2024-01-03', 102, 2, NULL, 90.00),         -- NULL quantity
(7, '2024-01-04', 103, 2, 5, 110.00),
(8, '2024-01-04', 101, NULL, 3, 120.00),        -- NULL store
(9, '2024-01-05', 102, 3, 7, 90.00),
(10, '2024-01-05', 103, 3, 6, NULL),            -- NULL price

(11, '2024-01-06', 101, 3, 8, 120.00),
(12, '2024-01-06', 102, 1, 2, 90.00),
(13, '2024-01-07', 103, 1, 4, 110.00),
(14, '2024-01-07', 101, 2, 3, 120.00),
(15, '2024-01-08', 102, 2, 5, 90.00),
(16, '2024-01-08', 103, 3, 4, 110.00),
(17, '2024-01-09', 101, 3, NULL, 120.00),       -- NULL quantity
(18, '2024-01-09', 102, NULL, 6, 90.00),        -- NULL store
(19, '2024-01-10', 103, 1, 7, 110.00),
(20, '2024-01-10', NULL, 2, 5, 130.00),         -- NULL product

(21, '2024-01-11', 101, 1, 4, 120.00),
(22, '2024-01-11', 102, 1, 6, 90.00),
(23, '2024-01-12', 103, 1, NULL, 110.00),       -- NULL quantity
(24, '2024-01-12', 101, 2, 3, 120.00),
(25, '2024-01-13', 102, 2, 4, 90.00),
(26, '2024-01-13', 103, 2, 2, NULL),            -- NULL price
(27, '2024-01-14', 101, 3, 5, 120.00),
(28, '2024-01-14', 102, 3, 4, 90.00),
(29, '2024-01-15', 103, 3, 6, 110.00),
(30, '2024-01-15', 101, 1, 3, 120.00),

(31, '2024-01-16', 102, 1, 3, 90.00),
(32, '2024-01-16', 103, 1, 2, 110.00),
(33, '2024-01-17', 101, 2, 4, 120.00),
(34, '2024-01-17', 102, 2, NULL, 90.00),        -- NULL quantity
(35, '2024-01-18', 103, 2, 5, 110.00),
(36, '2024-01-18', 101, 3, 6, NULL),            -- NULL price
(37, '2024-01-19', 102, 3, 3, 90.00),
(38, '2024-01-19', 103, 3, 4, 110.00),
(39, '2024-01-20', 101, 1, 2, 120.00),
(40, '2024-01-20', NULL, 2, 5, 130.00),         -- NULL product

(41, '2024-01-21', 102, 1, 3, 90.00),
(42, '2024-01-21', 103, 1, 5, 110.00),
(43, '2024-01-22', 101, 2, 7, 120.00),
(44, '2024-01-22', 102, 2, 6, 90.00),
(45, '2024-01-23', 103, 2, 4, 110.00),
(46, '2024-01-23', 101, NULL, 5, 120.00),       -- NULL store
(47, '2024-01-24', 102, 3, 6, 90.00),
(48, '2024-01-24', 103, 3, 5, 110.00),
(49, '2024-01-25', 101, 1, NULL, 120.00),       -- NULL quantity
(50, '2024-01-25', 102, 1, 4, 90.00);


/* Business Scenario — FMCG / Retail

A retail company tracks product sales daily.
However, due to data-entry issues, some records have:

NULL product_id, NULL quantity_sold, NULL store_id, NULL selling_price

Management wants to calculate:

“Identify the total revenue generated per product, but only from valid transactions where all required fields are NOT NULL.”

Additionally:

“Flag any day where a product has missing sales data (NULLs), so that the data quality team can investigate.”

You must write queries that filter out NULL rows for revenue calculation but also list NULL-containing rows separately for data-quality reporting.*/

/*Identify the total revenue generated per product, but only from valid transactions where all required fields are NOT NULL.*/
SELECT product_id,
		SUM(quantity_sold*selling_price) AS total_revenue
FROM daily_sales
WHERE product_id IS NOT NULL
		AND store_id IS NOT NUll
        AND quantity_sold IS NOT NULL
        AND selling_price IS NOT NULL
GROUP BY product_id;

/*Flag any day where a product has missing sales data (NULLs), so that the data quality team can investigate.*/
SELECT DISTINCT sale_date
FROM daily_sales
WHERE product_id IS NULL
		OR store_id IS NUll
        OR quantity_sold IS NULL
        OR selling_price IS NULL
ORDER BY sale_date ASC;
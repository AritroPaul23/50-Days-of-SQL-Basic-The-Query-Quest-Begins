CREATE TABLE online_sales (
    product_id INT,
    product_name VARCHAR(50),
    quantity INT,
    price_per_unit DECIMAL(10,2),
    sale_date DATE
);

CREATE TABLE store_sales (
    product_id INT,
    product_name VARCHAR(50),
    quantity INT,
    price_per_unit DECIMAL(10,2),
    sale_date DATE
);

-- Online Sales Data
INSERT INTO online_sales VALUES
(101, 'Wireless Mouse', 120, 15.99, '2025-07-01'),
(102, 'Bluetooth Keyboard', 85, 29.99, '2025-07-02'),
(103, 'Laptop Stand', 60, 25.50, '2025-07-03'),
(104, 'Noise Cancelling Headphones', 40, 120.00, '2025-07-05'),
(105, 'USB-C Hub', 95, 35.00, '2025-07-06'),
(106, 'Gaming Monitor', 25, 299.99, '2025-07-07'),
(107, 'Portable SSD', 50, 89.99, '2025-07-08'),
(108, 'Ergonomic Chair', 10, 199.99, '2025-07-09'),
(109, 'Smartwatch', 45, 150.00, '2025-07-10'),
(110, 'Desk Lamp', 70, 45.00, '2025-07-11');

-- Store Sales Data
INSERT INTO store_sales VALUES
(103, 'Laptop Stand', 30, 27.00, '2025-07-01'),
(104, 'Noise Cancelling Headphones', 15, 125.00, '2025-07-02'),
(105, 'USB-C Hub', 50, 37.00, '2025-07-03'),
(106, 'Gaming Monitor', 20, 310.00, '2025-07-04'),
(108, 'Ergonomic Chair', 5, 210.00, '2025-07-05'),
(111, 'Graphic Tablet', 18, 250.00, '2025-07-06'),
(112, 'Wireless Printer', 12, 180.00, '2025-07-07'),
(113, 'External Hard Drive', 25, 99.99, '2025-07-08'),
(114, 'Mechanical Keyboard', 40, 75.00, '2025-07-09'),
(115, 'Webcam HD', 35, 60.00, '2025-07-10');


/* Business Question

Your company sells products both online and in physical retail stores. The management wants a unified report that shows total revenue per product 
for the current quarter, even if the product was sold only online, only in-store, or in both channels.

You are given two sales data sources:
online_sales – contains product sales from the e-commerce site
store_sales – contains product sales from physical stores
The twist: Some products exist only in one sales channel. Find out the results from both sources, matching products by product_id.
If a product has no sales in one channel, display 0 for that channel’s revenue.*/


SELECT * FROM online_sales;

SELECT * FROM store_sales;

SELECT 
    COALESCE(o.product_id, s.product_id) AS product_id,
    COALESCE(o.product_name, s.product_name) AS product_name,
    COALESCE(o.online_revenue, 0) AS online_revenue,
    COALESCE(s.store_revenue, 0) AS store_revenue,
    COALESCE(o.online_revenue, 0) + COALESCE(s.store_revenue, 0) AS total_revenue
FROM (
    -- Online sales revenue
    SELECT 
        product_id,
        product_name,
        SUM(quantity * price_per_unit) AS online_revenue
    FROM online_sales
    GROUP BY product_id, product_name
) o
LEFT JOIN (
    -- Store sales revenue
    SELECT 
        product_id,
        product_name,
        SUM(quantity * price_per_unit) AS store_revenue
    FROM store_sales
    GROUP BY product_id, product_name
) s
ON o.product_id = s.product_id

UNION

SELECT 
    COALESCE(o.product_id, s.product_id) AS product_id,
    COALESCE(o.product_name, s.product_name) AS product_name,
    COALESCE(o.online_revenue, 0) AS online_revenue,
    COALESCE(s.store_revenue, 0) AS store_revenue,
    COALESCE(o.online_revenue, 0) + COALESCE(s.store_revenue, 0) AS total_revenue
FROM (
    -- Online sales revenue
    SELECT 
        product_id,
        product_name,
        SUM(quantity * price_per_unit) AS online_revenue
    FROM online_sales
    GROUP BY product_id, product_name
) o
RIGHT JOIN (
    -- Store sales revenue
    SELECT 
        product_id,
        product_name,
        SUM(quantity * price_per_unit) AS store_revenue
    FROM store_sales
    GROUP BY product_id, product_name
) s
ON o.product_id = s.product_id;

SELECT 
    product_id,
    product_name,
    SUM(online_revenue) AS online_revenue,
    SUM(store_revenue) AS store_revenue,
    SUM(online_revenue + store_revenue) AS total_revenue
FROM (
    -- Online sales (mark store revenue as 0)
    SELECT 
        product_id,
        product_name,
        SUM(quantity * price_per_unit) AS online_revenue,
        0 AS store_revenue
    FROM online_sales
    GROUP BY product_id, product_name
    
    UNION ALL
    
    -- Store sales (mark online revenue as 0)
    SELECT 
        product_id,
        product_name,
        0 AS online_revenue,
        SUM(quantity * price_per_unit) AS store_revenue
    FROM store_sales
    GROUP BY product_id, product_name
) t
GROUP BY product_id, product_name;

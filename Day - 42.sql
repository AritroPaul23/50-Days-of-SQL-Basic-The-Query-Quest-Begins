-- Regions Table
CREATE TABLE regions (
    region_id INT PRIMARY KEY AUTO_INCREMENT,
    region_name VARCHAR(50)
);

-- Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    category VARCHAR(50)
);

-- Sales Table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    region_id INT,
    product_id INT,
    sale_month DATE,
    revenue DECIMAL(10,2),
    FOREIGN KEY (region_id) REFERENCES regions(region_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO regions (region_name) VALUES
('North'), ('South'), ('East'), ('West');

INSERT INTO products (product_name, category) VALUES
('Laptop X', 'Electronics'),
('Smartphone Y', 'Electronics'),
('Headphones Z', 'Accessories'),
('Tablet Pro', 'Electronics'),
('Smartwatch Q', 'Wearables');

INSERT INTO sales (region_id, product_id, sale_month, revenue) VALUES
(1, 1, '2024-01-01', 12000.00),
(1, 1, '2024-02-01', 13500.00),
(1, 1, '2024-03-01', 12800.00),
(2, 1, '2024-01-01', 9800.00),
(2, 1, '2024-02-01', 11000.00),
(3, 1, '2024-03-01', 12300.00),
(4, 1, '2024-01-01', 9500.00),
(1, 2, '2024-01-01', 8900.00),
(2, 2, '2024-02-01', 9400.00),
(3, 2, '2024-03-01', 10000.00),
(4, 2, '2024-03-01', 9700.00),
(1, 3, '2024-01-01', 4500.00),
(1, 3, '2024-02-01', 4600.00),
(2, 3, '2024-03-01', 4700.00),
(3, 3, '2024-03-01', 5200.00),
(4, 3, '2024-03-01', 4900.00),
(1, 4, '2024-01-01', 7800.00),
(1, 4, '2024-02-01', 8300.00),
(1, 4, '2024-03-01', 8500.00),
(2, 4, '2024-02-01', 8200.00),
(3, 4, '2024-03-01', 8600.00),
(4, 4, '2024-03-01', 8700.00),
(1, 5, '2024-01-01', 5600.00),
(2, 5, '2024-01-01', 5700.00),
(3, 5, '2024-02-01', 5800.00),
(4, 5, '2024-03-01', 5900.00),
(1, 2, '2024-04-01', 9200.00),
(2, 1, '2024-04-01', 11500.00),
(3, 4, '2024-04-01', 8800.00),
(4, 3, '2024-04-01', 5000.00),
(1, 1, '2024-05-01', 14500.00),
(2, 2, '2024-05-01', 9600.00),
(3, 3, '2024-05-01', 5100.00),
(4, 4, '2024-05-01', 9000.00),
(1, 5, '2024-05-01', 6200.00),
(2, 1, '2024-06-01', 13000.00),
(3, 2, '2024-06-01', 9800.00),
(4, 3, '2024-06-01', 5400.00),
(1, 4, '2024-06-01', 8900.00),
(2, 5, '2024-06-01', 6000.00),
(3, 1, '2024-07-01', 13400.00),
(4, 2, '2024-07-01', 10100.00),
(1, 3, '2024-07-01', 5500.00),
(2, 4, '2024-07-01', 9100.00),
(3, 5, '2024-07-01', 6400.00),
(4, 1, '2024-07-01', 12200.00),
(1, 2, '2024-07-01', 9700.00);


/* Business Question

Analyze monthly sales performance per region and product. For each product, calculate:

The total monthly revenue per region,

The running total of sales (cumulative revenue) over months,

The rank of each region within the month based on total sales, and

The average monthly revenue per product across all regions. */

SELECT products.product_name,
		regions.region_name,
        DATE_FORMAT(sales.sale_month, '%b - %Y') AS sale_month,
        SUM(sales.revenue) AS monthly_revenue,
        
        -- Running Total by Product
        SUM(SUM(sales.revenue)) OVER ( PARTITION BY products.product_name ORDER BY sales.sale_month ASC ) AS running_total,
        
        -- Rank regions within month based on revenue
        RANK() OVER ( PARTITION BY sales.sale_month ORDER BY SUM(sales.revenue) DESC ) AS region_rank,
        
        -- Average monthly revenue per product
        ROUND(AVG(SUM(sales.revenue)) OVER ( PARTITION BY products.product_name), 2) AS avg_monthly_revenue
        
FROM sales INNER JOIN products
		ON sales.product_id = products.product_id
        INNER JOIN regions
			ON sales.region_id = regions.region_id
GROUP BY products.product_name, regions.region_name, sales.sale_month
ORDER BY products.product_name, sales.sale_month;
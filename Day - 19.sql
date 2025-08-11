CREATE DATABASE chllg;

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(30),
    cost_price DECIMAL(10,2)
);

CREATE TABLE promotions (
    promo_id INT PRIMARY KEY,
    promo_name VARCHAR(50),
    start_date DATE,
    end_date DATE
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    promo_id INT,
    region VARCHAR(30),
    quantity INT,
    selling_price DECIMAL(10,2),
    sale_date DATE,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (promo_id) REFERENCES promotions(promo_id)
);

CREATE TABLE reviews (
    review_id INT PRIMARY KEY,
    product_id INT,
    region VARCHAR(30),
    avg_rating DECIMAL(3,2),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO products VALUES
(1, 'Laptop X', 'Electronics', 700),
(2, 'Smartphone Y', 'Electronics', 400),
(3, 'Headphones Z', 'Accessories', 50),
(4, 'Gaming Console A', 'Electronics', 300),
(5, 'Coffee Maker B', 'Home Appliances', 80);

INSERT INTO promotions VALUES
(101, 'Holiday Blast', '2024-10-15', '2024-12-31'),
(102, 'Black Friday Special', '2024-11-25', '2024-11-30'),
(103, 'Cyber Monday', '2024-12-01', '2024-12-02'),
(104, 'Summer Sale', '2024-06-01', '2024-06-15');

INSERT INTO sales VALUES
(1, 1, 101, 'North', 50, 900, '2024-11-01'),
(2, 2, 101, 'North', 40, 550, '2024-11-05'),
(3, 3, 102, 'South', 100, 90, '2024-11-26'),
(4, 4, 102, 'East', 25, 450, '2024-11-28'),
(5, 5, 103, 'West', 60, 120, '2024-12-01'),
(6, 1, 103, 'East', 30, 880, '2024-12-02'),
(7, 2, 102, 'West', 35, 520, '2024-11-29'),
(8, 3, 101, 'North', 70, 85, '2024-10-20'),
(9, 4, 103, 'South', 15, 460, '2024-12-01'),
(10, 5, 101, 'East', 50, 110, '2024-12-10');

INSERT INTO reviews VALUES
(1, 1, 'North', 4.5),
(2, 1, 'East', 4.2),
(3, 2, 'North', 4.1),
(4, 2, 'West', 4.6),
(5, 3, 'South', 3.8),
(6, 3, 'North', 4.0),
(7, 4, 'East', 4.3),
(8, 4, 'South', 4.5),
(9, 5, 'West', 4.4),
(10, 5, 'East', 4.2);


/*Business Question
Find the top 5 products by total profit margin (%) for promotions that ran in Q4 2024, only counting sales from regions where 
the average customer rating for those products is above 4.0.*/

SELECT 
	products.product_name,
    ROUND(
		(SUM(sales.selling_price*sales.quantity)-SUM(products.cost_price*sales.quantity))
			/SUM(sales.selling_price*sales.quantity)*100, 2) AS total_profit_margin_percentage
FROM sales INNER JOIN products
		ON sales.product_id = products.product_id
		   INNER JOIN promotions
           ON sales.promo_id = promotions.promo_id
           INNER JOIN reviews
           ON reviews.product_id = sales.product_id AND sales.region = reviews.region
WHERE promotions.start_date >= '2024-10-01' AND promotions.end_date <= '2024-12-31'
		AND reviews.avg_rating > 4.0
GROUP BY products.product_id, products.product_name
ORDER BY 2 DESC LIMIT 5;

CREATE TABLE product_prices (
    price_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    product_name VARCHAR(100),
    month_year DATE,
    avg_price DECIMAL(10,2)
);

INSERT INTO product_prices (product_id, product_name, month_year, avg_price) VALUES
(1, 'Echo Dot', '2024-01-01', 45.00),
(1, 'Echo Dot', '2024-02-01', 47.00),
(1, 'Echo Dot', '2024-03-01', 46.50),
(1, 'Echo Dot', '2024-04-01', 48.00),
(1, 'Echo Dot', '2024-05-01', 49.50),
(1, 'Echo Dot', '2024-06-01', 50.00),
(1, 'Echo Dot', '2024-07-01', 51.00),
(1, 'Echo Dot', '2024-08-01', 49.00),
(1, 'Echo Dot', '2024-09-01', 50.50),
(1, 'Echo Dot', '2024-10-01', 52.00),

(2, 'Fire TV Stick', '2024-01-01', 39.00),
(2, 'Fire TV Stick', '2024-02-01', 40.00),
(2, 'Fire TV Stick', '2024-03-01', 42.00),
(2, 'Fire TV Stick', '2024-04-01', 41.00),
(2, 'Fire TV Stick', '2024-05-01', 43.50),
(2, 'Fire TV Stick', '2024-06-01', 45.00),
(2, 'Fire TV Stick', '2024-07-01', 44.50),
(2, 'Fire TV Stick', '2024-08-01', 46.00),
(2, 'Fire TV Stick', '2024-09-01', 47.50),
(2, 'Fire TV Stick', '2024-10-01', 49.00),

(3, 'Kindle', '2024-01-01', 89.00),
(3, 'Kindle', '2024-02-01', 87.50),
(3, 'Kindle', '2024-03-01', 88.00),
(3, 'Kindle', '2024-04-01', 90.00),
(3, 'Kindle', '2024-05-01', 92.00),
(3, 'Kindle', '2024-06-01', 91.50),
(3, 'Kindle', '2024-07-01', 93.00),
(3, 'Kindle', '2024-08-01', 94.00),
(3, 'Kindle', '2024-09-01', 95.00),
(3, 'Kindle', '2024-10-01', 96.00),

(4, 'Echo Show', '2024-01-01', 110.00),
(4, 'Echo Show', '2024-02-01', 112.00),
(4, 'Echo Show', '2024-03-01', 111.50),
(4, 'Echo Show', '2024-04-01', 113.00),
(4, 'Echo Show', '2024-05-01', 115.00),
(4, 'Echo Show', '2024-06-01', 114.00),
(4, 'Echo Show', '2024-07-01', 116.50),
(4, 'Echo Show', '2024-08-01', 117.00),
(4, 'Echo Show', '2024-09-01', 118.50),
(4, 'Echo Show', '2024-10-01', 119.00),

(5, 'Ring Doorbell', '2024-01-01', 95.00),
(5, 'Ring Doorbell', '2024-02-01', 96.00),
(5, 'Ring Doorbell', '2024-03-01', 98.00),
(5, 'Ring Doorbell', '2024-04-01', 97.50),
(5, 'Ring Doorbell', '2024-05-01', 99.00),
(5, 'Ring Doorbell', '2024-06-01', 100.00),
(5, 'Ring Doorbell', '2024-07-01', 101.00),
(5, 'Ring Doorbell', '2024-08-01', 100.50),
(5, 'Ring Doorbell', '2024-09-01', 102.00),
(5, 'Ring Doorbell', '2024-10-01', 104.00);

SELECT * FROM product_prices;


/* Business Question:

As a business analyst at Amazon, you’re asked to analyze price trends of products over time.
For each product, find the previous month’s price and the next month’s price for comparison.
This will help identify products with increasing or decreasing price patterns across months.*/

SELECT product_name,
	    YEAR(month_year) AS `year`,
		MONTHNAME(month_year) AS mnthname,
        avg_price,
        COALESCE(LAG(avg_price) OVER ( PARTITION BY product_name ORDER BY month_year ASC), 0 ) AS prvs_mnth_avg_price,
        COALESCE(LEAD(avg_price) OVER ( PARTITION BY product_name ORDER BY month_year ASC), 0 ) AS next_mnth_avg_price
FROM product_prices;
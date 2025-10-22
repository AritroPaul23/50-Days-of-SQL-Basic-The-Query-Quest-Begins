CREATE TABLE product_price_trends (
    record_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    product_name VARCHAR(100),
    month_year DATE,
    avg_price DECIMAL(10,2)
);

INSERT INTO product_price_trends (product_id, product_name, month_year, avg_price) VALUES
(1, 'Wireless Mouse', '2024-01-01', 12.50),
(1, 'Wireless Mouse', '2024-02-01', 12.80),
(1, 'Wireless Mouse', '2024-03-01', 13.10),
(1, 'Wireless Mouse', '2024-04-01', 13.50),
(1, 'Wireless Mouse', '2024-05-01', 14.00),
(1, 'Wireless Mouse', '2024-06-01', 13.80),
(1, 'Wireless Mouse', '2024-07-01', 14.20),
(1, 'Wireless Mouse', '2024-08-01', 14.60),
(1, 'Wireless Mouse', '2024-09-01', 15.00),
(1, 'Wireless Mouse', '2024-10-01', 15.20),

(2, 'Bluetooth Headphones', '2024-01-01', 35.00),
(2, 'Bluetooth Headphones', '2024-02-01', 35.40),
(2, 'Bluetooth Headphones', '2024-03-01', 36.00),
(2, 'Bluetooth Headphones', '2024-04-01', 36.50),
(2, 'Bluetooth Headphones', '2024-05-01', 37.20),
(2, 'Bluetooth Headphones', '2024-06-01', 36.80),
(2, 'Bluetooth Headphones', '2024-07-01', 37.60),
(2, 'Bluetooth Headphones', '2024-08-01', 38.10),
(2, 'Bluetooth Headphones', '2024-09-01', 38.50),
(2, 'Bluetooth Headphones', '2024-10-01', 39.00),

(3, 'Smart Watch', '2024-01-01', 75.00),
(3, 'Smart Watch', '2024-02-01', 74.80),
(3, 'Smart Watch', '2024-03-01', 75.50),
(3, 'Smart Watch', '2024-04-01', 76.20),
(3, 'Smart Watch', '2024-05-01', 77.10),
(3, 'Smart Watch', '2024-06-01', 78.00),
(3, 'Smart Watch', '2024-07-01', 79.00),
(3, 'Smart Watch', '2024-08-01', 80.20),
(3, 'Smart Watch', '2024-09-01', 80.80),
(3, 'Smart Watch', '2024-10-01', 81.50),

(4, 'Laptop Sleeve', '2024-01-01', 15.00),
(4, 'Laptop Sleeve', '2024-02-01', 15.20),
(4, 'Laptop Sleeve', '2024-03-01', 15.50),
(4, 'Laptop Sleeve', '2024-04-01', 15.90),
(4, 'Laptop Sleeve', '2024-05-01', 16.10),
(4, 'Laptop Sleeve', '2024-06-01', 16.50),
(4, 'Laptop Sleeve', '2024-07-01', 16.80),
(4, 'Laptop Sleeve', '2024-08-01', 17.20),
(4, 'Laptop Sleeve', '2024-09-01', 17.60),
(4, 'Laptop Sleeve', '2024-10-01', 18.00),

(5, 'Gaming Keyboard', '2024-01-01', 45.00),
(5, 'Gaming Keyboard', '2024-02-01', 45.50),
(5, 'Gaming Keyboard', '2024-03-01', 46.20),
(5, 'Gaming Keyboard', '2024-04-01', 47.00),
(5, 'Gaming Keyboard', '2024-05-01', 47.80),
(5, 'Gaming Keyboard', '2024-06-01', 48.00),
(5, 'Gaming Keyboard', '2024-07-01', 48.50),
(5, 'Gaming Keyboard', '2024-08-01', 49.00),
(5, 'Gaming Keyboard', '2024-09-01', 49.30),
(5, 'Gaming Keyboard', '2024-10-01', 50.00);



/* Business Question (Moving Average Analysis)

“You are a data analyst at an e-commerce company. Management wants to monitor product price trends over time and detect anomalies.
Write a SQL query to calculate a 3-month moving average of each product’s average monthly sales price, so that pricing fluctuations can be identified early.” */


SELECT product_name,
		MONTHNAME(month_year),
        avg_price,
        ROUND(AVG(avg_price) OVER ( PARTITION BY product_name ORDER BY month_year ASC ROWS BETWEEN 2 PRECEDING AND CURRENT ROW ), 2) AS moving_avg_price
FROM product_price_trends;

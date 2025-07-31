CREATE TABLE order_summary (
    order_id INT PRIMARY KEY,
    seller_id INT,
    seller_name VARCHAR(100),
    product_id INT,
    product_name VARCHAR(100),
    quantity INT,
    unit_price DECIMAL(10, 2),
    order_date DATE,
    order_status VARCHAR(20)
);

INSERT INTO order_summary (order_id, seller_id, seller_name, product_id, product_name, quantity, unit_price, order_date, order_status)
VALUES
(1001, 201, 'Tech Hub', 301, 'Bluetooth Speaker', 2, 49.99, '2024-04-10', 'Completed'),
(1002, 202, 'GadgetZone', 302, 'Wireless Mouse', 3, 15.99, '2024-04-12', 'Completed'),
(1003, 201, 'Tech Hub', 303, 'Smartwatch', 1, 199.99, '2024-04-15', 'Pending'),
(1004, 203, 'HomeEssentials', 304, 'Air Fryer', 1, 89.99, '2024-04-20', 'Completed'),
(1005, 202, 'GadgetZone', 305, 'USB-C Cable', 5, 5.49, '2024-05-01', 'Completed'),
(1006, 201, 'Tech Hub', 306, 'Tablet Stand', 2, 29.99, '2024-05-03', 'Completed'),
(1007, 203, 'HomeEssentials', 307, 'LED Bulb Set', 4, 9.99, '2024-05-15', 'Completed'),
(1008, 202, 'GadgetZone', 308, 'Laptop Sleeve', 1, 25.00, '2024-06-10', 'Completed'),
(1009, 204, 'StyleMart', 309, 'T-Shirt Pack', 3, 19.99, '2024-06-20', 'Completed'),
(1010, 201, 'Tech Hub', 310, 'Webcam', 2, 59.99, '2024-06-25', 'Completed');

-- Business Question
/*Industry: Retail Analytics
"As a performance analyst at a large online marketplace, you are asked to analyze seller performance for Q2 2024.
For each seller, calculate:

The total number of orders,
The total revenue earned from completed orders,
The average order value,
And the number of products sold.

This analysis will help identify top-performing sellers and support decisions on seller promotions and platform partnerships.*/

SELECT * FROM order_summary;

SELECT
	seller_name,
	COUNT(order_id) AS total_orders,
    SUM(unit_price*quantity) AS total_revenue,
    ROUND(AVG(unit_price*quantity), 2) AS avg_order_value,
    COUNT(product_id) AS products_sold
FROM order_summary
WHERE MONTH(order_date) IN (4, 5, 6)
		AND order_status = 'Completed'
GROUP BY seller_name
ORDER BY 3 DESC;

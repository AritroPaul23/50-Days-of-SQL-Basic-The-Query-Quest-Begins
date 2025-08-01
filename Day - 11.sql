CREATE TABLE OrderDetails (
    OrderID INT,
    OrderDate DATE,
    ProductID INT,
    ProductName VARCHAR(100),
    City VARCHAR(50),
    Quantity INT,
    PricePerUnit DECIMAL(10,2)
);


INSERT INTO OrderDetails (OrderID, OrderDate, ProductID, ProductName, City, Quantity, PricePerUnit) VALUES
(201, '2025-07-01', 1, 'Smartphone', 'Delhi', 4, 15000),
(202, '2025-07-01', 1, 'Smartphone', 'Delhi', 5, 15000),
(203, '2025-07-02', 1, 'Smartphone', 'Delhi', 6, 15000),
(204, '2025-07-02', 1, 'Smartphone', 'Delhi', 3, 15000),
(205, '2025-07-03', 2, 'Laptop', 'Mumbai', 2, 45000),
(206, '2025-07-03', 2, 'Laptop', 'Mumbai', 1, 45000),
(207, '2025-07-04', 3, 'Wireless Earbuds', 'Bangalore', 5, 4000),
(208, '2025-07-04', 3, 'Wireless Earbuds', 'Bangalore', 6, 4000),
(209, '2025-07-05', 3, 'Wireless Earbuds', 'Bangalore', 4, 4000),
(210, '2025-07-06', 4, 'Smartwatch', 'Kolkata', 2, 8000),
(211, '2025-07-06', 4, 'Smartwatch', 'Kolkata', 5, 8000),
(212, '2025-07-07', 4, 'Smartwatch', 'Kolkata', 4, 8000),
(213, '2025-07-08', 5, 'Monitor', 'Delhi', 2, 12000),
(214, '2025-07-08', 5, 'Monitor', 'Delhi', 3, 12000),
(215, '2025-07-09', 6, 'USB-C Cable', 'Mumbai', 10, 500),
(216, '2025-07-09', 6, 'USB-C Cable', 'Mumbai', 12, 500),
(217, '2025-07-10', 3, 'Wireless Earbuds', 'Hyderabad', 6, 4000),
(218, '2025-07-10', 3, 'Wireless Earbuds', 'Hyderabad', 5, 4000),
(219, '2025-07-11', 3, 'Wireless Earbuds', 'Hyderabad', 4, 4000),
(220, '2025-07-11', 3, 'Wireless Earbuds', 'Hyderabad', 7, 4000);

-- Business Question
/*Identify products that generated more than ₹50,000 in total sales revenue, 
but only from cities where the average quantity sold per order is greater than 3.*/

SELECT * FROM orderdetails;

SELECT 
	ProductName,
    SUM(Quantity*PricePerUnit) AS total_revenue
FROM orderdetails
WHERE city IN (SELECT 
					city
				FROM orderdetails
				GROUP BY city
				HAVING AVG(Quantity) > 3)
GROUP BY ProductName
HAVING SUM(Quantity*PricePerUnit) > 50000
ORDER BY 2 DESC;


CREATE TABLE SalesTransactions (
    TransactionID INT,
    TransactionDate DATE,
    ProductID INT,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Quantity INT,
    PricePerUnit DECIMAL(10,2)
);

INSERT INTO SalesTransactions (TransactionID, TransactionDate, ProductID, ProductName, Category, Quantity, PricePerUnit) VALUES
(101, '2025-07-01', 1, 'Toothpaste', 'Personal Care', 20, 40),
(102, '2025-07-01', 2, 'Shampoo', 'Personal Care', 15, 120),
(103, '2025-07-02', 3, 'Handwash', 'Personal Care', 30, 80),
(104, '2025-07-02', 4, 'Biscuits', 'Food', 50, 20),
(105, '2025-07-03', 5, 'Chips', 'Food', 40, 25),
(106, '2025-07-03', 6, 'Soft Drink', 'Beverage', 60, 30),
(107, '2025-07-04', 7, 'Juice', 'Beverage', 35, 50),
(108, '2025-07-04', 8, 'Face Cream', 'Personal Care', 10, 250),
(109, '2025-07-05', 9, 'Cookies', 'Food', 45, 30),
(110, '2025-07-05', 10, 'Noodles', 'Food', 38, 40),
(111, '2025-07-06', 1, 'Toothpaste', 'Personal Care', 25, 40),
(112, '2025-07-06', 2, 'Shampoo', 'Personal Care', 12, 120),
(113, '2025-07-07', 3, 'Handwash', 'Personal Care', 20, 80),
(114, '2025-07-07', 4, 'Biscuits', 'Food', 60, 20),
(115, '2025-07-08', 6, 'Soft Drink', 'Beverage', 80, 30),
(116, '2025-07-08', 7, 'Juice', 'Beverage', 40, 50),
(117, '2025-07-09', 8, 'Face Cream', 'Personal Care', 15, 250),
(118, '2025-07-09', 9, 'Cookies', 'Food', 30, 30),
(119, '2025-07-10', 10, 'Noodles', 'Food', 50, 40),
(120, '2025-07-10', 5, 'Chips', 'Food', 45, 25);

/*Business Case – CPG / Retail Industry:
Identify the product(s) whose total revenue is higher than the average total revenue of all products.*/

SELECT * FROM salestransactions;

SELECT 
    ProductName, 
    SUM(Quantity * PricePerUnit) AS total_revenue
FROM 
    SalesTransactions
GROUP BY 
    ProductName
HAVING 
    SUM(Quantity * PricePerUnit) > (
        SELECT 
            AVG(ProductRevenue)
        FROM (
            SELECT 
                ProductName,
                SUM(Quantity * PricePerUnit) AS ProductRevenue
            FROM 
                SalesTransactions
            GROUP BY 
                ProductName
        ) AS ProductRevenues
    )
ORDER BY 2 DESC;


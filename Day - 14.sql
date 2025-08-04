CREATE TABLE SellerOrders (
    OrderID INT,
    SellerID INT,
    SellerName VARCHAR(100),
    OrderDate DATE,
    OrderValue DECIMAL(10, 2)
);


INSERT INTO SellerOrders (OrderID, SellerID, SellerName, OrderDate, OrderValue) VALUES
(1, 101, 'Alpha Traders', '2025-07-01', 4500),
(2, 102, 'Beta Sales', '2025-07-01', 8000),
(3, 103, 'Gamma Store', '2025-07-02', 7000),
(4, 101, 'Alpha Traders', '2025-07-03', 5200),
(5, 102, 'Beta Sales', '2025-07-04', 6300),
(6, 104, 'Delta Mart', '2025-07-05', 3200),
(7, 101, 'Alpha Traders', '2025-07-06', 5800),
(8, 103, 'Gamma Store', '2025-07-06', 4600),
(9, 105, 'Epsilon Supplies', '2025-07-07', 8800),
(10, 103, 'Gamma Store', '2025-07-08', 7300),
(11, 102, 'Beta Sales', '2025-07-08', 9100),
(12, 106, 'Zeta Wholesale', '2025-07-09', 2750),
(13, 101, 'Alpha Traders', '2025-07-10', 6700),
(14, 104, 'Delta Mart', '2025-07-10', 5800),
(15, 105, 'Epsilon Supplies', '2025-07-11', 4900),
(16, 103, 'Gamma Store', '2025-07-12', 6100),
(17, 102, 'Beta Sales', '2025-07-12', 5900),
(18, 106, 'Zeta Wholesale', '2025-07-13', 8000),
(19, 101, 'Alpha Traders', '2025-07-13', 7100),
(20, 105, 'Epsilon Supplies', '2025-07-14', 3400);


/*14.	Industry: E-commerce / Retail – Seller Analytics
→ Business Question:
Among all sellers, identify those who have handled more than 3 orders and whose average order value exceeds ₹5,000. For each qualifying seller, return:
Total number of orders (COUNT)
Total revenue (SUM)
Average order value (AVG)
Highest order value (MAX)
Lowest order value (MIN)

Sort the results by total revenue in descending order.*/

SELECT * FROM sellerorders;

SELECT
	sellername,
    COUNT(*) AS Total_Number_of_Orders,
    SUM(ordervalue) AS Total_Revenue,
    ROUND(AVG(ordervalue), 2) AS Avg_Order_Value,
    MAX(ordervalue) AS Highest_Order_Value,
    MIN(ordervalue) AS Lowest_Order_Value
FROM sellerorders
GROUP BY sellername
HAVING COUNT(*) > 3
		AND
	   AVG(ordervalue) > 5000
ORDER BY Total_Revenue DESC;


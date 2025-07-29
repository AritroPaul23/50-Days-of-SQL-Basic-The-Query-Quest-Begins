-- Create the SubscriptionShipments table
CREATE TABLE SubscriptionShipments (
    ShipmentID INT PRIMARY KEY,
    CustomerID INT,
    CustomerEmail VARCHAR(255),
    ShipmentDate DATE,
    ProductID INT,
    ProductName VARCHAR(255)
);

-- Insert sample records into the SubscriptionShipments table
INSERT INTO SubscriptionShipments (ShipmentID, CustomerID, CustomerEmail, ShipmentDate, ProductID, ProductName) VALUES
(1001, 101, 'alice@example.com', '2024-06-28', 501, 'Coffee Blend A'),
(1002, 102, 'bob@example.com', '2024-07-01', 502, 'Gourmet Tea Set'),
(1003, 103, 'charlie@example.com', '2024-07-02', 503, 'Artisan Soap Bar'),
(1004, 101, 'alice@example.com', '2024-07-05', 504, 'Exotic Spice Mix'),
(1005, 104, 'diana@example.com', '2024-07-08', 501, 'Coffee Blend A'),
(1006, 102, 'bob@example.com', '2024-07-10', 505, 'Craft Chocolate Bar'),
(1007, 105, 'eve@example.com', '2024-07-12', 502, 'Gourmet Tea Set'),
(1008, 103, 'charlie@example.com', '2024-07-15', 506, 'Premium Snack Box'),
(1009, 106, 'frank@example.com', '2024-07-18', 503, 'Artisan Soap Bar'),
(1010, 101, 'alice@example.com', '2024-07-20', 507, 'Luxury Candle'),
(1011, 107, 'grace@example.com', '2024-07-22', 504, 'Exotic Spice Mix'),
(1012, 108, 'heidi@example.com', '2024-07-25', 505, 'Craft Chocolate Bar'),
(1013, 102, 'bob@example.com', '2024-07-28', 501, 'Coffee Blend A'),
(1014, 109, 'ivan@example.com', '2024-08-01', 506, 'Premium Snack Box'),
(1015, 105, 'eve@example.com', '2024-08-05', 507, 'Luxury Candle');


-- Business Question
/*A popular monthly subscription box service wants to analyze its operational metrics for July 2024. They need to determine two key figures:
The total number of individual items (each product shipped in a box counts as one item, even if a customer received multiple boxes) that were dispatched during 
July 2024.
The total number of unique customers who received at least one shipment in July 2024.
Provide a single SQL query that returns these two distinct counts.*/

SELECT *
FROM subscriptionshipments;

SELECT 
	COUNT( DISTINCT productid ) AS Cnt_of_Indvdl_Items,
    COUNT( DISTINCT customerid ) AS Cnt_of_Unq_Cstmr
FROM subscriptionshipments
WHERE shipmentdate BETWEEN '2024-07-01' AND '2024-07-31';



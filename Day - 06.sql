-- Create the SalesOrders table
CREATE TABLE SalesOrders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    ProductID INT,
    ProductName VARCHAR(255),
    ProductCategory VARCHAR(255),
    Quantity INT,
    UnitPrice DECIMAL(10, 2)
);

-- Insert sample records into the SalesOrders table
INSERT INTO SalesOrders (OrderID, CustomerID, OrderDate, ProductID, ProductName, ProductCategory, Quantity, UnitPrice) VALUES
(1001, 101, '2024-01-15', 5001, 'Laptop Pro X', 'Laptops', 1, 1200.00),
(1002, 102, '2024-01-16', 5002, 'Wireless Mouse M1', 'Accessories', 2, 25.00),
(1003, 101, '2024-01-17', 5003, '4K Smart TV 55"', 'Televisions', 1, 800.00),
(1004, 103, '2024-01-18', 5001, 'Laptop Pro X', 'Laptops', 1, 1200.00),
(1005, 104, '2024-01-19', 5004, 'Noise Cancelling Headphones', 'Audio', 1, 150.00),
(1006, 102, '2024-01-20', 5005, 'Portable SSD 1TB', 'Storage', 1, 90.00),
(1007, 105, '2024-01-21', 5006, 'Gaming Keyboard RGB', 'Accessories', 1, 75.00),
(1008, 103, '2024-01-22', 5007, 'Smartphone Z10', 'Mobile Phones', 1, 700.00),
(1009, 101, '2024-01-23', 5008, 'Smartwatch S5', 'Wearables', 1, 200.00),
(1010, 106, '2024-01-24', 5009, 'Digital Camera DSLR', 'Cameras', 1, 600.00),
(1011, 104, '2024-01-25', 5002, 'Wireless Mouse M1', 'Accessories', 1, 25.00),
(1012, 107, '2024-01-26', 5010, 'Bluetooth Speaker X', 'Audio', 1, 50.00),
(1013, 105, '2024-01-27', 5011, 'E-Reader Kindle', 'Tablets & E-Readers', 1, 120.00),
(1014, 108, '2024-01-28', 5003, '4K Smart TV 55"', 'Televisions', 1, 800.00),
(1015, 109, '2024-01-29', 5012, 'Robot Vacuum Cleaner', 'Home Appliances', 1, 300.00);

-- Business Question
/* A large electronics retailer wants to optimize its marketing strategies and inventory management.
To do this, they need to get a clear, alphabetized list of all the unique product categories that customers have purchased across all sales orders.
This will help them identify their most diverse selling areas and potentially spot categories that are underperforming or overstocked.*/


SELECT 
	DISTINCT ProductCategory
FROM salesorders
ORDER BY 1 ASC;

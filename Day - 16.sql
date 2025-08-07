CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    PricePerUnit DECIMAL(10,2)
);

INSERT INTO Products (ProductID, ProductName, Category, PricePerUnit) VALUES
(1, 'Wireless Mouse', 'Electronics', 800),
(2, 'Bluetooth Speaker', 'Electronics', 1500),
(3, 'Notebook 200 Pages', 'Stationery', 50),
(4, 'Pen Pack', 'Stationery', 120),
(5, 'LED Monitor', 'Electronics', 8500),
(6, 'Yoga Mat', 'Fitness', 600),
(7, 'Treadmill', 'Fitness', 32000),
(8, 'Water Bottle', 'Fitness', 200),
(9, 'Desk Lamp', 'Home', 900),
(10, 'Office Chair', 'Furniture', 4500),
(11, 'Table Fan', 'Home Appliances', 1800),
(12, 'Hand Sanitizer', 'Health', 150),
(13, 'Face Mask Pack', 'Health', 300),
(14, 'Electric Kettle', 'Home Appliances', 1200),
(15, 'Sunglasses', 'Fashion', 999),
(16, 'Jeans', 'Fashion', 1999),
(17, 'T-Shirt', 'Fashion', 899),
(18, 'Whey Protein', 'Health', 2500),
(19, 'Running Shoes', 'Footwear', 3999),
(20, 'Formal Shoes', 'Footwear', 3599);


CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT,
    SaleDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


INSERT INTO Sales (SaleID, ProductID, Quantity, SaleDate) VALUES
(1, 1, 5, '2025-08-01'),
(2, 2, 3, '2025-08-01'),
(3, 5, 2, '2025-08-02'),
(4, 10, 1, '2025-08-02'),
(5, 14, 4, '2025-08-03'),
(6, 6, 6, '2025-08-03'),
(7, 18, 2, '2025-08-04'),
(8, 19, 1, '2025-08-04'),
(9, 7, 1, '2025-08-04'),
(10, 13, 10, '2025-08-05'),
(11, 3, 20, '2025-08-05'),
(12, 8, 5, '2025-08-06'),
(13, 11, 2, '2025-08-06'),
(14, 4, 8, '2025-08-07'),
(15, 16, 2, '2025-08-07');

/* Business Question:
Show all products and their total sales revenue, including those that have never been sold.*/

SELECT
	products.productname,
    COALESCE(SUM(products.PricePerUnit*sales.Quantity), 0) AS total_sales_revenue
FROM products LEFT JOIN
		sales
	 ON products.productid = sales.productid
GROUP BY products.productid , products.productname
ORDER BY 2 DESC, products.productname ASC;

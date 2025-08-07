CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50)
);

INSERT INTO Customers (CustomerID, CustomerName, City) VALUES
(1, 'Alice Johnson', 'New York'),
(2, 'Brian Smith', 'Los Angeles'),
(3, 'Catherine Lee', 'Chicago'),
(4, 'David Patel', 'Houston'),
(5, 'Emily Davis', 'Phoenix'),
(6, 'Frank White', 'Chicago'),
(7, 'Grace Kim', 'Houston'),
(8, 'Henry Adams', 'New York'),
(9, 'Isla Thompson', 'Los Angeles'),
(10, 'Jack Wilson', 'Phoenix');


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    OrderAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, OrderAmount) VALUES
(1001, 5, '2025-08-06', 1049.91),
(1002, 10, '2025-08-03', 647.25),
(1003, 8, '2025-08-03', 1125.11),
(1004, 10, '2025-08-13', 1099.74),
(1005, 1, '2025-08-14', 1364.18),
(1006, 6, '2025-08-02', 599.00),
(1007, 5, '2025-08-04', 788.33),
(1008, 3, '2025-08-12', 1350.45),
(1009, 2, '2025-08-17', 145.00),
(1010, 4, '2025-08-15', 790.65),
(1011, 1, '2025-08-18', 904.23),
(1012, 2, '2025-08-21', 612.50),
(1013, 6, '2025-08-10', 1120.00),
(1014, 7, '2025-08-05', 915.10),
(1015, 1, '2025-08-08', 130.99),
(1016, 3, '2025-08-11', 876.40),
(1017, 2, '2025-08-09', 1340.00),
(1018, 9, '2025-08-14', 390.25),
(1019, 2, '2025-08-01', 421.77),
(1020, 3, '2025-08-07', 799.99);


/* Business Question:
List all customers along with their total spend (OrderAmount), but only include those who have placed more than one order.*/


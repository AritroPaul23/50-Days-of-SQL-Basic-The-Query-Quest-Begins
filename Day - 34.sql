-- Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100)
);

-- Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    category VARCHAR(50),
    unit_price DECIMAL(10,2)
);

-- Sales Table
CREATE TABLE sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    sale_date DATE,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


-- Insert Customers
INSERT INTO customers (first_name, last_name, email) VALUES
('John', 'Doe', 'john.doe@email.com'),
('Jane', 'Smith', 'jane.smith@email.com'),
('Michael', 'Brown', 'michael.b@email.com'),
('Emily', 'Clark', 'emily.c@email.com'),
('David', 'Wilson', 'david.w@email.com'),
('Sophia', 'Taylor', 'sophia.t@email.com'),
('Daniel', 'Moore', 'daniel.m@email.com'),
('Olivia', 'Anderson', 'olivia.a@email.com'),
('James', 'Thomas', 'james.t@email.com'),
('Isabella', 'Lee', 'isabella.l@email.com');

-- Insert Products
INSERT INTO products (product_name, category, unit_price) VALUES
('Laptop', 'Electronics', 1200.00),
('Smartphone', 'Electronics', 800.00),
('Headphones', 'Accessories', 150.00),
('Tablet', 'Electronics', 600.00),
('Smartwatch', 'Accessories', 300.00),
('Keyboard', 'Accessories', 80.00),
('Monitor', 'Electronics', 400.00),
('Camera', 'Electronics', 1000.00),
('Shoes', 'Fashion', 120.00),
('Backpack', 'Fashion', 90.00);

-- Insert Sales (50 records across 2024 & 2025)
INSERT INTO sales (customer_id, product_id, sale_date, quantity) VALUES
(1, 1, '2024-01-05', 1),
(2, 2, '2024-01-10', 2),
(3, 3, '2024-01-15', 1),
(4, 4, '2024-02-02', 3),
(5, 5, '2024-02-14', 1),
(6, 6, '2024-03-01', 2),
(7, 7, '2024-03-08', 1),
(8, 8, '2024-03-15', 2),
(9, 9, '2024-04-05', 3),
(10, 10, '2024-04-10', 1),
(1, 2, '2024-04-20', 2),
(2, 3, '2024-05-01', 1),
(3, 4, '2024-05-05', 1),
(4, 5, '2024-05-12', 2),
(5, 6, '2024-06-01', 1),
(6, 7, '2024-06-08', 2),
(7, 8, '2024-06-14', 1),
(8, 9, '2024-07-01', 2),
(9, 10, '2024-07-08', 1),
(10, 1, '2024-07-20', 1),
(1, 3, '2024-08-01', 2),
(2, 4, '2024-08-05', 1),
(3, 5, '2024-08-10', 2),
(4, 6, '2024-09-01', 1),
(5, 7, '2024-09-05', 3),
(6, 8, '2024-09-15', 1),
(7, 9, '2024-10-01', 2),
(8, 10, '2024-10-05', 1),
(9, 1, '2024-10-15', 1),
(10, 2, '2024-11-01', 2),
(1, 5, '2025-01-05', 1),
(2, 6, '2025-01-12', 2),
(3, 7, '2025-01-20', 1),
(4, 8, '2025-02-01', 1),
(5, 9, '2025-02-10', 3),
(6, 10, '2025-02-20', 1),
(7, 1, '2025-03-01', 2),
(8, 2, '2025-03-10', 1),
(9, 3, '2025-03-15', 1),
(10, 4, '2025-04-01', 2),
(1, 6, '2025-04-05', 1),
(2, 7, '2025-04-12', 1),
(3, 8, '2025-05-01', 2),
(4, 9, '2025-05-10', 1),
(5, 10, '2025-05-20', 2),
(6, 1, '2025-06-01', 1),
(7, 2, '2025-06-10', 2),
(8, 3, '2025-06-20', 1),
(9, 4, '2025-07-01', 2),
(10, 5, '2025-07-10', 1);

SELECT * FROM customers;

SELECT * FROM products;

SELECT * FROM sales;

/* Business Question (String Formatting)
"The marketing team wants to send promotional emails to customers. 
Generate a formatted message for each purchase that combines the customer’s full name, product purchased, purchase date, and total amount spent. 
The message should look like this:

➡️ "Hello John Doe, you purchased Laptop on 2024-05-10 for $1200.00."*/

SELECT 
    CONCAT(
        'Hello ', customers.first_name, ' ', customers.last_name, 
        ', you purchased ', COALESCE(products.product_name, 'Unknown Product'),
        ' on ', DATE_FORMAT(sales.sale_date, '%Y-%m-%d'),
        ' for $', FORMAT(sales.quantity * COALESCE(products.unit_price,0), 2)
    ) AS purchase_message
FROM sales
JOIN customers ON sales.customer_id = customers.customer_id
LEFT JOIN products ON sales.product_id = products.product_id;

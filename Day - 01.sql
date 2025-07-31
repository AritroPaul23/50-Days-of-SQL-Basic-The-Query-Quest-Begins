CREATE DATABASE sql_chllng; -- CREATING DATABASE TO KEEP THE MULTIPLE SCHEMAS / TABLES IN IT.

USE sql_chllng; -- NOW MAKING sql_chllng DATABASE AS DEFAULT DATABASE.

-- SQL Script for a Real-Life Industry Product Inventory (10 Records)

-- 1. Create Table Query
-- Drops the table if it already exists to ensure a clean slate.
DROP TABLE IF EXISTS products;

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    category VARCHAR(100) NOT NULL,
    brand VARCHAR(100),
    price DECIMAL(10 , 2 ) NOT NULL,
    stock_quantity INT NOT NULL,
    supplier VARCHAR(150),
    manufacture_date DATE,
    expiry_date DATE,
    weight_kg DECIMAL(8 , 2 ),
    is_active BOOLEAN DEFAULT TRUE
);

-- 2. Insert Queries for 10 Real-Life Industry Product Records
-- Data generation for 10 diverse product records.

-- As in CREATE TABLE command product_id INT AUTO_INCREMENT PRIMARY KEY that's why this field is not there in INSERT command.
INSERT INTO products (product_name, category, brand, price, stock_quantity, supplier, manufacture_date, expiry_date, weight_kg, is_active) VALUES
('Quantum Leap Smart TV 65"', 'Electronics', 'TechVision', 1299.99, 150, 'Global Electronics Inc.', '2023-01-10', NULL, 25.50, TRUE),
('AeroFlow Running Shoes M', 'Apparel', 'StrideFit', 89.95, 500, 'Sporting Goods Co.', '2023-03-01', NULL, 0.80, TRUE),
('EcoClean All-Purpose Cleaner', 'Home Goods', 'GreenHome', 7.50, 1200, 'EcoSolutions Ltd.', '2023-06-15', '2025-06-15', 1.20, TRUE),
('Organic Whole Wheat Bread', 'Food & Beverage', 'HarvestBake', 4.25, 300, 'Local Farms Dist.', '2024-07-18', '2024-07-25', 0.50, TRUE),
('Radiant Glow Serum 30ml', 'Health & Beauty', 'BeautyEssence', 45.00, 250, 'Cosmetic Innovations', '2023-10-01', '2025-10-01', 0.15, TRUE),
('UltraGrip Tire Set (4)', 'Automotive', 'DriveSafe', 450.00, 80, 'AutoParts Hub', '2022-11-20', NULL, 40.00, TRUE),
('The Silent Forest Novel', 'Books', 'PageTurner', 15.99, 700, 'Literary Works Pub.', '2023-05-01', NULL, 0.40, TRUE),
('Galaxy Explorer Toy Set', 'Toys', 'DreamPlay', 29.99, 350, 'KidsJoy Inc.', '2023-08-12', NULL, 1.50, TRUE),
('ProFlex Yoga Mat', 'Sports Equipment', 'ZenMotion', 24.99, 400, 'ActiveLife Gear', '2023-04-20', NULL, 1.80, TRUE),
('ErgoWrite Gel Pens (12-pack)', 'Office Supplies', 'DeskMate', 9.99, 900, 'OfficeSupply Central', '2023-07-01', NULL, 0.20, TRUE);


-- BUSINESS QUESTION
-- Retrieve all product information from the inventory.

SELECT * 
FROM products;

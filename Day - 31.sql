-- Drop if exists
DROP TABLE IF EXISTS customers;

-- Create table
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    city VARCHAR(50)
);

-- Insert ~50 records with intentional duplicates
INSERT INTO customers (customer_name, email, phone, city) VALUES
('Alice Johnson', 'alice@gmail.com', '111-222-3333', 'New York'),
('Bob Smith', 'bob@gmail.com', '222-333-4444', 'Chicago'),
('Charlie Green', 'charlie@yahoo.com', '333-444-5555', 'Los Angeles'),
('David Brown', 'david@gmail.com', '444-555-6666', 'Miami'),
('Emma White', 'emma@yahoo.com', '555-666-7777', 'Houston'),

-- duplicate email
('Alicia Jones', 'alice@gmail.com', '999-888-7777', 'Boston'),

-- duplicate phone
('Robert Stone', 'rob.stone@gmail.com', '222-333-4444', 'San Francisco'),

-- same name + same city (possible duplicate entry by mistake)
('Charlie Green', 'charlie.green@altmail.com', '777-888-9999', 'Los Angeles'),

-- unique
('Grace Kelly', 'grace@gmail.com', '888-999-0000', 'Austin'),
('Henry Adams', 'henry@company.com', '111-444-7777', 'Dallas'),
('Isabella Ross', 'isabella@gmail.com', '222-666-9999', 'Denver'),
('Jack Turner', 'jack@yahoo.com', '333-111-5555', 'Phoenix'),
('Karen Lee', 'karen@gmail.com', '444-222-6666', 'Atlanta'),
('Liam Scott', 'liam@gmail.com', '555-333-7777', 'Boston'),
('Mia Davis', 'mia@gmail.com', '666-444-8888', 'New Orleans'),
('Noah Wilson', 'noah@gmail.com', '777-555-9999', 'San Diego'),
('Olivia Hall', 'olivia@yahoo.com', '888-666-0000', 'Chicago'),

-- duplicate phone
('Paul Walker', 'paul.walker@altmail.com', '111-222-3333', 'New York'),

-- duplicate name + city
('Ryan Martinez', 'ryan123@gmail.com', '222-777-1111', 'Miami'),
('Ryan Martinez', 'ryan_alt@yahoo.com', '333-888-2222', 'Miami'),

('Sophia King', 'sophia@gmail.com', '444-999-3333', 'Houston'),
('Thomas Allen', 'thomas@gmail.com', '555-111-4444', 'Austin'),
('Uma Patel', 'uma@yahoo.com', '666-222-5555', 'Seattle'),
('Victor Chen', 'victor@gmail.com', '777-333-6666', 'Dallas'),
('Wendy Lopez', 'wendy@gmail.com', '888-444-7777', 'Denver'),
('Xavier Reed', 'xavier@yahoo.com', '999-555-8888', 'Phoenix'),

-- duplicate email
('Emma Wilson', 'emma@yahoo.com', '000-666-9999', 'San Jose'),

-- duplicate name + city
('Charlie Green', 'c.green@workmail.com', '123-456-7890', 'Los Angeles'),

-- filler to make 50 realistic records
('Daniel Scott', 'daniel@gmail.com', '234-567-8901', 'Chicago'),
('Hannah Parker', 'hannah@gmail.com', '345-678-9012', 'New York'),
('Ethan Brooks', 'ethan@gmail.com', '456-789-0123', 'Miami'),
('Lily Carter', 'lily@gmail.com', '567-890-1234', 'Boston'),
('Samuel Long', 'samuel@gmail.com', '678-901-2345', 'San Diego'),
('Natalie Ross', 'natalie@gmail.com', '789-012-3456', 'Atlanta'),
('George Evans', 'george@company.com', '890-123-4567', 'Dallas'),
('Ivy Collins', 'ivy@yahoo.com', '901-234-5678', 'Phoenix'),
('Owen Hughes', 'owen@gmail.com', '012-345-6789', 'Denver'),
('Chloe Edwards', 'chloe@gmail.com', '111-555-9999', 'Houston'),
('Mason Perez', 'mason@gmail.com', '222-666-0000', 'Austin'),
('Ella Mitchell', 'ella@gmail.com', '333-777-1111', 'Los Angeles'),
('Lucas Ramirez', 'lucas@gmail.com', '444-888-2222', 'Chicago'),
('Aria Foster', 'aria@gmail.com', '555-999-3333', 'New York'),
('James Ward', 'james@yahoo.com', '666-000-4444', 'Miami'),
('Amelia Torres', 'amelia@gmail.com', '777-111-5555', 'Dallas'),
('Benjamin Gray', 'benjamin@gmail.com', '888-222-6666', 'San Francisco'),
('Charlotte Brooks', 'charlotte@gmail.com', '999-333-7777', 'Seattle');



/* Business Question

The CRM system has duplicate customers not only by email, but sometimes by phone number or even (same name + same city). 
The data quality team needs to identify all customers who are potential duplicates based on any of these conditions. 
Find such duplicate records. */

SELECT * FROM customers;

-- Duplicate emails
SELECT email, COUNT(*) AS occurrences
FROM customers
GROUP BY email
HAVING COUNT(*) > 1;

-- Duplicate phones
SELECT phone, COUNT(*) AS occurrences
FROM customers
GROUP BY phone
HAVING COUNT(*) > 1;

-- Duplicate name + city
SELECT customer_name, city, COUNT(*) AS occurrences
FROM customers
GROUP BY customer_name, city
HAVING COUNT(*) > 1;

-- Unified view (all types of duplicates)
SELECT customers.*
FROM customers
JOIN (
    SELECT email AS duplicate_key,
    'EMAIL' AS type
    FROM customers 
    GROUP BY email 
    HAVING COUNT(*) > 1
    
    UNION
    
    SELECT phone, 
    'PHONE'
    FROM customers 
    GROUP BY phone 
    HAVING COUNT(*) > 1
    
    UNION
    
    SELECT CONCAT(customer_name,'|',city), 
    'NAME+CITY'
    FROM customers 
    GROUP BY customer_name, city 
    HAVING COUNT(*) > 1
) AS `duplicate`
ON customers.email = `duplicate`.duplicate_key
   OR customers.phone = `duplicate`.duplicate_key
   OR CONCAT(customers.customer_name,'|',customers.city) = `duplicate`.duplicate_key
ORDER BY `duplicate`.type, customers.customer_id;


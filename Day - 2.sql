USE sql_chllng;

DROP TABLE IF EXISTS customers;

-- Creating table.
CREATE TABLE customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone_number VARCHAR(20),
    address VARCHAR(255),
    city VARCHAR(100),
    state VARCHAR(100),
    zip_code VARCHAR(10),
    country VARCHAR(50) DEFAULT 'USA',
    registration_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    last_login DATETIME,
    marketing_opt_in BOOLEAN DEFAULT TRUE,
    customer_segment VARCHAR(50)
);

-- Inserting values.

INSERT INTO customers (first_name, last_name, email, phone_number, address, city, state, zip_code, country, registration_date, last_login, marketing_opt_in, customer_segment) VALUES
('Alice', 'Smith', 'alice.smith@example.com', '555-123-4567', '123 Main St', 'Anytown', 'CA', '90210', 'USA', '2023-01-15 10:00:00', '2024-07-20 09:30:00', TRUE, 'Loyal'),
('Bob', 'Johnson', 'bob.johnson@example.com', '555-987-6543', '456 Oak Ave', 'Otherville', 'NY', '10001', 'USA', '2023-02-20 14:30:00', '2024-07-21 11:00:00', FALSE, 'New'),
('Charlie', 'Brown', 'charlie.brown@example.com', '555-111-2222', '789 Pine Ln', 'Smallville', 'TX', '75001', 'USA', '2022-11-01 08:00:00', '2024-07-19 16:45:00', TRUE, 'VIP'),
('Diana', 'Prince', 'diana.prince@example.com', '555-333-4444', '101 Elm Rd', 'Metropolis', 'FL', '33101', 'USA', '2023-03-10 11:15:00', '2024-07-22 10:10:00', TRUE, 'Loyal'),
('Eve', 'Davis', 'eve.davis@example.com', '555-555-6666', '202 Birch St', 'Gotham', 'GA', '30303', 'USA', '2024-01-05 09:00:00', NULL, TRUE, 'New'),
('Frank', 'Miller', 'frank.miller@example.com', '555-777-8888', '303 Cedar Blvd', 'Star City', 'WA', '98101', 'USA', '2022-09-25 13:00:00', '2024-07-18 15:20:00', FALSE, 'Churn Risk'),
('Grace', 'Wilson', 'grace.wilson@example.com', '555-999-0000', '404 Willow Way', 'Central City', 'IL', '60601', 'USA', '2023-06-12 16:00:00', '2024-07-23 08:00:00', TRUE, 'Loyal'),
('Henry', 'King', 'henry.king@example.com', '555-222-3333', '505 Maple Dr', 'Springfield', 'OR', '97201', 'USA', '2023-04-01 10:30:00', '2024-07-20 14:00:00', TRUE, 'New'),
('Ivy', 'Queen', 'ivy.queen@example.com', '555-444-5555', '606 Cherry Ln', 'Riverdale', 'AZ', '85001', 'USA', '2022-10-10 12:00:00', '2024-07-21 09:00:00', FALSE, 'Loyal'),
('Jack', 'Knight', 'jack.knight@example.com', '555-666-7777', '707 Poplar Ave', 'Sunnydale', 'CO', '80202', 'USA', '2024-02-18 17:00:00', NULL, TRUE, 'New');

SELECT * FROM customers; -- To check all the records of customers table.

-- Business Question

-- Get customer names and email addresses from the customers table.

SELECT 
		first_name,
        last_name,
        email
FROM customers;
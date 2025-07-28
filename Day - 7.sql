/*Database Schema (CREATE TABLE Queries)
To answer this question, we'll need two tables: Customers and CustomerServiceIssues.*/

-- Table: Customers
-- Stores general customer information, including their last purchase details

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    region VARCHAR(50) NOT NULL,
    last_purchase_date DATE,
    total_lifetime_spending DECIMAL(10, 2),
    preferred_category VARCHAR(100), -- e.g., 'Premium Electronics', 'Designer Apparel', 'Home Goods'
    current_service_issue_status VARCHAR(50), -- e.g., 'Active', 'Resolved', 'None' (if no recent issue)
    last_service_issue_date DATE -- Date of the most recent service issue, regardless of status
);
-- Sample Data for Denormalized Customers Table (20 Records)
-- Assuming current date is July 28, 2024, for 'last 90-180 days' and 'last 60 days' calculations
INSERT INTO Customers (customer_id, first_name, last_name, email, region, last_purchase_date, total_lifetime_spending, preferred_category, current_service_issue_status, last_service_issue_date) VALUES
-- Records likely to be INCLUDED by the query
(101, 'Alice', 'Smith', 'alice.smith@example.com', 'California', '2024-03-15', 1250.75, 'Premium Electronics', 'Resolved', '2024-04-01'), -- Meets all criteria
(102, 'Bob', 'Johnson', 'bob.j@example.com', 'New York', '2024-04-01', 890.50, 'Designer Apparel', 'None', NULL), -- Meets all criteria
(103, 'Ivy', 'Green', 'ivy.g@example.com', 'Florida', '2024-04-10', 600.00, 'Premium Electronics', 'Resolved', '2024-06-01'), -- Meets all criteria
(104, 'Karen', 'Hall', 'karen.h@example.com', 'California', '2024-03-05', 1800.00, 'Designer Apparel', 'Resolved', '2024-04-10'), -- Meets all criteria
(105, 'Mark', 'Taylor', 'mark.t@example.com', 'New York', '2024-02-15', 1100.20, 'Premium Electronics', 'None', NULL), -- Meets all criteria
(106, 'Olivia', 'Moore', 'olivia.m@example.com', 'Florida', '2024-01-30', 750.00, 'Designer Apparel', 'Resolved', '2024-03-20'), -- Meets all criteria (Edge case: 180 days ago)

-- Records likely to be EXCLUDED due to Last Purchase Date (too recent or too old)
(107, 'Peter', 'King', 'peter.k@example.com', 'California', '2024-06-20', 300.00, 'Premium Electronics', 'None', NULL), -- Excluded: Last purchase too recent (within 90 days)
(108, 'Quinn', 'Wright', 'quinn.w@example.com', 'New York', '2023-12-01', 2500.00, 'Designer Apparel', 'None', NULL), -- Excluded: Last purchase too old (more than 180 days)
(109, 'Rachel', 'Lopez', 'rachel.l@example.com', 'Florida', '2024-07-10', 450.00, 'Premium Electronics', 'None', NULL), -- Excluded: Last purchase too recent
(110, 'Sam', 'Scott', 'sam.s@example.com', 'California', '2023-11-25', 1900.00, 'Designer Apparel', 'None', NULL), -- Excluded: Last purchase too old

-- Records likely to be EXCLUDED due to Region
(111, 'Tina', 'Baker', 'tina.b@example.com', 'Texas', '2024-03-20', 800.00, 'Premium Electronics', 'None', NULL), -- Excluded: Wrong region
(112, 'Uma', 'Garcia', 'uma.g@example.com', 'Illinois', '2024-04-05', 1300.00, 'Designer Apparel', 'None', NULL), -- Excluded: Wrong region

-- Records likely to be EXCLUDED due to Preferred Category
(113, 'Victor', 'Hernandez', 'victor.h@example.com', 'New York', '2024-03-01', 650.00, 'Home Goods', 'None', NULL), -- Excluded: Wrong category
(114, 'Wendy', 'Young', 'wendy.y@example.com', 'Florida', '2024-04-15', 920.00, 'Sports Equipment', 'None', NULL), -- Excluded: Wrong category

-- Records likely to be EXCLUDED due to Active Service Issue within 60 days
(115, 'Xavier', 'Allen', 'xavier.a@example.com', 'California', '2024-03-28', 1500.00, 'Premium Electronics', 'Active', '2024-07-05'), -- Excluded: Active issue, recent
(116, 'Yara', 'Nelson', 'yara.n@example.com', 'New York', '2024-02-20', 1050.00, 'Designer Apparel', 'Active', '2024-06-10'), -- Excluded: Active issue, recent
(117, 'Zack', 'Carter', 'zack.c@example.com', 'Florida', '2024-04-01', 700.00, 'Premium Electronics', 'Active', '2024-05-30'), -- Excluded: Active issue, recent (Edge case: 60 days ago)

-- Additional mixed records
(118, 'Brenda', 'Davis', 'brenda.d@example.com', 'California', '2024-02-28', 1150.00, 'Designer Apparel', 'None', NULL), -- Included
(119, 'Chris', 'Miller', 'chris.m@example.com', 'New York', '2024-03-10', 2000.00, 'Premium Electronics', 'Resolved', '2024-07-20'), -- Included (Resolved issue, even if recent)
(120, 'Denise', 'Wilson', 'denise.w@example.com', 'Texas', '2024-04-25', 400.00, 'Designer Apparel', 'None', NULL); -- Excluded: Wrong region

/*Real-Life Industry Trending Business Question
Industry: E-commerce / Online Retail

Business Question:

"As a growing online fashion and electronics retailer, we are planning a highly targeted re-engagement marketing campaign. We need to identify customers who:

1. Made their last purchase between 90 and 180 days ago (i.e., not too recent, not too old, indicating potential disengagement).
	-- Assuming current date is July 28, 2024, for 'last 60 days' calculation

2. Are located in our key expansion regions: 'California', 'New York', or 'Florida'.

3. Have a demonstrated interest in either 'Premium Electronics' OR 'Designer Apparel' (based on their preferred product category, 
   which could be derived from past purchases or browsing history).

4. Are NOT currently flagged with an 'Active' customer service issue that was opened in the last 60 days (to avoid sending marketing to unhappy customers).

For these customers, we need to retrieve their unique Customer ID, First Name, Last Name, Email Address, the Date of their Last Purchase, 
and their Total Lifetime Spending. The results should list each customer only once, sorted by their Total Lifetime Spending from highest to lowest.*/

SELECT DISTINCT customer_id, first_name,
    last_name,
    email,
    last_purchase_date,
    total_lifetime_spending
FROM
    Customers
WHERE
    -- Condition 1: Last purchase between 90 and 180 days ago
    (DATEDIFF('2024-07-28', last_purchase_date) >= 90 AND DATEDIFF('2024-07-28', last_purchase_date) <= 180)
    AND
    -- Condition 2: Located in key expansion regions
    region IN ('California', 'New York', 'Florida')
    AND
    -- Condition 3: Demonstrated interest in specific categories
    preferred_category IN ('Premium Electronics', 'Designer Apparel')
    AND
    -- Condition 4: NOT currently flagged with an 'Active' customer service issue that was opened in the last 60 days
    -- This means we exclude customers who are 'Active' AND their issue date is within the last 60 days.
    NOT (current_service_issue_status = 'Active' AND DATEDIFF('2024-07-28', last_service_issue_date) <= 60)
ORDER BY
    total_lifetime_spending DESC;


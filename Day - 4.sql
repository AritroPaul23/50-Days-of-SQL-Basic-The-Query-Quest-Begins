USE sql_chllng;

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    order_date DATE,
    status VARCHAR(20),        -- e.g., 'Pending', 'Paid', 'Cancelled', 'Shipped'
    payment_status VARCHAR(20), -- e.g., 'Unpaid', 'Paid'
    shipping_date DATE
);


INSERT INTO orders (order_id, customer_name, order_date, status, payment_status, shipping_date)
VALUES
(101, 'Alice Johnson', '2025-07-01', 'Pending', 'Unpaid', NULL),
(102, 'Bob Smith', '2025-07-02', 'Paid', 'Paid', NULL),
(103, 'Charlie Brown', '2025-07-02', 'Shipped', 'Paid', '2025-07-04'),
(104, 'Daisy Lin', '2025-07-03', 'Pending', 'Unpaid', NULL),
(105, 'Ethan Hall', '2025-07-03', 'Cancelled', 'Unpaid', NULL),
(106, 'Fiona Davis', '2025-07-04', 'Paid', 'Paid', NULL),
(107, 'George King', '2025-07-04', 'Shipped', 'Paid', '2025-07-06'),
(108, 'Hannah Lee', '2025-07-05', 'Pending', 'Unpaid', NULL),
(109, 'Ian Moore', '2025-07-05', 'Paid', 'Paid', '2025-07-07'),
(110, 'Jackie Chan', '2025-07-06', 'Paid', 'Paid', NULL),
(111, 'Kevin Wu', '2025-07-07', 'Shipped', 'Paid', '2025-07-10'),
(112, 'Liam Smith', '2025-07-08', 'Pending', 'Unpaid', NULL),
(113, 'Maria Gonzalez', '2025-07-08', 'Paid', 'Paid', NULL),
(114, 'Nora Allen', '2025-07-09', 'Cancelled', 'Unpaid', NULL),
(115, 'Oliver Twist', '2025-07-09', 'Shipped', 'Paid', '2025-07-11'),
(116, 'Penelope Cruz', '2025-07-10', 'Paid', 'Unpaid', NULL),
(117, 'Quinn Black', '2025-07-10', 'Pending', 'Unpaid', NULL),
(118, 'Rita Ora', '2025-07-11', 'Paid', 'Paid', NULL),
(119, 'Steve Rogers', '2025-07-11', 'Shipped', 'Paid', '2025-07-13'),
(120, 'Tony Stark', '2025-07-12', 'Paid', 'Paid', NULL);


-- Business Question
-- Find orders that are either pending OR paid but not shipped.( Use --> AND / OR / NOT)

SELECT *
FROM orders
WHERE 
  ( status = 'pending'
    OR 
    status = 'paid' )
    AND 
    NOT shipping_date IS NOT NULL
  ;

      
SELECT *
FROM orders
WHERE shipping_date IS NULL
	  AND
	( status = 'pending'
	  OR
	  status = 'paid' );
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

INSERT INTO customers (customer_id, customer_name) VALUES
(1, 'Alice Johnson'), (2, 'Bob Smith'), (3, 'Charlie Davis'), (4, 'Diana King'),
(5, 'Ethan Lee'), (6, 'Fiona Green'), (7, 'George White'), (8, 'Hannah Brown'),
(9, 'Ian Clark'), (10, 'Julia Adams'),
(11, 'Kevin Scott'), (12, 'Laura Turner'), (13, 'Michael Young'), (14, 'Nina Perez'),
(15, 'Oscar Hall'), (16, 'Paula Allen'), (17, 'Quentin Baker'), (18, 'Rachel Carter'),
(19, 'Steven Evans'), (20, 'Tina Flores'),
(21, 'Uma Gonzalez'), (22, 'Victor Harris'), (23, 'Wendy James'), (24, 'Xavier Kelly'),
(25, 'Yvonne Lewis'), (26, 'Zack Martin'), (27, 'Adam Nelson'), (28, 'Bella Owens'),
(29, 'Carl Price'), (30, 'Donna Reed'),
(31, 'Eli Sanders'), (32, 'Faith Taylor'), (33, 'Gary Underwood'), (34, 'Hazel Vincent'),
(35, 'Isaac Walker'), (36, 'Jade Xu'), (37, 'Kyle Young'), (38, 'Lily Zimmerman'),
(39, 'Mark Anderson'), (40, 'Nora Brooks'),
(41, 'Owen Carter'), (42, 'Penny Diaz'), (43, 'Ryan Edwards'), (44, 'Sophie Fox'),
(45, 'Tommy Grant'), (46, 'Ursula Hill'), (47, 'Vera Irwin'), (48, 'Will Johnson'),
(49, 'Xena King'), (50, 'Yuri Lopez');


CREATE TABLE sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    sale_date DATE,
    quantity INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO sales (customer_id, sale_date, quantity, unit_price) VALUES
(1, '2024-01-05', 5, 5000), (2, '2024-02-12', 2, 8000),
(3, '2024-03-08', 10, 2000), (4, '2024-04-20', 1, 15000),
(5, '2024-05-10', 4, 2500), (6, '2024-06-15', 6, 4000),
(7, '2024-07-11', 8, 1200), (8, '2024-08-01', 3, 7000),
(9, '2024-09-03', 5, 3000), (10, '2024-10-25', 7, 2200),
(11, '2024-11-13', 4, 10000), (12, '2024-12-30', 9, 1800),
(13, '2024-01-18', 3, 12000), (14, '2024-02-25', 6, 2500),
(15, '2024-03-05', 2, 9000), (16, '2024-04-12', 5, 4000),
(17, '2024-05-20', 1, 6000), (18, '2024-06-28', 12, 1100),
(19, '2024-07-19', 3, 4500), (20, '2024-08-22', 7, 1700),
(21, '2024-09-10', 10, 2500), (22, '2024-10-02', 4, 5000),
(23, '2024-11-06', 8, 1500), (24, '2024-12-14', 6, 2200),
(25, '2024-01-30', 2, 3000), (26, '2024-02-17', 9, 1400),
(27, '2024-03-09', 5, 1800), (28, '2024-04-21', 3, 6000),
(29, '2024-05-25', 7, 2000), (30, '2024-06-30', 6, 2100),
(31, '2024-07-14', 2, 7000), (32, '2024-08-08', 4, 2500),
(33, '2024-09-19', 3, 10000), (34, '2024-10-28', 8, 1600),
(35, '2024-11-11', 1, 8000), (36, '2024-12-05', 5, 3000),
(37, '2024-01-09', 6, 4000), (38, '2024-02-14', 2, 9000),
(39, '2024-03-23', 7, 2200), (40, '2024-04-07', 4, 6000),
(41, '2024-05-16', 9, 1500), (42, '2024-06-22', 2, 5000),
(43, '2024-07-29', 5, 2500), (44, '2024-08-18', 8, 3000),
(45, '2024-09-27', 6, 3500), (46, '2024-10-31', 4, 7000),
(47, '2024-11-21', 3, 4000), (48, '2024-12-09', 7, 2600),
(49, '2024-01-04', 2, 10000), (50, '2024-02-11', 5, 4500);


/* Business Question

Classify customers based on their total purchase in 2024 into segments:
‘High Value’ if total purchase ≥ 50,000
‘Medium Value’ if between 20,000 and 49,999
‘Low Value’ if less than 20,000*/

SELECT
    customers.customer_id,
    customers.customer_name,
    SUM(sales.quantity * sales.unit_price) AS total_purchase_2024,
    CASE
        WHEN SUM(sales.quantity * sales.unit_price) >= 50000 THEN 'High Value'
        WHEN SUM(sales.quantity * sales.unit_price) BETWEEN 20000 AND 49999 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM customers
JOIN sales
    ON customers.customer_id = sales.customer_id
WHERE YEAR(sales.sale_date) = 2024
GROUP BY customers.customer_id, customers.customer_name
ORDER BY total_purchase_2024 DESC;



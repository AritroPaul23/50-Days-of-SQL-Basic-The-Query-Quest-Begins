CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100)
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    channel VARCHAR(50),   -- 'Store' or 'Online'
    sale_date DATE,
    amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);



INSERT INTO customers (customer_id, customer_name) VALUES
(1,'Alice'),(2,'Bob'),(3,'Charlie'),(4,'David'),(5,'Eva'),
(6,'Frank'),(7,'Grace'),(8,'Helen'),(9,'Ian'),(10,'Jane'),
(11,'Kevin'),(12,'Laura'),(13,'Mike'),(14,'Nina'),(15,'Oscar'),
(16,'Paul'),(17,'Queen'),(18,'Raj'),(19,'Sara'),(20,'Tom'),
(21,'Uma'),(22,'Victor'),(23,'Wendy'),(24,'Xander'),(25,'Yara'),
(26,'Zack'),(27,'Arjun'),(28,'Bella'),(29,'Chris'),(30,'Diya'),
(31,'Ethan'),(32,'Farah'),(33,'George'),(34,'Hina'),(35,'Imran'),
(36,'Jill'),(37,'Kabir'),(38,'Liam'),(39,'Maya'),(40,'Nikhil'),
(41,'Olivia'),(42,'Peter'),(43,'Qadir'),(44,'Rita'),(45,'Sam'),
(46,'Tina'),(47,'Uday'),(48,'Vikas'),(49,'Will'),(50,'Zoya');

INSERT INTO sales (customer_id, channel, sale_date, amount) VALUES
(1,'Store','2024-01-15',500),(2,'Online','2024-02-10',300),
(3,'Store','2024-03-05',450),(4,'Online','2024-01-20',700),
(5,'Store','2024-04-18',350),(6,'Online','2024-02-25',600),
(7,'Store','2024-03-22',250),(8,'Online','2024-05-10',400),
(9,'Store','2024-06-12',800),(10,'Online','2024-06-15',900),
(11,'Store','2024-07-01',300),(12,'Online','2024-07-20',450),
(13,'Store','2024-08-11',500),(14,'Online','2024-08-19',350),
(15,'Store','2024-09-09',600),(16,'Online','2024-09-21',750),
(17,'Store','2024-10-05',400),(18,'Online','2024-10-18',650),
(19,'Store','2024-11-14',900),(20,'Online','2024-11-25',800),
(21,'Store','2024-12-02',300),(22,'Online','2024-12-10',500),
(23,'Store','2024-01-12',700),(24,'Online','2024-01-28',250),
(25,'Store','2024-02-17',600),(26,'Online','2024-03-03',800),
(27,'Store','2024-03-15',450),(28,'Online','2024-03-29',550),
(29,'Store','2024-04-10',750),(30,'Online','2024-04-22',650),
(31,'Store','2024-05-14',500),(32,'Online','2024-06-01',700),
(33,'Store','2024-06-28',600),(34,'Online','2024-07-05',800),
(35,'Store','2024-07-19',400),(36,'Online','2024-08-02',500),
(37,'Store','2024-08-27',900),(38,'Online','2024-09-09',300),
(39,'Store','2024-09-22',650),(40,'Online','2024-10-01',450),
(41,'Store','2024-10-14',700),(42,'Online','2024-11-02',600),
(43,'Store','2024-11-18',350),(44,'Online','2024-11-29',550),
(45,'Store','2024-12-05',800),(46,'Online','2024-12-15',750),
(47,'Store','2024-01-09',500),(48,'Online','2024-02-14',650),
(49,'Store','2024-03-20',600),(50,'Online','2024-04-07',700);


/* Business Question

A retail company wants to analyze customers who either made a purchase in-store or made a purchase online during 2024. 
The management wants a single list of unique customers across both channels.*/

SELECT * FROM customers;

SELECT DISTINCT c.customer_id, c.customer_name
FROM customers c
JOIN sales s 
	ON c.customer_id = s.customer_id
WHERE s.channel = 'Store'
		AND
	  YEAR(s.sale_date)=2024

UNION

SELECT DISTINCT c.customer_id, c.customer_name
FROM customers c
JOIN sales s 
	ON c.customer_id = s.customer_id
WHERE s.channel = 'Online' 
		AND 
	  YEAR(s.sale_date)=2024;


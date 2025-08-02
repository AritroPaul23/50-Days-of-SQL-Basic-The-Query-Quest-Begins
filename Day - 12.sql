CREATE TABLE HotelBookings (
    BookingID INT,
    HotelName VARCHAR(100),
    City VARCHAR(50),
    BookingDate DATE,
    Nights INT,
    PricePerNight DECIMAL(10,2)
);


INSERT INTO HotelBookings (BookingID, HotelName, City, BookingDate, Nights, PricePerNight) VALUES
(1, 'Oberoi Grand', 'Kolkata', '2025-07-01', 3, 8500),
(2, 'Taj Palace', 'Delhi', '2025-07-01', 2, 12000),
(3, 'Marriott', 'Mumbai', '2025-07-02', 4, 9500),
(4, 'Leela Palace', 'Bangalore', '2025-07-02', 5, 10000),
(5, 'ITC Royal', 'Kolkata', '2025-07-03', 1, 7800),
(6, 'The Park', 'Chennai', '2025-07-04', 3, 6000),
(7, 'JW Marriott', 'Delhi', '2025-07-04', 2, 11000),
(8, 'Hyatt Regency', 'Mumbai', '2025-07-05', 4, 9000),
(9, 'Novotel', 'Hyderabad', '2025-07-06', 2, 7500),
(10, 'Taj Vivanta', 'Chennai', '2025-07-06', 3, 6800),
(11, 'Ritz Carlton', 'Bangalore', '2025-07-07', 4, 10500),
(12, 'The Leela', 'Delhi', '2025-07-08', 2, 12500),
(13, 'Holiday Inn', 'Mumbai', '2025-07-08', 3, 8800),
(14, 'Trident', 'Hyderabad', '2025-07-09', 1, 7700),
(15, 'ITC Gardenia', 'Bangalore', '2025-07-10', 2, 9500),
(16, 'The Residency', 'Chennai', '2025-07-11', 1, 5500),
(17, 'Taj Krishna', 'Hyderabad', '2025-07-11', 2, 8300),
(18, 'Four Seasons', 'Mumbai', '2025-07-12', 5, 9200),
(19, 'Claridges', 'Delhi', '2025-07-13', 1, 10200),
(20, 'Radisson Blu', 'Kolkata', '2025-07-14', 3, 7600);


-- Business Case – Hotel Industry:
/*Identify the top 3 cities that have the highest average revenue per booking across all hotels.*/

SELECT * FROM hotelbookings;

SELECT
	city,
    ROUND(AVG(Nights*PricePerNight), 2) AS Avg_Revenue_per_Booking
FROM hotelbookings
GROUP BY city
ORDER BY Avg_Revenue_per_Booking DESC LIMIT 3;


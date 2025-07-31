-- Query to create a real-life industry-level 'users' table

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY COMMENT 'Unique identifier for the user',
    username VARCHAR(50) NOT NULL UNIQUE COMMENT 'Unique username for login',
    email VARCHAR(100) NOT NULL UNIQUE COMMENT 'User''s email address, used for communication and login',
    password_hash VARCHAR(255) NOT NULL COMMENT 'Hashed password for security (never store plain passwords)',
    first_name VARCHAR(50) DEFAULT NULL COMMENT 'User''s first name',
    last_name VARCHAR(50) DEFAULT NULL COMMENT 'User''s last name',
    signup_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Date and time when the user signed up',
    last_login TIMESTAMP NULL DEFAULT NULL COMMENT 'Date and time of the user''s last login',
    is_active BOOLEAN NOT NULL DEFAULT TRUE COMMENT 'Status indicating if the user account is active (TRUE) or deactivated (FALSE)',
    last_updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Timestamp of the last update to the user record',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Timestamp of when the user record was created'
);

-- Query to insert 10 sample records into the 'users' table

INSERT INTO users (username, email, password_hash, first_name, last_name, signup_date, last_login, is_active) VALUES
('johndoe', 'john.doe@example.com', 'hashed_password_1', 'John', 'Doe', '2023-10-15 08:30:00', '2024-07-20 14:00:00', TRUE),
('janesmith', 'jane.smith@example.com', 'hashed_password_2', 'Jane', 'Smith', '2024-01-05 11:00:00', '2024-07-23 09:15:00', TRUE),
('petermartin', 'peter.m@example.com', 'hashed_password_3', 'Peter', 'Martin', '2023-12-01 16:45:00', '2024-06-01 10:30:00', TRUE),
('alicebrown', 'alice.b@example.com', 'hashed_password_4', 'Alice', 'Brown', '2024-02-20 09:00:00', '2024-07-22 17:00:00', TRUE),
('bobwhite', 'bob.w@example.com', 'hashed_password_5', 'Bob', 'White', '2024-01-01 00:00:00', '2024-01-01 00:00:00', TRUE), -- Signed up exactly on Jan 1, 2024
('charliedavis', 'charlie.d@example.com', 'hashed_password_6', 'Charlie', 'Davis', '2024-03-10 13:00:00', NULL, FALSE), -- Inactive user
('evagreen', 'eva.g@example.com', 'hashed_password_7', 'Eva', 'Green', '2023-11-25 10:00:00', '2024-07-18 11:45:00', TRUE),
('frankblack', 'frank.b@example.com', 'hashed_password_8', 'Frank', 'Black', '2024-04-01 07:00:00', '2024-07-21 20:00:00', TRUE),
('gracelee', 'grace.l@example.com', 'hashed_password_9', 'Grace', 'Lee', '2024-01-15 14:00:00', '2024-07-19 16:30:00', TRUE),
('davidwilson', 'david.w@example.com', 'hashed_password_10', 'David', 'Wilson', '2023-09-01 09:00:00', '2024-05-10 08:00:00', FALSE); -- Inactive user

-- Business Question
-- Find all active users who signed up after Jan 1, 2024.

SELECT * FROM users;

SELECT
	  user_id,
      username,
      first_name,
      last_name,
      signup_date,
      is_active
FROM users
WHERE is_active = TRUE
	  AND
      signup_date > '2024-01-01';

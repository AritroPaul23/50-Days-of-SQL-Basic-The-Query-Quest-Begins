-- Departments Table
CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100)
);

-- Tickets Table
CREATE TABLE support_tickets (
    ticket_id INT PRIMARY KEY AUTO_INCREMENT,
    department_id INT,
    issue_type VARCHAR(100),
    urgency_level INT, -- 1=Low, 2=Medium, 3=High, 4=Critical
    created_at DATE,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);


INSERT INTO departments (department_name) VALUES
('IT Support'),
('HR'),
('Finance'),
('Operations'),
('Customer Service');

INSERT INTO support_tickets (department_id, issue_type, urgency_level, created_at) VALUES
(1, 'Password Reset', 2, '2024-01-05'),
(1, 'Server Down', 4, '2024-01-06'),
(1, 'Software Installation', 3, '2024-01-08'),
(1, 'Email Access Issue', 2, '2024-01-15'),
(1, 'Network Slowness', 3, '2024-02-02'),

(2, 'Payroll Issue', 3, '2024-02-05'),
(2, 'Recruitment Portal Access', 2, '2024-02-08'),
(2, 'Leave Balance Error', 2, '2024-02-10'),
(2, 'Employee Onboarding', 1, '2024-02-15'),
(2, 'Policy Clarification', 1, '2024-02-20'),

(3, 'Invoice Error', 3, '2024-03-01'),
(3, 'Budget Approval Delay', 2, '2024-03-03'),
(3, 'Expense Reimbursement', 2, '2024-03-06'),
(3, 'Fraud Alert', 4, '2024-03-08'),
(3, 'Tax Compliance Query', 3, '2024-03-10'),

(4, 'Logistics Delay', 3, '2024-04-01'),
(4, 'Vendor Contract Issue', 2, '2024-04-05'),
(4, 'Warehouse Safety', 4, '2024-04-08'),
(4, 'Supply Chain Breakdown', 4, '2024-04-12'),
(4, 'Inventory Shortage', 3, '2024-04-15'),

(5, 'Customer Complaint - Billing', 3, '2024-05-01'),
(5, 'Refund Request', 2, '2024-05-04'),
(5, 'Product Replacement', 2, '2024-05-07'),
(5, 'Critical Customer Escalation', 4, '2024-05-10'),
(5, 'Service Downtime', 4, '2024-05-14'),

-- More tickets spread into 2025
(1, 'VPN Issue', 3, '2025-01-05'),
(1, 'Antivirus Renewal', 2, '2025-01-08'),
(1, 'System Crash', 4, '2025-01-12'),
(1, 'New Laptop Request', 1, '2025-01-18'),
(1, 'Outlook Crash', 3, '2025-01-22'),

(2, 'Salary Discrepancy', 4, '2025-02-01'),
(2, 'New Policy Update', 1, '2025-02-05'),
(2, 'Interview Scheduling', 2, '2025-02-08'),
(2, 'Background Verification', 2, '2025-02-12'),
(2, 'Training Request', 1, '2025-02-15'),

(3, 'Payment Gateway Issue', 4, '2025-03-01'),
(3, 'Bank Reconciliation Error', 3, '2025-03-04'),
(3, 'Budget Report Missing', 2, '2025-03-06'),
(3, 'Investment Approval Delay', 2, '2025-03-10'),
(3, 'Audit Request', 3, '2025-03-14'),

(4, 'Machine Breakdown', 4, '2025-04-01'),
(4, 'Transport Delay', 3, '2025-04-05'),
(4, 'Vendor Non-Compliance', 2, '2025-04-08'),
(4, 'Power Outage', 4, '2025-04-12'),
(4, 'Packaging Issue', 2, '2025-04-15'),

(5, 'App Crash', 3, '2025-05-01'),
(5, 'Complaint Escalation', 4, '2025-05-04'),
(5, 'Order Not Delivered', 3, '2025-05-07'),
(5, 'Refund Delay', 2, '2025-05-10'),
(5, 'Customer Call Back Request', 1, '2025-05-15');

/* Business Question

Rank support tickets by urgency within each department. Output the ticket ID, department, issue type, urgency level, and its rank in that department.*/

SELECT * FROM departments;

SELECT * FROM support_tickets;

SELECT support_tickets.ticket_id,
		departments.department_name,
		support_tickets.issue_type,
        support_tickets.urgency_level,
        DENSE_RANK() OVER ( PARTITION BY departments.department_name ORDER BY support_tickets.urgency_level DESC, support_tickets.created_at ASC ) AS `rank`
FROM departments INNER JOIN support_tickets
ON departments.department_id = support_tickets.department_id;

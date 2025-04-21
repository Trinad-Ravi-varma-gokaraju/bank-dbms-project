-- Insert into Customers
INSERT INTO Customers VALUES 
(1, 'Alice Johnson', 'alice@example.com', '123-456-7890', '123 Maple St', '2023-05-10'),
(2, 'Bob Smith', 'bob@example.com', '456-789-1230', '456 Oak St', '2023-06-15');

-- Insert into Employees
INSERT INTO Employees VALUES
(101, 'Jane Doe', 'Manager', 'Downtown Branch', 'jane@bank.com'),
(102, 'Mark Lee', 'Teller', 'Uptown Branch', 'mark@bank.com');

-- Insert into Accounts
INSERT INTO Accounts VALUES
(1001, 1, 'Savings', 5000.00),
(1002, 2, 'Checking', 1200.00);

-- Insert into Transactions
INSERT INTO Transactions VALUES
(201, 1001, 1002, 'transfer', 250.00, '2024-04-01 09:45:00'),
(202, 1002, NULL, 'withdraw', 100.00, '2024-04-02 14:20:00');

-- Insert into Loans
INSERT INTO Loans VALUES
(301, 1, 'Home Loan', 250000.00, 5.5, 'approved'),
(302, 2, 'Car Loan', 15000.00, 7.0, 'pending');

-- Insert into Users
INSERT INTO Users VALUES
(1, 'alicej', 'hashed_pw_alice', 'Customer'),
(2, 'bobsmith', 'hashed_pw_bob', 'Customer'),
(3, 'admin', 'hashed_pw_admin', 'Admin');

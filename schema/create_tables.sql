-- Create Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15),
    address TEXT,
    date_joined DATE
);

-- Create Employees Table
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    position VARCHAR(50),
    branch_name VARCHAR(100),
    email VARCHAR(100)
);

-- Create Accounts Table
CREATE TABLE Accounts (
    account_id INT PRIMARY KEY,
    customer_id INT,
    account_type VARCHAR(50),
    balance DECIMAL(15,2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Create Transactions Table
CREATE TABLE Transactions (
    txn_id INT PRIMARY KEY,
    from_account INT,
    to_account INT,
    txn_type VARCHAR(20), -- deposit, withdraw, transfer
    amount DECIMAL(15,2),
    txn_date DATETIME,
    FOREIGN KEY (from_account) REFERENCES Accounts(account_id),
    FOREIGN KEY (to_account) REFERENCES Accounts(account_id)
);

-- Create Loans Table
CREATE TABLE Loans (
    loan_id INT PRIMARY KEY,
    customer_id INT,
    loan_type VARCHAR(50),
    amount DECIMAL(15,2),
    interest_rate DECIMAL(5,2),
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Create Users Table (for login/auth roles)
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    password_hash VARCHAR(255),
    role VARCHAR(20) -- Admin, Employee, Customer
);

-- Create Audit Log Table
CREATE TABLE Audit_Log (
    log_id INT PRIMARY KEY,
    action VARCHAR(255),
    performed_by INT,
    action_date DATETIME
);

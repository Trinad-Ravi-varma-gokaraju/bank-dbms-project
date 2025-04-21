-- Total deposits per month
SELECT 
    FORMAT(txn_date, 'yyyy-MM') AS Month,
    SUM(amount) AS TotalDeposits
FROM Transactions
WHERE txn_type = 'deposit'
GROUP BY FORMAT(txn_date, 'yyyy-MM');

-- Top 5 customers by total account balance
SELECT 
    c.customer_id, c.name, SUM(a.balance) AS TotalBalance
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.name
ORDER BY TotalBalance DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;

-- Employee count per branch
SELECT 
    branch_name,
    COUNT(*) AS employee_count
FROM Employees
GROUP BY branch_name;

-- Loan status summary
SELECT 
    status,
    COUNT(*) AS total_loans,
    SUM(amount) AS total_amount
FROM Loans
GROUP BY status;

-- Daily transaction summary
SELECT 
    CAST(txn_date AS DATE) AS Day,
    COUNT(*) AS total_transactions,
    SUM(amount) AS total_amount
FROM Transactions
GROUP BY CAST(txn_date AS DATE)
ORDER BY Day DESC;

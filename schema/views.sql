-- View: Customer account summary
CREATE VIEW vw_CustomerAccountSummary AS
SELECT 
    c.customer_id,
    c.name,
    a.account_id,
    a.account_type,
    a.balance
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id;

-- View: Loan summary
CREATE VIEW vw_LoanStatusSummary AS
SELECT 
    l.loan_id,
    c.name AS customer_name,
    l.loan_type,
    l.amount,
    l.status
FROM Loans l
JOIN Customers c ON c.customer_id = l.customer_id;

-- View: Daily transaction overview
CREATE VIEW vw_DailyTransactions AS
SELECT 
    CAST(txn_date AS DATE) AS transaction_date,
    COUNT(*) AS total_transactions,
    SUM(amount) AS total_amount
FROM Transactions
GROUP BY CAST(txn_date AS DATE);

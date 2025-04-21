-- Trigger to log transactions into Audit_Log
CREATE TRIGGER trg_LogTransactions
ON Transactions
AFTER INSERT
AS
BEGIN
    INSERT INTO Audit_Log (log_id, action, performed_by, action_date)
    SELECT 
        ISNULL((SELECT MAX(log_id) FROM Audit_Log), 1000) + 1,
        CONCAT('Transaction of $', inserted.amount, ' from Acc ', inserted.from_account, ' to Acc ', inserted.to_account),
        NULL,
        GETDATE()
    FROM inserted;
END;

-- Trigger to prevent overdraft
CREATE TRIGGER trg_PreventOverdraft
ON Transactions
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @FromAccount INT, @Amount DECIMAL(15,2), @Balance DECIMAL(15,2);

    SELECT TOP 1 @FromAccount = from_account, @Amount = amount
    FROM inserted
    WHERE txn_type = 'withdraw';

    SELECT @Balance = balance FROM Accounts WHERE account_id = @FromAccount;

    IF @Balance >= @Amount
    BEGIN
        INSERT INTO Transactions SELECT * FROM inserted;
        UPDATE Accounts SET balance = balance - @Amount WHERE account_id = @FromAccount;
    END
    ELSE
    BEGIN
        RAISERROR('Withdrawal denied: Insufficient funds', 16, 1);
    END
END;

-- Trigger to log new customer
CREATE TRIGGER trg_LogNewCustomer
ON Customers
AFTER INSERT
AS
BEGIN
    INSERT INTO Audit_Log (log_id, action, performed_by, action_date)
    SELECT 
        ISNULL((SELECT MAX(log_id) FROM Audit_Log), 1000) + 1,
        CONCAT('New customer added: ', name),
        NULL,
        GETDATE()
    FROM inserted;
END;

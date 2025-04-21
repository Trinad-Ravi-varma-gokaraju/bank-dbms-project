-- Procedure to add a new customer
CREATE PROCEDURE AddNewCustomer
    @CustomerID INT,
    @Name VARCHAR(100),
    @Email VARCHAR(100),
    @Phone VARCHAR(15),
    @Address TEXT,
    @DateJoined DATE
AS
BEGIN
    INSERT INTO Customers VALUES (@CustomerID, @Name, @Email, @Phone, @Address, @DateJoined);
END;

-- Procedure to transfer funds between two accounts
CREATE PROCEDURE TransferFunds
    @FromAccount INT,
    @ToAccount INT,
    @Amount DECIMAL(15,2)
AS
BEGIN
    DECLARE @FromBalance DECIMAL(15,2);
    SELECT @FromBalance = balance FROM Accounts WHERE account_id = @FromAccount;

    IF @FromBalance >= @Amount
    BEGIN
        UPDATE Accounts SET balance = balance - @Amount WHERE account_id = @FromAccount;
        UPDATE Accounts SET balance = balance + @Amount WHERE account_id = @ToAccount;

        INSERT INTO Transactions (txn_id, from_account, to_account, txn_type, amount, txn_date)
        VALUES (
            (SELECT ISNULL(MAX(txn_id), 200) + 1 FROM Transactions),
            @FromAccount, @ToAccount, 'transfer', @Amount, GETDATE()
        );
    END
    ELSE
    BEGIN
        RAISERROR('Insufficient Balance', 16, 1);
    END
END;

-- Procedure to apply for a loan
CREATE PROCEDURE ApplyLoan
    @LoanID INT,
    @CustomerID INT,
    @LoanType VARCHAR(50),
    @Amount DECIMAL(15,2),
    @InterestRate DECIMAL(5,2),
    @Status VARCHAR(20)
AS
BEGIN
    INSERT INTO Loans VALUES (@LoanID, @CustomerID, @LoanType, @Amount, @InterestRate, @Status);
END;

-- Procedure to get customer summary (accounts + loans)
CREATE PROCEDURE GetCustomerSummary
    @CustomerID INT
AS
BEGIN
    SELECT * FROM Accounts WHERE customer_id = @CustomerID;
    SELECT * FROM Loans WHERE customer_id = @CustomerID;
END;

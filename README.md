# 🏦 Bank Database Management System

This project is a complete **Bank Database Management System** built using **MS SQL Server**. It simulates operations in a banking environment including customer onboarding, transaction handling, loan management, and analytics.

---

## 📁 Folder Structure

bank-dbms-project/ ├── schema/ │ ├── create_tables.sql -- Table creation scripts │ ├── insert_data.sql -- Sample data inserts │ ├── stored_procedures.sql -- Procedures for key operations │ └── triggers.sql -- Business logic triggers ├── queries/ │ └── analytics_queries.sql -- Reporting and insights queries ├──
README.md


---

## 🧩 Features

- ✅ **Normalized Schema** with referential integrity
- ✅ **Stored Procedures** for customer creation, fund transfer, and loan application
- ✅ **Triggers** for overdraft protection, audit logging, and fraud detection
- ✅ **Analytical Queries** for business insights
- ✅ Designed for scalability and maintainability

---

## 🧪 How to Run

1. Open MS SQL Server Management Studio (SSMS)
2. Run the following scripts in order:
   - `schema/create_tables.sql`
   - `schema/insert_data.sql`
   - `schema/stored_procedures.sql`
   - `schema/triggers.sql`
3. Optionally, explore:
   - `queries/analytics_queries.sql` for reporting examples

---

## 📊 Sample Queries

```sql
-- Top 5 Customers by Balance
SELECT c.name, SUM(a.balance) AS TotalBalance
FROM Customers c
JOIN Accounts a ON c.customer_id = a.customer_id
GROUP BY c.name
ORDER BY TotalBalance DESC;

📌 Technologies Used

MS SQL Server
SQL (DDL, DML, Procedural SQL)
Git + GitHub

👨‍💻 Author
Trinad Ravi Varma Gokaraju
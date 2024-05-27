1. Let's write the SQL queries for each of the tasks specified:
i. Find all customers who have an account but no loan in the bank.

To find customers who have an account but no loan, we can use a `LEFT JOIN` to join the `Depositor` table with the `Borrower` table and then filter out those who have loans by checking for `NULL` in the `loan-number` field from the `Borrower` table.

```sql
SELECT DISTINCT D.customer-name
FROM Depositor D
LEFT JOIN Borrower B ON D.customer-name = B.customer-name
WHERE B.loan-number IS NULL;
```

### ii. Delete all loan amounts between 10,000/- and 25,000/-.

To delete all loans where the amount is between 10,000 and 25,000, we can use the `DELETE` statement with a `WHERE` clause.

```sql
DELETE FROM Loan
WHERE amount BETWEEN 10000 AND 25000;
```

### iii. Find the names of all customers who have a loan at the Perryridge branch.

To find all customers who have a loan at the Perryridge branch, we need to join the `Borrower`, `Loan`, and `Customer` tables and filter by the branch name.

```sql
SELECT DISTINCT B.customer-name
FROM Borrower B
JOIN Loan L ON B.loan-number = L.loan-number
JOIN Branch Br ON L.branch-name = Br.branch-name
WHERE Br.branch-name = 'Perryridge';
```

### iv. Delete all loans with an amount in the range 0 to 500.

To delete all loans with an amount between 0 and 500, we can use a `DELETE` statement similar to the one in part ii.

```sql
DELETE FROM Loan
WHERE amount BETWEEN 0 AND 500;
```

These queries should accomplish the specified tasks given the structure of the bank database relations.


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


2.Let's write the SQL queries for each of the specified tasks related to the employee database:

### i. Find the company that has the most employees.

To find the company with the most employees, we need to count the number of employees for each company and then select the company with the highest count.

```sql
SELECT company-name
FROM Works
GROUP BY company-name
ORDER BY COUNT(employee-id) DESC
LIMIT 1;
```

### ii. Find the average salaries at each company.

To find the average salaries at each company, we need to group the results by `company-name` and calculate the average salary.

```sql
SELECT company-name, AVG(salary) AS average_salary
FROM Works
GROUP BY company-name;
```

### iii. Find all employees who live in Barisal city, but their company is not in Barisal.

To find employees who live in Barisal but whose company is not in Barisal, we need to join the `Employee` and `Works` tables and then join with the `Company` table to filter the results accordingly.

```sql
SELECT E.employee-name
FROM Employee E
JOIN Works W ON E.employee-id = W.employee-id
JOIN Company C ON W.company-name = C.company-name
WHERE E.city = 'Barisal' AND C.city <> 'Barisal';
```

### iv. Find the names of all employees who work for First Bank Corporation.

To find the names of all employees who work for the First Bank Corporation, we need to join the `Employee` and `Works` tables and filter by the company name.

```sql
SELECT E.employee-name
FROM Employee E
JOIN Works W ON E.employee-id = W.employee-id
WHERE W.company-name = 'First Bank Corporation';
```

These queries should perform the specified tasks given the structure of the employee database relations.

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

3. Let's write the SQL queries for each of the specified tasks related to the banking database:

### i. Find all customers of the bank who have both a loan and a saving account.

To find customers who have both a loan and a saving account, we need to check for the existence of records in both the `Borrower` and `Depositor` tables for the same customer.

```sql
SELECT DISTINCT B.customer-name
FROM Borrower B
JOIN Depositor D ON B.customer-name = D.customer-name;
```

### ii. Find the average account balance at each branch.

To find the average account balance at each branch, we need to group the results by `branch-name` and calculate the average balance.

```sql
SELECT branch-name, AVG(balance) AS average_balance
FROM Saving-account
GROUP BY branch-name;
```

### iii. Deduct 3% service charge from saving account balance that have both a loan and a saving account; otherwise, deduct 5% service charge from saving account balance.

To accomplish this, we need to update the balances in the `Saving-account` table based on whether the account holder has a loan. We will use a subquery to identify those with both a loan and a saving account.

First, we identify the customers who have both a loan and a saving account:

```sql
-- Subquery to get customers with both loan and saving account
SELECT DISTINCT B.customer-name
FROM Borrower B
JOIN Depositor D ON B.customer-name = D.customer-name;
```

Next, we use this subquery in an `UPDATE` statement to apply the different service charges:

```sql
-- Update balances with a 3% service charge for customers with both a loan and a saving account
UPDATE Saving-account
SET balance = balance * 0.97
WHERE account number IN (
    SELECT D.account number
    FROM Depositor D
    JOIN Borrower B ON D.customer-name = B.customer-name
);

-- Update balances with a 5% service charge for all other customers
UPDATE Saving-account
SET balance = balance * 0.95
WHERE account number NOT IN (
    SELECT D.account number
    FROM Depositor D
    JOIN Borrower B ON D.customer-name = B.customer-name
);
```

These queries should accomplish the specified tasks given the structure of the banking database relations.

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

4. Let's write the SQL queries for each of the specified tasks related to the employee database:

### i. Find the names, cities, and salaries of all employees who work for IFIC Bank Ltd.

To find the names, cities, and salaries of all employees who work for IFIC Bank Ltd., we need to join the `Employee` and `Works` tables and filter by the company name.

```sql
SELECT E.employee-name, E.city, W.salary
FROM Employee E
JOIN Works W ON E.employee-name = W.employee-name
WHERE W.company-name = 'IFIC Bank Ltd';
```

### ii. Find the total salaries of each company.

To find the total salaries of each company, we need to group the results by `company-name` and sum the salaries.

```sql
SELECT company-name, SUM(salary) AS total_salaries
FROM Works
GROUP BY company-name;
```

### iii. Give all employees of First Bank Corporation a 20 percent salary raise.

To give all employees of First Bank Corporation a 20 percent salary raise, we need to update the `salary` field in the `Works` table for those employees.

```sql
UPDATE Works
SET salary = salary * 1.20
WHERE company-name = 'First Bank Corporation';
```

### iv. Find the names of all employees in this database who do not work for First Bank Corporation.

To find the names of all employees who do not work for First Bank Corporation, we can use a `SELECT` statement with a `WHERE` clause to filter out those who work for the specified company.

```sql
SELECT E.employee-name
FROM Employee E
WHERE E.employee-name NOT IN (
    SELECT W.employee-name
    FROM Works W
    WHERE W.company-name = 'First Bank Corporation'
);
```

These queries should accomplish the specified tasks given the structure of the employee database relations.

-----------------------------------------------------------------------------------------------------------------------------------

5. Let's write the SQL queries for each of the specified tasks related to the "car_insurance" database:

### i. Add a new accident to the database (assume any values for required attributes).

To add a new accident to the `Accident` table, we can use the `INSERT INTO` statement with assumed values.

```sql
INSERT INTO Accident (report-number, date, location)
VALUES ('AR1234', '2024-05-27', 'Dhaka');
```

### ii. Delete the Toyota belonging to "Simanto".

To delete the Toyota car belonging to "Simanto", we need to find the `driver-id` of "Simanto" from the `Person` table, join it with the `Owns` and `Car` tables, and then delete the relevant records.

```sql
-- First, find the driver-id of Simanto
SELECT driver-id 
FROM Person 
WHERE name = 'Simanto';

-- Next, delete the car record from the Owns and Car tables
DELETE FROM Owns
WHERE driver-id = (SELECT driver-id FROM Person WHERE name = 'Simanto')
AND license IN (SELECT license FROM Car WHERE model = 'Toyota');

DELETE FROM Car
WHERE model = 'Toyota'
AND license IN (SELECT license FROM Owns WHERE driver-id = (SELECT driver-id FROM Person WHERE name = 'Simanto'));
```

### iii. Find the total number of people who owned cars that were involved in accidents in 2020.

To find the total number of people who owned cars that were involved in accidents in 2020, we need to join the `Owns`, `Participate`, and `Accident` tables and filter the results by the accident date.

```sql
SELECT COUNT(DISTINCT O.driver-id) AS total_owners
FROM Owns O
JOIN Participate P ON O.license = P.car
JOIN Accident A ON P.report-number = A.report-number
WHERE A.date BETWEEN '2020-01-01' AND '2020-12-31';
```

### iv. Update the damage amount for the car with license number "DHAKA 4000" in the accident with report number "AR 2197" to 30,000/-.

To update the damage amount for the specified car and accident, we use the `UPDATE` statement with a `WHERE` clause.

```sql
UPDATE Participate
SET damage-amount = 30000
WHERE car = 'DHAKA 4000' AND report-number = 'AR 2197';
```

These queries should accomplish the specified tasks given the structure of the car insurance database relations.

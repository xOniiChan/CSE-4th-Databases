1------------------------------------------------------------------------------------------------------------------

-- Creating the Branch table
CREATE TABLE Branch (
    branch_name VARCHAR(50) PRIMARY KEY,
    branch_city VARCHAR(50),
    assets DECIMAL(15, 2)
);

-- Creating the Customer table
CREATE TABLE Customer (
    customer_name VARCHAR(50),
    customer_street VARCHAR(100),
    customer_city VARCHAR(50),
    PRIMARY KEY (customer_name)
);

-- Creating the Loan table
CREATE TABLE Loan (
    loan_number VARCHAR(50) PRIMARY KEY,
    branch_name VARCHAR(50),
    amount DECIMAL(15, 2),
    FOREIGN KEY (branch_name) REFERENCES Branch(branch_name)
);

-- Creating the Borrower table
CREATE TABLE Borrower (
    customer_name VARCHAR(50),
    loan_number VARCHAR(50),
    PRIMARY KEY (customer_name, loan_number),
    FOREIGN KEY (customer_name) REFERENCES Customer(customer_name),
    FOREIGN KEY (loan_number) REFERENCES Loan(loan_number)
);

-- Creating the Account table
CREATE TABLE Account (
    account_number VARCHAR(50) PRIMARY KEY,
    branch_name VARCHAR(50),
    balance DECIMAL(15, 2),
    FOREIGN KEY (branch_name) REFERENCES Branch(branch_name)
);

-- Creating the Depositor table
CREATE TABLE Depositor (
    customer_name VARCHAR(50),
    account_number VARCHAR(50),
    PRIMARY KEY (customer_name, account_number),
    FOREIGN KEY (customer_name) REFERENCES Customer(customer_name),
    FOREIGN KEY (account_number) REFERENCES Account(account_number)
);




2---------------------------------------------------------------------------------------------------------------------------------

-- Creating the Employee table
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    street VARCHAR(100),
    city VARCHAR(50)
);

-- Creating the Company table
CREATE TABLE Company (
    company_name VARCHAR(50) PRIMARY KEY,
    city VARCHAR(50)
);

-- Creating the Works table
CREATE TABLE Works (
    employee_id INT,
    company_name VARCHAR(50),
    salary DECIMAL(15, 2),
    PRIMARY KEY (employee_id, company_name),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id),
    FOREIGN KEY (company_name) REFERENCES Company(company_name)
);

-- Creating the Manager table
CREATE TABLE Manager (
    employee_id INT PRIMARY KEY,
    manager_name VARCHAR(50),
    FOREIGN KEY (employee_id) REFERENCES Employee(employee_id)
);


3----------------------------------------------------------------------------------------------------------------------


-- Creating the Branch table
CREATE TABLE Branch (
    branch_name VARCHAR(50) PRIMARY KEY,
    branch_city VARCHAR(50),
    assets DECIMAL(15, 2)
);

-- Creating the Customer table
CREATE TABLE Customer (
    customer_name VARCHAR(50) PRIMARY KEY,
    customer_street VARCHAR(100),
    customer_city VARCHAR(50)
);

-- Creating the Loan-account table
CREATE TABLE Loan_account (
    loan_number VARCHAR(50) PRIMARY KEY,
    branch_name VARCHAR(50),
    amount DECIMAL(15, 2),
    FOREIGN KEY (branch_name) REFERENCES Branch(branch_name)
);

-- Creating the Borrower table
CREATE TABLE Borrower (
    customer_name VARCHAR(50),
    loan_number VARCHAR(50),
    PRIMARY KEY (customer_name, loan_number),
    FOREIGN KEY (customer_name) REFERENCES Customer(customer_name),
    FOREIGN KEY (loan_number) REFERENCES Loan_account(loan_number)
);

-- Creating the Saving-account table
CREATE TABLE Saving_account (
    account_number VARCHAR(50) PRIMARY KEY,
    branch_name VARCHAR(50),
    balance DECIMAL(15, 2),
    FOREIGN KEY (branch_name) REFERENCES Branch(branch_name)
);

-- Creating the Depositor table
CREATE TABLE Depositor (
    customer_name VARCHAR(50),
    account_number VARCHAR(50),
    PRIMARY KEY (customer_name, account_number),
    FOREIGN KEY (customer_name) REFERENCES Customer(customer_name),
    FOREIGN KEY (account_number) REFERENCES Saving_account(account_number)
);


4----------------------------------------------------------------------------------------------------------------------------------


-- Creating the Employee table
CREATE TABLE Employee (
    employee_name VARCHAR(50) PRIMARY KEY,
    street VARCHAR(100),
    city VARCHAR(50)
);

-- Creating the Company table
CREATE TABLE Company (
    company_name VARCHAR(50) PRIMARY KEY,
    city VARCHAR(50)
);

-- Creating the Works table
CREATE TABLE Works (
    employee_name VARCHAR(50),
    company_name VARCHAR(50),
    salary DECIMAL(15, 2),
    PRIMARY KEY (employee_name, company_name),
    FOREIGN KEY (employee_name) REFERENCES Employee(employee_name),
    FOREIGN KEY (company_name) REFERENCES Company(company_name)
);

-- Creating the Manages table
CREATE TABLE Manages (
    employee_name VARCHAR(50),
    manages_name VARCHAR(50),
    PRIMARY KEY (employee_name, manages_name),
    FOREIGN KEY (employee_name) REFERENCES Employee(employee_name),
    FOREIGN KEY (manages_name) REFERENCES Employee(employee_name)
);


5------------------------------------------------------------------------------------------------------------------


-- Creating the Person table
CREATE TABLE Person (
    driver_id INT PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(100)
);

-- Creating the Car table
CREATE TABLE Car (
    license VARCHAR(20) PRIMARY KEY,
    model VARCHAR(50),
    year INT
);

-- Creating the Accident table
CREATE TABLE Accident (
    report_number INT PRIMARY KEY,
    date DATE,
    location VARCHAR(100)
);

-- Creating the Owns table
CREATE TABLE Owns (
    driver_id INT,
    license VARCHAR(20),
    PRIMARY KEY (driver_id, license),
    FOREIGN KEY (driver_id) REFERENCES Person(driver_id),
    FOREIGN KEY (license) REFERENCES Car(license)
);

-- Creating the Participate table
CREATE TABLE Participate (
    driver_id INT,
    license VARCHAR(20),
    report_number INT,
    damage_amount DECIMAL(15, 2),
    PRIMARY KEY (driver_id, license, report_number),
    FOREIGN KEY (driver_id) REFERENCES Person(driver_id),
    FOREIGN KEY (license) REFERENCES Car(license),
    FOREIGN KEY (report_number) REFERENCES Accident(report_number)
);


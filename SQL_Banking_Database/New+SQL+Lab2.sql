SET SQL_SAFE_UPDATES = 0;


create database BankingDB;
use BankingDB;
CREATE TABLE Customers
(
    CustomerID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

describe Customers;

CREATE TABLE Accounts (
    AccountID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10,2)
);

-- add customerID column to Account table --

alter table Accounts add column CustomerID int;

desc Accounts;

desc Customers;
alter table Customers ADD COLUMN DateOfBirth DATE;

alter table customers drop column Accountcreationdate;

alter table customers drop column balance;

insert into Customers (customerID, FirstName,lastname,Email,Phone,DateOfBirth)
values (101,'rahul','sharma','rahulsharma@gmail.com',8976547868,'1998-04-15');

insert into Customers (customerID, FirstName,lastname,Email,Phone,DateOfBirth)
values (102,'kunal','modi','kunalmodi@gmail.com',8976545748,'1997-08-25');

update customers set Phone=8856947148 where customerID=102;

update customers set Email='rahulpanday@gmail.com' where customerID=101;



desc customers;

select *from customers; 

insert into accounts values(201,'saving',25000.08,101);

desc accounts;





CREATE TABLE Transactions (
    TransactionID INT,
    TransactionDate DATE,
    Amount DECIMAL(10,2),
    TransactionType VARCHAR(20)
);

CREATE TABLE Branches (
    BranchID INT,
    BranchName VARCHAR(100),
    BranchAddress VARCHAR(200),
    BranchPhone VARCHAR(15)
);

CREATE TABLE AccountBranches ( 
		AssignmentDate DATE
);

CREATE TABLE Loans (
    LoanID INT,
    LoanAmount DECIMAL(10,2),
    InterestRate DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE
);

Describe Accounts;
Describe Transactions;
describe Branches;
describe AccountBranches;
describe Loans;

ALTER TABLE Customers
ADD DateOfBirth DATE;

describe Customers;

show table status;

ALTER TABLE Customers
MODIFY Phone VARCHAR(20);

ALTER TABLE Accounts
ADD CONSTRAINT chk_MinBalance
CHECK (Balance >= 1000);

-- voilates the condition doesnt accecpt balance less than 1000 --

insert into Accounts values (202,'current',999,102);

DROP TABLE AccountBranches;

ALTER TABLE Customers
ADD PRIMARY KEY (CustomerID);

ALTER TABLE Accounts
ADD CustomerID INT;
ALTER TABLE Accounts
ADD CONSTRAINT FK_Accounts_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);

ALTER TABLE Customers
MODIFY FirstName VARCHAR(50) NOT NULL;

ALTER TABLE Customers
ADD CONSTRAINT uq_Email UNIQUE (Email);


#########################################
-- Add Primary Keys
ALTER TABLE Accounts
ADD CONSTRAINT PK_Accounts
PRIMARY KEY (AccountID);

ALTER TABLE Transactions
ADD CONSTRAINT PK_Transactions
PRIMARY KEY (TransactionID);

ALTER TABLE Branches
ADD CONSTRAINT PK_Branches
PRIMARY KEY (BranchID);



ALTER TABLE Loans
ADD CONSTRAINT PK_Loans
PRIMARY KEY (LoanID);

-- Add Required Columns


ALTER TABLE Transactions
ADD AccountID INT;

ALTER TABLE Loans
ADD CustomerID INT;


ALTER TABLE Transactions
ADD CONSTRAINT FK_Transactions_Accounts
FOREIGN KEY (AccountID)
REFERENCES Accounts(AccountID);

delete from customers where customerid=101;

ALTER TABLE Loans
ADD CONSTRAINT FK_Loans_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);

ALTER TABLE Accounts
ADD BranchID INT;

ALTER TABLE Accounts
ADD CONSTRAINT FK_Accounts_Branches
FOREIGN KEY (BranchID)
REFERENCES Branches(BranchID);

SELECT *From Customers;




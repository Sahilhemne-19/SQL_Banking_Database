-- LAB 2 --

USE BANKINGDB;


CREATE TABLE Customers
(
CustomersID INT,
FirstName VARCHAR(50),
LastName VARCHAR(50),
Email VARCHAR(100),
Phone VARCHAR(20)
);

-- Add New Column in Table
ALTER TABLE Customers
Add AccountCreationDate DATE;

-- Drop Table Customers
DROP TABLE Customers;

CREATE TABLE Accounts(
AccountID INT,
AccountType VARCHAR(20),
Balance DECIMAL(10,2)
);

CREATE TABLE Transactions(
TransactionID INT,
TransactionDate DATE,
Amount DECIMAL(10,2),
TransactionType VARCHAR(20)
);

CREATE TABLE Branches(
BranchID INT,
BranchName VARCHAR(100),
BranchAddress VARCHAR(200),
BranchPhone VARCHAR(15)
);

CREATE TABLE AccountBranches(
AssignmentDate date

);

CREATE TABLE Loans(
LoanID INT,
LoanAmount DECIMAL(10,2),
IntrestRate DECIMAL(5,2),
StartDate DATE,
EndDate date
);

-- Structuring of Table
desc Accounts;

SHOW Tables;

# MODIFY THE TABLE STRUCTURE BY USING ALTER COMMAND
/* 
1> Add New Colimns 
2> Modify Existing Columns
3> Rename Columns
4> Add Constraints
5> Remove Constraints
*/

-- Change DataType Of Existing Column --
AlTER TABLE Customers MODIFY Phone INT;

DESC Customers;

ALTER TABLE Customers ADD COLUMN Balance bigint;

--  Add Minimum Balance Constraints --
ALTER TABLE Customers
ADD constraint Chk_MinBalance
CHECK(Balance>=5000);

-- DROP "AccountBranches" TABLE --
-- Syntax: DROP TABLE <Table_Name>; --
DROP TABLE AccountBranches;

Desc Customers;

-- Add Primary Key Constraints To "CustomerID" in Customer Table --

ALTER TABLE Customers
ADD primary key(CustomersID);

-- Add unique Constraints to "Phone" of Customers Table --
Alter TABLE Customers
ADD unique(Phone);

-- Constraints in sql 
-- DATE : 31 aug 2026
-- 1> NOT NULL  : NULL Value or blank values are not allowed 

CREATE TABLE Persons(
ID int NOT NULL,
LastName varchar(255) NOT NULL,
FirstName varchar(255) NOT NULL,
age int
);

DROP TABLE Persons;

DESC Persons;

-- ADD Null Constraints To 'AGE' Column --

ALTER TABLE Persons 
Modify column age int not null ;
INSERT INTO Persons VALUES(1,"Ganar","Vansh",20);

SELECT FirstName,LastName,
Concat(FirstName," ",LastName) 
as "Employee Name"  FROM Persons;

ALTER TABLE Persons
ADD Column Email Varchar(200);

ALTER TABLE Persons 
MODIFY Email Varchar(200) UNIQUE;

INSERT INTO Persons VALUES(2,"Saxena","Rajeev",23,"rajeev_sasena@gmail.com"),
(3,"Kapoor","jay",26,"kapoor_jay@gmail.com"),
(4,"Ganatra","Bhavin",23,"ganatra_bhavin12@gmail.com");

SELECT * FROM Persons;

ALTER TABLE Persons modify column ID int Primary key;

desc Persons;

-- CHECK() constraints on 'age' column --

ALTER TABLE Persons modify column age int check(age>18);

SELECT * FROM Persons;

INSERT INTO Persons VALUES(5,'Gandhi','Rahul',55,'gandhi_rahul154@gmail.com');


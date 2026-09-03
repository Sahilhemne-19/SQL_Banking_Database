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

INSERT INTO Persons VALUES(5,'Gandhi','Rahul',15,'gandhi_rahul154@gmail.com');

INSERT INTO Persons VALUES(6,'GANDHI','SANJAY',14,'GANDHI','SANJAY54@GMAIL.COM');

CREATE TABLE Employee (
EmployeeID INT PRIMARY KEY,
EmployeeName VARCHAR (100)NOT NULL,
Department VARCHAR (50),
Salary DECIMAL (10,2),
JointDate DATE DEFAULT (CURRENT_DATE),
City VARCHAR(50)
);

DESC Employee;


-- Insert One Record --
INSERT INTO Employee 
(EmployeeID, EmployeeName , Department, Salary, City) VALUES (1, 'Rahul Sharma','IT',50000,'mumbai');

select *from Employee;

ALTER TABLE Employee
MODIFY COLUMN Salary DECIMAL (10,2) DEFAULT (20000);

INSERT INTO Employee
(EmployeeID, EmployeeName , Department, City, JointDate)VALUES (2,'Darshan Panday','IT','nagpur','2026-08-30');

INSERT INTO Employee
(EmployeeID, EmployeeName , Department, City, JointDate)VALUES (3,'Aman Pandey','IT','nashik','2026-08-30');


INSERT INTO Employee
(EmployeeID, EmployeeNAme, Department, Salary, City)
VALUES
(4,'Priya Patil','HR',45000,'pune'),
(5,'Amita kumar','Finance',600000,'Delhi'),
(6,'Sneha Joshi','IT',55000,'Nagpur'),
(7,'Rohan Verma','Marketing',48000,'Mumbai');

# Adding DEFAULT Constraints to an existing table:
ALTER TABLE Employee
ALTER City SET DEFAULT 'Nagpur';

desc Employee;

INSERT INTO Employee
(EmployeeID, EmployeeName , Department, Salary)
VALUES 
(8,'Neha Singh','HR','56000');

-- Delete the entire row with specific condition of 'EmployeeID' is 7 of table 
# delete from Employee where EmployeeID=7;

-- Foreign key --

# 1)Create the parent table 
CREATE TABLE Department (
DepartmentID INT PRIMARY KEY, 
DepartmentName VARCHAR (50)
);

# 2) Insert Data into Department table
INSERT INTO Department (DepartmentID, DepartmentName)
VALUES
(101,'IT'),
(102,'HR'),
(103,'Fiance');

# 3) Create the child table with a forign key 

CREATE TABLE Employee_child (
EmployeeID INT PRIMARY KEY,
EmployeeName VARCHAR (100),
DepartmentID INT,
ManegerID VARCHAR(200),

FOREIGN KEY (DepartmentID)
REFERENCES Department(DepartmentID),

FOREIGN KEY (ManegerID)
REFERENCES Maneger(ManegerID)


);

CREATE TABLE Maneger (
ManegerID VARCHAR (200) PRIMARY KEY,
Maneger_NAME VARCHAR (100) NOT NULL);












 











 







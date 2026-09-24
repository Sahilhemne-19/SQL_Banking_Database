# Window Function In SQL
-- Syntax:
/*
	SELECT column_name1,
		window_function(column_name2)
        OVER ([PARTITION BY column_name3] [ORDER BY column_name4]) AS new_column
	FROM table_name;
    
*/

use bankingdb;

-- 1) ROW_NUMBER()
SELECT 
	salary,
    row_number() over(order by salary desc)
FROM employee;

-- 2) RANK()
-- Assign rank to each employee w.r.to salary
SELECT
	salary,
    rank() over(order by salary desc)
FROM employee;

-- 3) DENSE_RANK()
SELECT
	salary,
    dense_rank() over(order by salary desc)
FROM employee;

CREATE TABLE sales (
	sale_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    sales_date DATE,
    amount DECIMAL(10,2)
);

desc sales;

INSERT INTO sales
(sale_id, employee_name, department, sales_date, amount)
VALUES
(1, 'Amit', 'Electronics', '2026-01-05', 50000),
(2, 'Priya', 'Electronics', '2026-01-10', 75000),
(3, 'Rahul', 'Electronics', '2026-01-15', 75000),
(4, 'Sneha', 'Electronics', '2026-01-20', 90000),
(5, 'Vikas', 'Clothing', '2026-01-05', 40000),
(6, 'Neha', 'Clothing', '2026-01-10', 60000),
(7, 'Rohit', 'Clothing', '2026-01-15', 60000),
(8, 'Pooja', 'Clothing', '2026-01-20', 85000),
(9, 'Karan', 'Furniture', '2026-01-05', 30000),
(10, 'Anjali', 'Furniture', '2026-01-10', 55000);

select *from sales;

# Windows functions

-- 1) Assign ROW NUMBER 
	SELECT *, 
		row_number() over(ORDER BY amount DESC) AS 'ROW_NUMBER()',
         rank() over( ORDER BY amount DESC) AS 'RANK()',
        dense_rank() over( ORDER BY amount DESC) AS 'DENSE_RANK()'
		from sales;
        
-- 2) PARTITION_BY

	SELECT department,amount,
		rank() 
        over(partition by department order by amount DESC) as 'department rank',
        dense_rank() 
        over(partition by department order by amount DESC) as 'department dense rank',
        sum(amount)
        over(partition by department order by amount DESC) as 'running total amount department_wise'
        FROM sales;
        
-- 3) Percentage_wise contribution of each department

	select
		employee_name, department,amount,
        round(amount/sum(amount) over(partition by department)*100,3) as 'Departmentwise_employee_contribution'
FROM sales;

-- LAG()-->compare CURRENT value with previous one
SELECT
	sale_id, department, amount, sales_date, amount,
    lag(amount) over(order by sales_date)
FROM sales;

-- LEAD(): compare value with next value
SELECT
	sale_id, department, amount, sales_date, amount,
    lead(amount) over(order by sales_date)
FROM sales;

-- Running Total sales with use of sum() --
SELECT sale_id,department,sales_date,amount,
sum(amount) over(partition by department order by sales_date) as 'running_total'
FROM sales;

-- Average Sale Departmentwise --
SELECT sale_id,department,sales_date,amount,
concat('₹ ',round(avg(amount) over(partition by department order by sales_date),2)) as 'running_total'
FROM sales; 

-- FIRST_VALUE() & LAST_VALUE --
SELECT department,amount,
first_value(amount) over(partition by department order by amount desc) as 'First_Value',
last_value(amount) over(partition by department order by amount desc rows between unbounded preceding and unbounded following) as 'Last_Value'
FROM sales;

-- NTILE() : Divides rows into a specified number of approximately equal groups --

select department, amount, ntile(3) over(order by amount desc) amount_3_quartile
from sales;

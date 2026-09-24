create database n325_db;
use n325_db;

create table customers (
customer_id int primary key,
customer_name varchar(50),
city varchar(50)
);

insert into customers 
values
(101,'Amit','Nagpur'),
(102,'priya','pune'),
(103,'Rahul','Mumbai'),
(104,'sneha','Delhi'),
(105,'Vikas','Nashik');

CREATE TABLE orders (
	order_id INT PRIMARY KEY,
    customer_id INT,
    product VARCHAR(50),
    amount DECIMAL(10,2)
);

insert into orders
values
(1,101,'laptop',55000),
(2,102,'Mobile',25000),
(3,101,'Mouse',1500),
(4,103,'keyboard',3000),
(5,102,'Monitor',12000),
(6,106,'printer',10000);

drop table orders;
select * from customers;
select * from orders;


-- inner joins ; inner joins return only records that have matching values in both tables.

select x.*,y.*

FROM customers as x
inner JOIN orders as y
ON x.customer_id = y.customer_id;

select x.*,y.product,y.amount

FROM customers as x
inner JOIN orders as y
ON x.customer_id = y.customer_id;

-- left joins--
select 
     c.customer_id,
	 c.customer_name,
     o.product,
     o.amount
     
     from customers as c
     inner join orders as o
     on c.customer_id = o.customer_id;
     
     select x.*,y.*

FROM customers as x
left JOIN orders as y
ON x.customer_id = y.customer_id;

   -- right joins --
     
     select 
     c.customer_id,
	 c.customer_name,
     o.product,
     o.amount

FROM customers as c
right JOIN orders as o
ON c.customer_id = o.customer_id;

-- cross join --

select 
 c.*,o.*
 from customers c
 cross join orders o;
 

   
## SELF JOIN
-- 1) A SELF JOIN means joining a table with itself.
-- 2) It is useful when records within the same table have relationships with each other.
CREATE TABLE employees (
	employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    manager_id INT 
);

INSERT INTO employees
VALUES
(1,'Amit',NULL),  #Amit is a itself manager
(2,'Priya',1),
(3,'Rahul',1),
(4,'Sneha',2),
(5,'Rocky',3);

SELECT 
	e.employee_name AS Employee,
    m.employee_name AS Manager
FROM employees e
left JOIN employees m
ON e.manager_id = m.employee_id;

--------------------------------- self join ----------------------------------------

create table employee_new(

 emp_id int primary key , 
 emp_name varchar (50),
 department varchar (100)
);

desc employee_new;


insert into employee_new values 
(1,'Rahul','IT'),
(2,'priya','HR'),
(3,'Hitesh','IT'),
(4,'Gaurav','HR'),
(5,'Amit','Finance');

select *from employee_new;

select  e_n1.emp_name,e_n2.emp_name,e_n1.department,e_n2.department
from employee_new e_n1
join employee_new e_n2
on e_n1.department = e_n2.department;



## FULL OUTER JOIN: MySQL does not directly support, but we can make full outer join by union of LEFT JOIN & RIGHT JOIN.
-- This will give records from both tables, including unmatached records. -- 


select 

c.customer_id,
c.customer_name,
o.order_id,
o.product
from customers c
left join orders o
on c.customer_id = o.customer_id;

select 


c.customer_id,
c.customer_name,
o.order_id,
o.product
from customers c
right join orders o
on c.customer_id = o.customer_id;

select 

c.customer_id,
c.customer_name,
o.order_id,
o.product
from customers c
left join orders o
on c.customer_id = o.customer_id

union

select

c.customer_id,
c.customer_name,
o.order_id,
o.product
from customers c
right join orders o
on c.customer_id = o.customer_id;

## joins with where clause  
-- where cluse use to pass the condition on record ---

select 

	c.*,o.product,o.amount
    from customers c
    inner join orders o
    on c.customer_id = o.customer_id
    where o.product in ('laptop','monitor') and c.city='nagpur';
    
    
	-- having cluase use to filter the row -- 
    
    
    select 

	c.*,sum(o.amount)
    from customers c
    inner join orders o
    on c.customer_id = o.customer_id
   group by o.customer_id,o.product;
   
   
   select sum(amount)from orders group by customer_id;
   
   
   -- joins with group by 
   -- suppose we want to find the total amount by each customer 
   
   select 
	c.customer_name,c.city,
    sum(o.amount)as 'total_amount_spent'
    
from customers c
inner join orders o 
on c.customer_id = o.customer_id 
group by c.customer_id,c.customer_name  
having c.city in ('pune','nagpur','mumbai') order by c.customer_name limit 1 offset 1;

## joinns with having 
-- find customers whose total purchese is grater than ₹30,000

select 
	c.customer_name,
    sum(o.amount) as total_amount
    
    from customers c
    inner join orders o
    on c.customer_id = o.customer_id
    group by c.customer_id,c.customer_name
    having sum(o.amount) >30000;
    
    ## multiple table join 
    -- we can join more than two tables 
    
    select 
    
		c.*,
        o.*
        from customers c
        inner join orders o 
        on c.customer_id = o.customer_id;
        
        create table products (product_id varchar(50) primary key ,product_name varchar(50),manufactured_at varchar(100));
        
        insert into products values 
        ('501','laptop','USA'),
        ('502','mobile','south korea'),
        ('503','keyborad','china'),
        ('504','monitor','taiwan');
        







   
  
    








   








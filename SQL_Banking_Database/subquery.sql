create database shoppingdb;
use shoppingdb;

CREATE TABLE users (
	user_id INT PRIMARY KEY,
    username VARCHAR(50),
    country VARCHAR(50),
    followers int
);

CREATE TABLE posts (
	post_id INT PRIMARY KEY,
    user_id INT,
    post_text VARCHAR(255),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO users
(user_id, username, country, followers)
VALUES
(1,'Rahul','India',80000),
(2,'Priya','India',60000),
(3,'Amit','India',30000),
(4,'Sneha','USA',90000),
(5,'John','USA',70000),
(6,'Emma','USA',40000),
(7,'Rohan','UK',20000),
(8,'Sophia','Uk',10000);

INSERT INTO posts
(post_id, user_id, post_text)
VALUES
(101,1,'Learning SQL'),
(102,1,'Learning Python'),
(103,2,'Data Science'),
(104,4,'Machine Learning'),
(105,4,'AI Tutorial'),
(106,5,'Power BI'),
(107,7,'My First Post');

## SUBQUERY :-
-- Type 1 : Scalar Subquery :- Returns One Row & One Column

-- 1) Find average followers
SELECT round(AVG(followers),2) AS 'Average Followers'
FROM users;

-- 2) Find Users whose followers are more than the average followers
SELECT username, followers
FROM users
WHERE followers > (
	SELECT AVG(followers)
    FROM users
);

-- 3) Find User With Maximum Followers
SELECT MAX(followers)
FROM users;

SELECT username, followers, country
FROM users
WHERE followers = (
	SELECT MAX(followers)
	FROM users
);

-- 4) Find User with Minimum Followers 
SELECT username, followers, country
FROM users
WHERE followers = (
	SELECT MIN(followers)
	FROM users
);

-- 5) Find Users Above 50,000 Followers
SELECT username, followers, country
FROM users
WHERE followers > 50000;

-- Using sub-query
SELECT username, followers
FROM users
WHERE followers > (
	SELECT 50000
);

-- Type 2
## Multiple-Row Subquery
/*
	A multiple-row subquery returns multiple rows, It is commonly used with:
    1) IN 2) ANY 3) ALL 4) EXISTS
*/

## IN with Subquery
SELECT country, avg(followers)
FROM users
GROUP BY country
HAVING AVG(followers) > 50000;

-- 1) Find users from countries whose average followers exceed 50000
SELECT username, country ,followers 
FROM users
WHERE country IN (
	SELECT country
	FROM users
	GROUP BY country
	HAVING AVG(followers) > 50000
);

-- 2) Find users who are not from countries having average followers above 50000
SELECT username, country, followers
FROM users
WHERE country NOT IN (
	SELECT country
    FROM users
    GROUP BY country
    HAVING AVG(followers) > 50000
);

-- 3) ANY with Subquery
-- ANY compares values with at least one value returned by the subquery.
SELECT followers 
	FROM users
    WHERE country = 'UK';
-- Q. Find users whose followers are greater than at least one of these values.
SELECT username, followers
FROM users
WHERE followers > ANY (
	SELECT followers
    FROM users
    WHERE country = 'UK'
);

-- 4) ALL with subquery
-- ALL requires the comparison to be true for every value returned by the subquery.
SELECT followers 
FROM users
WHERE country = 'UK';

-- Q: find users whose followers are greater than every UK user's followers.
SELECT username, followers
FROM users
WHERE followers > ALL (
	SELECT followers 
    FROM users
    WHERE country = 'UK'
);

## EXISTS with Subquery
-- Checks whether the subquery returns at least one record.

-- Q. Find users who have at least one post
SELECT username, user_id
FROM users u
WHERE EXISTS (
	SELECT 1
    FROM posts p
    WHERE p.user_id = u.user_id
);

## NOT EXISTS with Subquery
-- Q. Find users who have never created a post.
SELECT username, user_id
FROM users u
WHERE NOT EXISTS (
	SELECT 1
    FROM posts p
    WHERE p.user_id = u.user_id
);

-- 24 sept 2026 --
#type 3

### correlated subquery ; A correlated subquery referance a column from the outer query and is evaluated 
##for each outer row.

-- ques : find users whose followers are greater than their country average.

select country , avg(followers)
from users
group by country order by avg(followers) desc;


select 

u1.username,
u1.country,
u1.followers
from users u1
where u1. followers > (
select avg (u2.followers)
from users u2 
where u2.country = u1.country
);


-- ques : find users whose followers are less than their country average.

select country , avg(followers)
from users
group by country order by avg(followers) desc;


select 

u1.username,
u1.country,
u1.followers
from users u1
where u1. followers < (
select avg (u2.followers)
from users u2 
where u2.country = u1.country
);


### Ques: find users above their country average 

select 
u.username,
u.country,
u.followers
from users u
where u. followers > (
select avg (x.followers)
from users x 
where x.country = u.country
);

## subquery in from 
/*
A subquery inside from is called a :
1) derived taBLE 2) TABLE SUNQUERY 3) Inline view

in behavea like a tempory table and have an aliase in mysql.
*/

select 
 country, 
 avg (followers) as avg_followers
 
 from users
 group by country;
 
 select 
 country_data.country,
 country_data.avg_followers
 
 from(
 select 
 country,
 avg (followers) as avg_followers
 from users
 group by country
 ) as country_data
 where country_data.avg_followers > 50000;
 
 ## subquery in where clause 
 
 
 select *
 from(
 select  
 country ,
 count(user_id) as total_users,
 avg(followers) as avg_followers
 
 from users 
 group by country
 
 ) as country_summary where country in('india','USA','UK');
 
 
 
 ## subquery in where clause 
 -- sub query in where clause are commonly 
 
 select distinct users_id from posts;
 
 -- ques: 1) find user who have post 
 
 select user_id, username
 from users
 where user_id in (
 select  distinct user_id from posts);
 
 -- ques: 2) find users without post
 
 select user_id, username 
 from users
 where user_id not in (
 select  distinct user_id from posts);
 
 
 ## nested subquery ; A subQuery can contaion another subquery 
 
 select username, followers
 from users
 where followers >(
 select avg (followers)
 from users
 where country = (
 select country 
 from users
 where username = 'rahul'
 ));
 
 
 
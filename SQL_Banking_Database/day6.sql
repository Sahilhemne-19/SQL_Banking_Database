-- day 5 SQL 2/09/2026 --

CREATE DATABASE InstagramDB;

use InstagramDB;

CREATE TABLE Users (
 user_id INT AUTO_INCREMENT PRIMARY KEY,
 username VARCHAR(50) NOT NULL UNIQUE,
 email VARCHAR (100) NOT NULL UNIQUE,
 first_name VARCHAR (50),
 last_name VARCHAR (50),
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- 2, PROFILE TABLE --
-- ONE - TO -ONE Relationship with users --

CREATE TABLE Profiles (
 profile_id INT AUTO_INCREMENT PRIMARY KEY,
 user_id INT UNIQUE NOT NULL ,
 boi VARCHAR (255),
 profile_picture VARCHAR(255),
 date_of_birth DATE,
 
 FOREIGN KEY (user_id)
 REFERENCES users(user_id)
 ON DELETE CASCADE
); 


-- 3, POST TABLE --
-- ONE USER CAN CREATE MANY POSTS
-- ONE-TO-MANY relationship

CREATE TABLE Posts (
 post_id INT AUTO_INCREMENT PRIMARY KEY,
 user_id INT NOT NULL,content TEXT,
 image_url VARCHAR(255),create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 
 FOREIGN KEY (user_id)
 REFERENCES users(user_id)
 ON DELETE CASCADE
 
);

-- 4, COMMMENTS TABLE -- 
-- WEAK ENTITY 
-- DEPEND ON USER AND POST 


CREATE TABLE Comments (
comment_id INT AUTO_INCREMENT PRIMARY KEY,
user_id INT NOT NULL,
post_id INT NOT NULL,
comment_text VARCHAR(500),
created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

FOREIGN KEY (user_id)
REFERENCES users(user_id)
ON DELETE CASCADE,

FOREIGN KEY (post_id)
REFERENCES posts(post_id)
ON DELETE CASCADE

); 


-- 5, LIKES TABLE
-- CREATE MANT-TO-MANY
-- BETWEEN USER AND POST --

CREATE TABLE likes (
user_id INT,
post_id INT,
liked_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

PRIMARY KEY (user_id, post_id),

FOREIGN KEY (user_id)
REFERENCES Users(user_id)
ON DELETE CASCADE,

FOREIGN KEY (post_id)
REFERENCES Posts(post_id)
ON DELETE CASCADE
);

# INSERT DATA :

INSERT INTO users 
(username, email, first_name, last_name)
VALUES

('hitesh123','hitesh@gmail.com','hitesh','pandey'),
('rahul123','rahul@gmail.com','rahul','sharma'),
('priya123','priya@gmail.com','priya','patil');

INSERT INTO profiles
(user_id, boi, date_of_birth)
VALUES

(1,'Data Science Trainer','1995-05-10'),
(2,'Software Developer','1998-08-15'),
(3,'Data Anayst','1999-12-20');

INSERT INTO Posts 
(user_id,content,image_url)
VALUES

(1,'Learning SQL Database Relationship','sql.jpg'),
(1,'Today we  Learned Foreign Keys','ForeignKey.jpg'),
(2,'Hello From Instagram Database','Instagram.jpg');

-- insert comments --


INSERT INTO Comments 
(user_id,post_id, comment_text)
VALUES
(2,1,'Great explanation'),(3,1,'Very useful topic'),
(1,3,'welcome to the platform ');

select *from Comments;

desc Comments;

-- insert likes 

INSERT INTO Likes 
(user_id, post_id)
VALUES
(2,1),(3,1),(1,3),(3,3);

SELECT *from Likes;






















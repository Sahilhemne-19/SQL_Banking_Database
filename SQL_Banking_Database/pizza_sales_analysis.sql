CREATE DATABASE pizza_sales_analysis;
SHOW DATABASES;
use pizza_sales_analysis;

CREATE TABLE `order` (
    id INT,
    date DATE
);

ALTER TABLE `order`
ADD time TIME AFTER date;

RENAME TABLE `order` TO orders;

ALTER TABLE orders 
ADD PRIMARY KEY (id);

SELECT * FROM orders;















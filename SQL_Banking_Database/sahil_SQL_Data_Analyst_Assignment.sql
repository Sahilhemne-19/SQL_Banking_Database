CREATE DATABASE analyst_sales_db;
USE analyst_sales_db;

-- 1. Customers Table
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    signup_date DATE,
    segment VARCHAR(30)
);

-- 2. Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    subcategory VARCHAR(50),
    unit_price DECIMAL(10,2)
);

-- 3. Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    sales_channel VARCHAR(30),
    payment_method VARCHAR(30),
    order_status VARCHAR(30),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- 4. Order Items Table
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    discount_pct DECIMAL(5,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


-- Customers Data
INSERT INTO customers VALUES
(101,'Aarav Sharma','Nagpur', 'Maharashtra', '2025-01-15', 'Retail'),
(102,'Priya Patil', 'Pune','Maharashtra', '2025-02-20', 'Corporate'),
(103,'Rahul Verma', 'Mumbai', 'Maharashtra','2025-03-05', 'Retail'),
(104,'Sneha Joshi','Nashik','Maharashtra', '2025-03-18','SMB'),
(105, 'Vikram Singh', 'Delhi','Delhi', '2025-04-10', 'Corporate'),
(106,'Ananya Rao', 'Bengaluru', 'Karnataka','2025-04-25', 'Retail'),
(107,'Rohan Mehta', 'Hyderabad', 'Telangana','2025-05-12', 'SMB'),
(108,'Neha Kulkarni', 'Nagpur', 'Maharashtra','2025-05-30', 'Retail'),
(109, 'Karan Gupta', 'Jaipur', 'Rajasthan', '2025-06-08', 'Corporate'),
(110,'Meera Shah','Ahmedabad', 'Gujarat','2025-06-21','SMB'),
(111,'Aditya Deshmukh','Pune', 'Maharashtra', '2025-07-03', 'Retail'),
(112,'Isha Kapoor','Delhi','Delhi','2025-07-19', 'Corporate'),
(113,'Manish Yadav','Indore','Madhya Pradesh', '2025-08-02', 'Retail'),
(114,'Kavya Nair', 'Kochi', 'Kerala', '2025-08-16','SMB'),
(115, 'Siddharth Jain', 'Mumbai', 'Maharashtra','2025-09-01', 'Corporate');

-- Products Data
INSERT INTO products VALUES
(201,'Laptop Pro 14', 'Electronics', 'Laptops', 65000.00),
(202,'Laptop Air 13', 'Electronics', 'Laptops', 52000.00),
(203, 'Wireless Mouse', 'Electronics', 'Accessories', 1200.00),
(204,'Mechanical Keyboard', 'Electronics', 'Accessories', 3500.00),
(205,'Office Chair', 'Furniture', 'Chairs', 8500.00),
(206, 'Standing Desk', 'Furniture', 'Desks', 18000.00),
(207,'Monitor 24 Inch', 'Electronics', 'Monitors', 12500.00),
(208,'Monitor 27 Inch', 'Electronics', 'Monitors', 18500.00),
(209,'USB-C Hub', 'Electronics', 'Accessories', 2200.00),
(210,'Bookshelf', 'Furniture', 'Storage', 6500.00);

-- Orders Data
INSERT INTO orders VALUES
(1001,101,'2025-07-02', 'Online', 'UPI', 'Delivered'),
(1002,102,'2025-07-04', 'Online', 'Credit Card', 'Delivered'),
(1003,103,'2025-07-06', 'Store', 'Cash', 'Delivered'),
(1004,104,'2025-07-09', 'Online', 'UPI', 'Delivered'),
(1005,105,'2025-07-12', 'Online', 'Credit Card', 'Cancelled'),
(1006,106,'2025-07-15', 'Store', 'Debit Card', 'Delivered'),
(1007,107,'2025-07-18', 'Online', 'UPI', 'Delivered'),
(1008,108,'2025-07-22', 'Store', 'Cash', 'Returned'),
(1009,109,'2025-07-25', 'Online', 'Credit Card','Delivered'),
(1010,110,'2025-07-28', 'Online', 'UPI', 'Delivered'),
(1011,111,'2025-08-02', 'Store', 'Debit Card', 'Delivered'),
(1012,112,'2025-08-05', 'Online', 'Credit Card','Delivered'),
(1013,113,'2025-08-09', 'Online', 'UPI', 'Delivered'),
(1014,114,'2025-08-13', 'Store','Cash', 'Delivered'),
(1015,115,'2025-08-18', 'Online', 'Credit Card','Delivered'),
(1016,101,'2025-08-21', 'Online', 'UPI','Delivered'),
(1017,103,'2025-08-24', 'Store','Cash', 'Delivered'),
(1018,105,'2025-08-28', 'Online', 'Credit Card', 'Delivered'),
(1019,108,'2025-09-02', 'Online', 'UPI', 'Delivered'),
(1020,110,'2025-09-05', 'Store', 'Debit Card', 'Delivered'),
(1021,112,'2025-09-08', 'Online', 'Credit Card', 'Cancelled'),
(1022,115,'2025-09-11', 'Online', 'UPI','Delivered'),
(1023,102,'2025-09-14', 'Store', 'Debit Card', 'Delivered'),
(1024,106,'2025-09-17', 'Online', 'Credit Card', 'Delivered'),
(1025,109,'2025-09-20', 'Online', 'UPI', 'Delivered');

-- Order Items Data
INSERT INTO order_items VALUES
(1,1001,201,1,5.00),
(2,1001,203,2,10.00),
(3,1002,206,2,5.00),
(4,1002,204,2,0.00),
(5,1003,205,1,10.00),
(6,1003,203,1,0.00),
(7,1004,207,2,5.00),
(8,1005,201,1,0.00),
(9,1006,202,1,8.00),
(10,1006,209,2,5.00),
(11,1007,208,1,10.00),
(12,1007,203,3,5.00),
(13,1008,206,1,0.00),
(14,1009,201,2,7.50),
(15,1009,209,2,5.00),
(16,1010,205,2,12.00),
(17,1011,207,1,5.00),
(18,1011,204,1,0.00),
(19,1012,202,2,10.00),
(20,1013,210,2,5.00),
(21,1013,203,2,0.00),
(22,1014,205,1,5.00),
(23,1015,201,1,6.00),
(24,1015,208,1,8.00),
(25,1016,204,2,10.00),
(26,1016,209,1,5.00),
(27,1017,203,4,10.00),
(28,1018,206,1,8.00),
(29,1018,207,2,5.00),
(30,1019,202,1,5.00),
(31,1019,203,2,0.00),
(32,1020,205,2,10.00),
(33,1021,201,1,0.00),
(34,1022,208,2,7.00),
(35,1023,206,1,5.00),
(36,1023,209,2,10.00),
(37,1024,202,1,5.00),
(38,1024,207,1,5.00),
(39,1025,201,1,10.00),
(40,1025,204,2,5.00);


--  section 3: Business Questions - Basic SQL --


-- Q1. Display all customers from Maharashtra.
SELECT * 
FROM customers 
WHERE state = 'Maharashtra';

-- Q2. Display all products with a unit price greater than 10,000.
SELECT * 
FROM products 
WHERE unit_price > 10000;

-- Q3. Find all orders placed through the Online sales channel.
SELECT * 
FROM orders 
WHERE sales_channel = 'Online';

-- Q4. Display customers who signed up after 1 June 2025.
SELECT * 
FROM customers 
WHERE signup_date > '2025-06-01';

-- Q5. Find all delivered orders placed using UPI.
SELECT * 
FROM orders 
WHERE order_status = 'Delivered' 
  AND payment_method = 'UPI';

-- Q6. Display products belonging to the Electronics category and Accessories subcategory.
SELECT * 
FROM products 
WHERE category = 'Electronics' 
  AND subcategory = 'Accessories';

-- Q7. Find orders placed between 1 August 2025 and 31 August 2025.
SELECT * 
FROM orders 
WHERE order_date BETWEEN '2025-08-01' AND '2025-08-31';

-- Q8. Display customers whose names start with the letter 'A'.
SELECT * 
FROM customers 
WHERE customer_name LIKE 'A%';

-- Q9. Display products whose names contain the word 'Monitor'.
SELECT * 
FROM products 
WHERE product_name LIKE '%Monitor%';

-- Q10. Find orders that were either Cancelled or Returned.
SELECT * 
FROM orders 
WHERE order_status IN ('Cancelled', 'Returned');


-- section 4: Aggregation and GROUP BY --


-- Q1. Find the total number of customers in each state.
SELECT 
    state, 
    COUNT(customer_id) AS total_customers
FROM customers
GROUP BY state;

-- Q2. Find the number of customers in each segment.
SELECT 
    segment, 
    COUNT(customer_id) AS total_customers
FROM customers
GROUP BY segment;

-- Q3. Find the average product price for each category.
SELECT 
    category, 
    ROUND(AVG(unit_price), 2) AS avg_price
FROM products
GROUP BY category;

-- Q4. Find the maximum and minimum product price in each category.
SELECT 
    category, 
    MAX(unit_price) AS max_price,
    MIN(unit_price) AS min_price
FROM products
GROUP BY category;

-- Q5. Find the total quantity sold for each product.
SELECT 
    product_id, 
    SUM(quantity) AS total_quantity_sold
FROM order_items
GROUP BY product_id;

-- Q6. Find the total number of orders for each sales channel.
SELECT 
    sales_channel, 
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY sales_channel;

-- Q7. Find the number of orders for each payment method.
SELECT 
    payment_method, 
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY payment_method;

-- Q8. Find the total sales amount generated by each order. 
-- Formula: quantity * unit_price * (1 - discount_pct / 100)
SELECT 
    oi.order_id,
    ROUND(SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)), 2) AS total_order_sales
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY oi.order_id;

-- Q9. Find the total sales amount for each product category, considering only Delivered orders.
SELECT 
    p.category,
    ROUND(SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)), 2) AS category_revenue
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.category;

-- Q10. Find customers who have placed more than one order.
SELECT 
    customer_id, 
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 1;



-- section 5: JOIN-Based Analysis --


-- Q1. Display order_id, customer_name, order_date, order_status, and sales_channel.
SELECT 
    o.order_id,
    c.customer_name,
    o.order_date,
    o.order_status,
    o.sales_channel
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

-- Q2. Display order_id, product_name, quantity, unit_price, and discount_pct.
SELECT 
    oi.order_id,
    p.product_name,
    oi.quantity,
    p.unit_price,
    oi.discount_pct
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id;

-- Q3. Display customer_name, city, product_name, category, quantity, and order_date.
SELECT 
    c.customer_name,
    c.city,
    p.product_name,
    p.category,
    oi.quantity,
    o.order_date
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;

-- Q4. Find the total revenue generated by each customer from Delivered orders.
SELECT 
    c.customer_id,
    c.customer_name,
    ROUND(SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)), 2) AS total_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY c.customer_id, c.customer_name;

-- Q5. Find the total revenue generated by each city.
SELECT 
    c.city,
    ROUND(SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)), 2) AS city_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY c.city;

-- Q6. Find the top 5 products by total revenue.
SELECT 
    p.product_id,
    p.product_name,
    ROUND(SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)), 2) AS total_revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.product_id, p.product_name
ORDER BY total_revenue DESC
LIMIT 5;

-- Q7. Find the number of different products purchased by each customer.
SELECT 
    c.customer_id,
    c.customer_name,
    COUNT(DISTINCT oi.product_id) AS distinct_products_bought
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name;

-- Q8. Find customers who have purchased a Laptop product.
SELECT DISTINCT 
    c.customer_id,
    c.customer_name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE p.subcategory = 'Laptops' OR p.product_name LIKE '%Laptop%';

-- Q9. Find all products that have never appeared in an order.
SELECT 
    p.product_id,
    p.product_name
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
WHERE oi.order_item_id IS NULL;

-- Q10. Find the total quantity sold by product category.
SELECT 
    p.category,
    SUM(oi.quantity) AS total_quantity_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.category;



-- section 6: HAVING and Business KPI Questions --


-- Q1. Find product categories whose total revenue is greater than 50,000.
SELECT 
    p.category,
    ROUND(SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)), 2) AS total_revenue
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.category
HAVING total_revenue > 50000;

-- Q2. Find customers whose total Delivered-order revenue is greater than 50,000.
SELECT 
    c.customer_id,
    c.customer_name,
    ROUND(SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)), 2) AS total_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY c.customer_id, c.customer_name
HAVING total_revenue > 50000;

-- Q3. Find cities having more than 2 customers.
SELECT 
    city,
    COUNT(customer_id) AS total_customers
FROM customers
GROUP BY city
HAVING COUNT(customer_id) > 2;

-- Q4. Find products whose total quantity sold is greater than 5.
SELECT 
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS total_quantity_sold
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name
HAVING total_quantity_sold > 5;

-- Q5. Calculate the average order value (AOV) for Delivered orders.
SELECT 
    ROUND(AVG(order_val.order_revenue), 2) AS average_order_value
FROM (
    SELECT 
        o.order_id,
        SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)) AS order_revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    WHERE o.order_status = 'Delivered'
    GROUP BY o.order_id
) AS order_val;

-- Q6. Calculate total revenue, total orders, total customers, and average order value for Delivered orders.
SELECT 
    ROUND(SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)), 2) AS total_revenue,
    COUNT(DISTINCT o.order_id) AS total_delivered_orders,
    COUNT(DISTINCT o.customer_id) AS total_unique_customers,
    ROUND(SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)) / COUNT(DISTINCT o.order_id), 2) AS avg_order_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered';

-- Q7. Calculate the percentage contribution of each product category to total Delivered revenue.
SELECT 
    p.category,
    ROUND(SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)), 2) AS category_revenue,
    ROUND(
        (SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)) / 
        (SELECT SUM(oi2.quantity * p2.unit_price * (1 - oi2.discount_pct / 100))
         FROM orders o2
         JOIN order_items oi2 ON o2.order_id = oi2.order_id
         JOIN products p2 ON oi2.product_id = p2.product_id
         WHERE o2.order_status = 'Delivered')) * 100, 2
    ) AS pct_contribution
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.category;

-- Q8. Find the month having the highest Delivered revenue.
SELECT 
    DATE_FORMAT(o.order_date, '%Y-%m') AS order_month,
    ROUND(SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)), 2) AS monthly_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY order_month
ORDER BY monthly_revenue DESC
LIMIT 1;

-- Q9. Find the payment method generating the highest number of Delivered orders.
SELECT 
    payment_method,
    COUNT(order_id) AS delivered_orders_count
FROM orders
WHERE order_status = 'Delivered'
GROUP BY payment_method
ORDER BY delivered_orders_count DESC
LIMIT 1;

-- Q10. Calculate the cancellation rate = Cancelled orders / total orders * 100.
SELECT 
    ROUND(
        (SUM(CASE WHEN order_status = 'Cancelled' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2
    ) AS cancellation_rate_pct
FROM orders;



-- section 7: Subqueries - WITHOUT CTE --


-- Q1. Find products whose price is greater than the average product price.
SELECT * 
FROM products 
WHERE unit_price > (
    SELECT AVG(unit_price) 
    FROM products
);

-- Q2. Find customers who have placed at least one order.
SELECT * 
FROM customers 
WHERE customer_id IN (
    SELECT DISTINCT customer_id 
    FROM orders
);

-- Q3. Find customers who have never placed an order.
SELECT * 
FROM customers 
WHERE customer_id NOT IN (
    SELECT DISTINCT customer_id 
    FROM orders
);

-- Q4. Find products whose price is greater than the average price of their category.
SELECT p1.* 
FROM products p1
WHERE unit_price > (
    SELECT AVG(unit_price) 
    FROM products p2 
    WHERE p2.category = p1.category
);

-- Q5. Find the second-highest priced product using a subquery.
SELECT * 
FROM products 
WHERE unit_price = (
    SELECT MAX(unit_price) 
    FROM products 
    WHERE unit_price < (SELECT MAX(unit_price) FROM products)
);

-- Q6. Find customers whose total order count is greater than the average order count per customer.
SELECT 
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) > (
    SELECT COUNT(order_id) / COUNT(DISTINCT customer_id)
    FROM orders
);

-- Q7. Find orders whose total order value is greater than the average order value.
SELECT 
    oi.order_id,
    ROUND(SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)), 2) AS order_value
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY oi.order_id
HAVING order_value > (
    SELECT AVG(order_val)
    FROM (
        SELECT SUM(oi2.quantity * p2.unit_price * (1 - oi2.discount_pct / 100)) AS order_val
        FROM order_items oi2
        JOIN products p2 ON oi2.product_id = p2.product_id
        GROUP BY oi2.order_id
    ) AS avg_orders
);

-- Q8. Find the product(s) with the highest unit price.
SELECT * 
FROM products 
WHERE unit_price = (
    SELECT MAX(unit_price) 
    FROM products
);

-- Q9. Find customers who purchased at least one product from the Electronics category.
SELECT DISTINCT 
    c.customer_id, 
    c.customer_name
FROM customers c
WHERE c.customer_id IN (
    SELECT o.customer_id
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    WHERE p.category = 'Electronics'
);

-- Q10. Find the city with the highest total Delivered revenue.
SELECT city_rev.city, city_rev.total_revenue
FROM (
    SELECT 
        c.city,
        SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)) AS total_revenue
    FROM customers c
    JOIN orders o ON c.customer_id = o.customer_id
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    WHERE o.order_status = 'Delivered'
    GROUP BY c.city
) AS city_rev
ORDER BY city_rev.total_revenue DESC
LIMIT 1;



-- section 8: CASE Expression and Data Segmentation. --


-- Q1. Create a product price category: Budget (<5,000), Mid-Range (₹5,000-20,000), Premium (>20,000).
SELECT 
    product_id,
    product_name,
    unit_price,
    CASE 
        WHEN unit_price < 5000 THEN 'Budget'
        WHEN unit_price BETWEEN 5000 AND 20000 THEN 'Mid-Range'
        ELSE 'Premium'
    END AS price_category
FROM products;

-- Q2. Classify customers by total Delivered revenue: Low (<20,000), Medium (₹20,000-50,000), High (>50,000).
SELECT 
    c.customer_id,
    c.customer_name,
    COALESCE(ROUND(SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)), 2), 0) AS total_delivered_revenue,
    CASE 
        WHEN SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)) < 20000 
             OR SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)) IS NULL THEN 'Low'
        WHEN SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)) BETWEEN 20000 AND 50000 THEN 'Medium'
        ELSE 'High'
    END AS revenue_segment
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id AND o.order_status = 'Delivered'
LEFT JOIN order_items oi ON o.order_id = oi.order_id
LEFT JOIN products p ON oi.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name;

-- Q3. Classify orders based on order value: Small (<10,000), Medium (₹10,000-30,000), Large (>30,000).
SELECT 
    oi.order_id,
    ROUND(SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)), 2) AS total_order_value,
    CASE 
        WHEN SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)) < 10000 THEN 'Small'
        WHEN SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)) BETWEEN 10000 AND 30000 THEN 'Medium'
        ELSE 'Large'
    END AS order_size_category
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY oi.order_id;

-- Q4. Create a customer activity label based on order count: New (1 order), Regular (2 orders), Frequent (3+ orders).
SELECT 
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders,
    CASE 
        WHEN COUNT(o.order_id) = 1 THEN 'New'
        WHEN COUNT(o.order_id) = 2 THEN 'Regular'
        WHEN COUNT(o.order_id) >= 3 THEN 'Frequent'
        ELSE 'Inactive'
    END AS activity_label
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;

-- Q5. Create a discount category: No Discount, Low Discount (1-5%), Medium Discount (5.01-10%), High Discount (>10%).
SELECT 
    order_item_id,
    order_id,
    product_id,
    discount_pct,
    CASE 
        WHEN discount_pct = 0 THEN 'No Discount'
        WHEN discount_pct BETWEEN 1.00 AND 5.00 THEN 'Low Discount'
        WHEN discount_pct > 5.00 AND discount_pct <= 10.00 THEN 'Medium Discount'
        WHEN discount_pct > 10.00 THEN 'High Discount'
        ELSE 'Other'
    END AS discount_category
FROM order_items;


-- section 9: Date and String Functions --


-- Q1. Display each order with the year, month number, and month name.
SELECT 
    order_id,
    order_date,
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS month_num,
    MONTHNAME(order_date) AS month_name
FROM orders;

-- Q2. Find the number of orders placed in each month.
SELECT 
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    MONTHNAME(order_date) AS month_name,
    COUNT(order_id) AS total_orders
FROM orders
GROUP BY YEAR(order_date), MONTH(order_date), MONTHNAME(order_date)
ORDER BY order_year, order_month;


-- Q3. Find customers whose signup date is older than 180 days from 20 September 2025.
SELECT * 
FROM customers 
WHERE DATEDIFF('2025-09-20', signup_date) > 180;

-- Q4. Display the number of days between customer signup_date and their first order date.
SELECT 
    c.customer_id,
    c.customer_name,
    c.signup_date,
    MIN(o.order_date) AS first_order_date,
    DATEDIFF(MIN(o.order_date), c.signup_date) AS days_to_first_order
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name, c.signup_date;

-- Q5. Display customer names in uppercase.
SELECT 
    customer_id,
    UPPER(customer_name) AS customer_name_uppercase
FROM customers;

-- Q6. Display each customer name and the first 3 characters of the name.
SELECT 
    customer_id,
    customer_name,
    LEFT(customer_name, 3) AS name_prefix
FROM customers;

-- Q7. Display city names in uppercase and the length of each city name.
SELECT DISTINCT 
    city,
    UPPER(city) AS city_uppercase,
    LENGTH(city) AS city_length
FROM customers;

-- Q8. Find orders placed on weekends using DAYOFWEEK().

SELECT * 
FROM orders 
WHERE DAYOFWEEK(order_date) IN (1, 7);

-- Q9. Find the number of days between each order_date and 20 September 2025.
SELECT 
    order_id,
    order_date,
    DATEDIFF('2025-09-20', order_date) AS days_difference
FROM orders;

-- Q10. Extract the year and month from order_date in YYYY-MM format.
SELECT 
    order_id,
    order_date,
    DATE_FORMAT(order_date, '%Y-%m') AS yearmonth
FROM orders;


-- section 10: Window Functions (WITHOUT CTE) --


-- Q1. Assign ROW_NUMBER() to orders for each customer based on order_date.
SELECT 
    order_id,
    customer_id,
    order_date,
    ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date) AS order_sequence
FROM orders;

-- Q2. Rank products by unit_price from highest to lowest using RANK().
SELECT 
    product_id,
    product_name,
    unit_price,
    RANK() OVER(ORDER BY unit_price DESC) AS price_rank
FROM products;

-- Q3. Rank products within each category using DENSE_RANK().
SELECT 
    product_id,
    product_name,
    category,
    unit_price,
    DENSE_RANK() OVER(PARTITION BY category ORDER BY unit_price DESC) AS category_price_rank
FROM products;

-- Q4. Calculate a running total of Delivered revenue ordered by order_date.
SELECT 
    o.order_id,
    o.order_date,
    ROUND(SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)), 2) AS order_revenue,
    ROUND(
        SUM(SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100))) 
        OVER(ORDER BY o.order_date, o.order_id), 2
    ) AS running_total_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY o.order_id, o.order_date;

-- Q5. Calculate each customer's previous order date using LAG().
SELECT 
    order_id,
    customer_id,
    order_date,
    LAG(order_date) OVER(PARTITION BY customer_id ORDER BY order_date) AS previous_order_date
FROM orders;

-- Q6. Calculate each customer's next order date using LEAD().
SELECT 
    order_id,
    customer_id,
    order_date,
    LEAD(order_date) OVER(PARTITION BY customer_id ORDER BY order_date) AS next_order_date
FROM orders;

-- Q7. Calculate each customer's cumulative revenue using SUM() OVER(PARTITION BY customer_id ORDER BY order_date).
SELECT 
    o.order_id,
    o.customer_id,
    o.order_date,
    ROUND(SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)), 2) AS order_revenue,
    ROUND(
        SUM(SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100))) 
        OVER(PARTITION BY o.customer_id ORDER BY o.order_date, o.order_id), 2
    ) AS customer_cumulative_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY o.order_id, o.customer_id, o.order_date;

-- Q8. Calculate each customer's percentage contribution to total Delivered revenue.
SELECT 
    c.customer_id,
    c.customer_name,
    ROUND(SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)), 2) AS customer_revenue,
    ROUND(
        (SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)) / 
        SUM(SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100))) OVER()) * 100, 2
    ) AS pct_of_total_revenue
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY c.customer_id, c.customer_name;

-- Q9. Find the highest-value order for each customer using a window function and a non-CTE approach.
SELECT 
    customer_id,
    order_id,
    order_revenue
FROM (
    SELECT 
        o.customer_id,
        o.order_id,
        ROUND(SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)), 2) AS order_revenue,
        DENSE_RANK() OVER(
            PARTITION BY o.customer_id 
            ORDER BY SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)) DESC
        ) AS rnk
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY o.customer_id, o.order_id
) AS ranked_orders
WHERE rnk = 1;

-- Q10. Compare each order's value with the customer's previous order value.
SELECT 
    customer_id,
    order_id,
    order_date,
    order_revenue,
    LAG(order_revenue) OVER(PARTITION BY customer_id ORDER BY order_date, order_id) AS previous_order_revenue,
    ROUND(
        order_revenue - LAG(order_revenue) OVER(PARTITION BY customer_id ORDER BY order_date, order_id), 2
    ) AS revenue_difference
FROM (
    SELECT 
        o.customer_id,
        o.order_id,
        o.order_date,
        ROUND(SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)), 2) AS order_revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    GROUP BY o.customer_id, o.order_id, o.order_date
) AS order_values;


-- section 11: Advanced Data Analyst Case Study --


-- Q1. Prepare a customer-level report containing customer name, city, segment, total orders, total quantity, total revenue, and average order value.
SELECT 
    c.customer_name,
    c.city,
    c.segment,
    COUNT(DISTINCT o.order_id) AS total_orders,
    COALESCE(SUM(oi.quantity), 0) AS total_quantity,
    ROUND(COALESCE(SUM(CASE WHEN o.order_status = 'Delivered' THEN oi.quantity * p.unit_price * (1 - oi.discount_pct / 100) ELSE 0 END), 0), 2) AS total_delivered_revenue,
    ROUND(
        COALESCE(SUM(CASE WHEN o.order_status = 'Delivered' THEN oi.quantity * p.unit_price * (1 - oi.discount_pct / 100) ELSE 0 END), 0) / 
        NULLIF(COUNT(DISTINCT CASE WHEN o.order_status = 'Delivered' THEN o.order_id END), 0), 2
    ) AS avg_order_value
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN order_items oi ON o.order_id = oi.order_id
LEFT JOIN products p ON oi.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name, c.city, c.segment;

-- Q2. Identify customers with no purchases and calculate the customer inactivity count.
SELECT 
    COUNT(c.customer_id) AS inactive_customer_count
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- Q3. Prepare a product-level report containing product name, category, quantity sold, revenue, average discount, and rank within category by revenue.
SELECT 
    p.product_name,
    p.category,
    COALESCE(SUM(oi.quantity), 0) AS total_quantity_sold,
    ROUND(COALESCE(SUM(CASE WHEN o.order_status = 'Delivered' THEN oi.quantity * p.unit_price * (1 - oi.discount_pct / 100) ELSE 0 END), 0), 2) AS total_revenue,
    ROUND(AVG(oi.discount_pct), 2) AS avg_discount_pct,
    DENSE_RANK() OVER(
        PARTITION BY p.category 
        ORDER BY COALESCE(SUM(CASE WHEN o.order_status = 'Delivered' THEN oi.quantity * p.unit_price * (1 - oi.discount_pct / 100) ELSE 0 END), 0) DESC
    ) AS rank_within_category
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
LEFT JOIN orders o ON oi.order_id = o.order_id
GROUP BY p.product_id, p.product_name, p.category;

-- Q4. Compare Online and Store sales using order count, quantity sold, and revenue.
SELECT 
    o.sales_channel,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity) AS total_quantity_sold,
    ROUND(SUM(CASE WHEN o.order_status = 'Delivered' THEN oi.quantity * p.unit_price * (1 - oi.discount_pct / 100) ELSE 0 END), 2) AS total_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY o.sales_channel;

-- Q5. Calculate monthly Delivered revenue and month-over-month revenue change using LAG().
SELECT 
    order_month,
    monthly_revenue,
    LAG(monthly_revenue) OVER(ORDER BY order_month) AS previous_month_revenue,
    ROUND(monthly_revenue - LAG(monthly_revenue) OVER(ORDER BY order_month), 2) AS mom_revenue_change
FROM (
    SELECT 
        DATE_FORMAT(o.order_date, '%Y-%m') AS order_month,
        ROUND(SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)), 2) AS monthly_revenue
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    JOIN products p ON oi.product_id = p.product_id
    WHERE o.order_status = 'Delivered'
    GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
) AS monthly_sales;

-- Q6. Calculate each category's revenue contribution percentage.
SELECT 
    p.category,
    ROUND(SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)), 2) AS category_revenue,
    ROUND(
        (SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)) / 
        (SELECT SUM(oi2.quantity * p2.unit_price * (1 - oi2.discount_pct / 100)) 
         FROM orders o2 
         JOIN order_items oi2 ON o2.order_id = oi2.order_id 
         JOIN products p2 ON oi2.product_id = p2.product_id 
         WHERE o2.order_status = 'Delivered')) * 100, 2
    ) AS revenue_contribution_pct
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'Delivered'
GROUP BY p.category;

-- Q7. Identify orders with value above the overall average Delivered order value.
SELECT 
    o.order_id,
    ROUND(SUM(oi.quantity * p.unit_price * (1 - oi.discount_pct / 100)), 2) AS order_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered'
GROUP BY o.order_id
HAVING order_value > (
    SELECT AVG(order_val)
    FROM (
        SELECT SUM(oi2.quantity * p2.unit_price * (1 - oi2.discount_pct / 100)) AS order_val
        FROM orders o2
        JOIN order_items oi2 ON o2.order_id = oi2.order_id
        JOIN products p2 ON oi2.product_id = p2.product_id
        WHERE o2.order_status = 'Delivered'
        GROUP BY o2.order_id
    ) AS avg_table
);

-- Q8. Identify repeat customers and calculate their repeat-order count.
SELECT 
    c.customer_id,
    c.customer_name,
    COUNT(o.order_id) AS total_orders,
    COUNT(o.order_id) - 1 AS repeat_order_count
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(o.order_id) > 1;

-- Q9. Calculate cancellation rate and return rate.
SELECT 
    ROUND((SUM(CASE WHEN order_status = 'Cancelled' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS cancellation_rate_pct,
    ROUND((SUM(CASE WHEN order_status = 'Returned' THEN 1 ELSE 0 END) / COUNT(*)) * 100, 2) AS return_rate_pct
FROM orders;

-- Q10. Create a final management query showing month, total orders, delivered orders, cancelled orders, returned orders, revenue, and average order value.
SELECT 
    DATE_FORMAT(o.order_date, '%Y-%m') AS order_month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT CASE WHEN o.order_status = 'Delivered' THEN o.order_id END) AS delivered_orders,
    COUNT(DISTINCT CASE WHEN o.order_status = 'Cancelled' THEN o.order_id END) AS cancelled_orders,
    COUNT(DISTINCT CASE WHEN o.order_status = 'Returned' THEN o.order_id END) AS returned_orders,
    ROUND(SUM(CASE WHEN o.order_status = 'Delivered' THEN oi.quantity * p.unit_price * (1 - oi.discount_pct / 100) ELSE 0 END), 2) AS total_revenue,
    ROUND(
        SUM(CASE WHEN o.order_status = 'Delivered' THEN oi.quantity * p.unit_price * (1 - oi.discount_pct / 100) ELSE 0 END) / 
        NULLIF(COUNT(DISTINCT CASE WHEN o.order_status = 'Delivered' THEN o.order_id END), 0), 2
    ) AS avg_order_value
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY order_month;










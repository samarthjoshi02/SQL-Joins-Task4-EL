-- Task 4: SQL Intermediate - JOINS (Restaurant Orders + Customers)
-- Dataset tables assumed:
-- customers(customer_id, name, email, country, age, signup_date, marketing_opt_in)
-- restaurant_orders(Order ID, Customer Name, Food Item, Category, Quantity, Price, Payment Method, Order Time)

-- 1) Preview tables
SELECT * FROM customers LIMIT 10;
SELECT * FROM restaurant_orders LIMIT 10;

-- 2) INNER JOIN: Orders matched with customers (by customer name)
SELECT 
    o.`Order ID`            AS order_id,
    o.`Order Time`          AS order_time,
    o.`Customer Name`       AS customer_name,
    c.customer_id,
    c.email,
    c.country,
    c.age,
    c.signup_date,
    o.`Food Item`           AS food_item,
    o.Category              AS order_category,
    o.Quantity,
    o.Price,
    (o.Quantity * o.Price)  AS total_amount,
    o.`Payment Method`      AS payment_method
FROM restaurant_orders o
INNER JOIN customers c
    ON o.`Customer Name` = c.name
ORDER BY o.`Order Time`;

-- 3) LEFT JOIN: show all orders even if customer details are missing
SELECT 
    o.`Order ID`       AS order_id,
    o.`Customer Name`  AS customer_name,
    c.customer_id,
    c.email,
    c.country
FROM restaurant_orders o
LEFT JOIN customers c
    ON o.`Customer Name` = c.name;

-- 4) Find orders with customers NOT found in customers table
SELECT 
    o.`Customer Name` AS unmatched_customer_name,
    COUNT(*)          AS orders_count
FROM restaurant_orders o
LEFT JOIN customers c
    ON o.`Customer Name` = c.name
WHERE c.customer_id IS NULL
GROUP BY o.`Customer Name`
ORDER BY orders_count DESC;

-- 5) Revenue by food item
SELECT
    o.`Food Item`                 AS food_item,
    SUM(o.Quantity)               AS total_qty,
    ROUND(SUM(o.Quantity*o.Price), 2) AS total_revenue
FROM restaurant_orders o
GROUP BY o.`Food Item`
ORDER BY total_revenue DESC;

-- 6) Revenue by category
SELECT
    o.Category                    AS category,
    SUM(o.Quantity)               AS total_qty,
    ROUND(SUM(o.Quantity*o.Price), 2) AS total_revenue
FROM restaurant_orders o
GROUP BY o.Category
ORDER BY total_revenue DESC;

-- 7) Top 5 customers by total spend (based on restaurant_orders)
SELECT
    o.`Customer Name`                    AS customer_name,
    ROUND(SUM(o.Quantity*o.Price), 2)    AS total_spend
FROM restaurant_orders o
GROUP BY o.`Customer Name`
ORDER BY total_spend DESC
LIMIT 5;

-- 8) Top 5 customers by total spend (only matched customers)
SELECT
    c.customer_id,
    o.`Customer Name`                    AS customer_name,
    c.country,
    ROUND(SUM(o.Quantity*o.Price), 2)    AS total_spend
FROM restaurant_orders o
INNER JOIN customers c
    ON o.`Customer Name` = c.name
GROUP BY c.customer_id, o.`Customer Name`, c.country
ORDER BY total_spend DESC
LIMIT 5;

-- 9) Payment method analysis
SELECT
    o.`Payment Method` AS payment_method,
    COUNT(*)           AS orders_count,
    ROUND(SUM(o.Quantity*o.Price), 2) AS revenue
FROM restaurant_orders o
GROUP BY o.`Payment Method`
ORDER BY revenue DESC;

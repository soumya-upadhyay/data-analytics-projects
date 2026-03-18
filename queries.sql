/* ============================================================
E-Commerce SQL Case Study
Author: Soumya Upadhyay

This project analyzes an e-commerce dataset to derive insights
related to customers, products, sales performance, and inventory
optimization.
============================================================ */


/* ============================================================
1. Analyze the Dataset
Purpose: Understand the structure of each table
============================================================ */

DESC customers;
DESC products;
DESC orders;
DESC orderdetails;



/* ============================================================
2. Market Segmentation Analysis
Purpose: Identify top 3 cities with highest number of customers
============================================================ */

SELECT
    location,
    COUNT(*) AS number_of_customers
FROM customers
GROUP BY location
ORDER BY number_of_customers DESC
LIMIT 3;



/* ============================================================
3. Engagement Depth Analysis
Purpose: Determine how many customers fall into each order
frequency category based on number of orders placed
============================================================ */

SELECT
    num_orders AS NumberOfOrders,
    COUNT(*) AS CustomerCount
FROM (
    SELECT
        customer_id,
        COUNT(*) AS num_orders
    FROM orders
    GROUP BY customer_id
) AS per_customer
GROUP BY num_orders
ORDER BY num_orders;



/* ============================================================
4. Purchase High-Value Products
Purpose: Identify products where average purchase quantity
per order is exactly 2 with high total revenue
============================================================ */

SELECT
    product_id,
    AVG(quantity) AS AvgQuantity,
    SUM(quantity * price_per_unit) AS TotalRevenue
FROM orderdetails
GROUP BY product_id
HAVING AVG(quantity) = 2
ORDER BY AvgQuantity DESC, TotalRevenue DESC;



/* ============================================================
5. Category-wise Customer Reach
Purpose: Determine unique customers purchasing each category
============================================================ */

SELECT
    p.category,
    COUNT(DISTINCT o.customer_id) AS unique_customers
FROM products p
JOIN orderdetails od
    ON p.product_id = od.product_id
JOIN orders o
    ON o.order_id = od.order_id
GROUP BY p.category
ORDER BY unique_customers DESC;



/* ============================================================
6. Sales Trend Analysis
Purpose: Calculate month-on-month percentage change in sales
============================================================ */

WITH total_sales AS (
    SELECT
        DATE_FORMAT(order_date, '%Y-%m') AS Month,
        ROUND(SUM(total_amount), 2) AS TotalSales
    FROM orders
    GROUP BY Month
)

SELECT
    Month,
    TotalSales,
    ROUND(
        (TotalSales - LAG(TotalSales) OVER (ORDER BY Month))
        / NULLIF(LAG(TotalSales) OVER (ORDER BY Month), 0) * 100,
    2) AS PercentChange
FROM total_sales
ORDER BY Month;



/* ============================================================
7. Average Order Value Fluctuation
Purpose: Analyze how average order value changes month-on-month
============================================================ */

WITH monthly_avg AS (
    SELECT
        DATE_FORMAT(order_date, '%Y-%m') AS Month,
        ROUND(AVG(total_amount), 2) AS AvgOrderValue
    FROM orders
    GROUP BY DATE_FORMAT(order_date, '%Y-%m')
)

SELECT
    Month,
    AvgOrderValue,
    ROUND(
        AvgOrderValue - LAG(AvgOrderValue) OVER (ORDER BY Month),
    2) AS ChangeInValue
FROM monthly_avg
ORDER BY ChangeInValue DESC;



/* ============================================================
8. Inventory Refresh Rate
Purpose: Identify products with highest sales frequency
============================================================ */

SELECT
    product_id,
    COUNT(*) AS SalesFrequency
FROM orderdetails
GROUP BY product_id
ORDER BY SalesFrequency DESC
LIMIT 5;



/* ============================================================
9. Low Engagement Products
Purpose: Identify products purchased by less than 40% of
the customer base
============================================================ */

SELECT
    p.product_id,
    p.name,
    COUNT(DISTINCT o.customer_id) AS UniqueCustomerCount
FROM products p
LEFT JOIN orderdetails od
    ON p.product_id = od.product_id
LEFT JOIN orders o
    ON o.order_id = od.order_id
GROUP BY p.product_id, p.name
HAVING COUNT(DISTINCT o.customer_id) <
    (
        0.4 * (SELECT COUNT(DISTINCT customer_id) FROM customers)
    )
ORDER BY UniqueCustomerCount ASC;



/* ============================================================
10. Customer Acquisition Trends
Purpose: Determine number of new customers acquired each month
based on first purchase date
============================================================ */

SELECT
    DATE_FORMAT(first_order_date, '%Y-%m') AS FirstPurchaseMonth,
    COUNT(*) AS TotalNewCustomers
FROM (
    SELECT
        customer_id,
        MIN(order_date) AS first_order_date
    FROM orders
    GROUP BY customer_id
) AS first_orders
GROUP BY DATE_FORMAT(first_order_date, '%Y-%m')
ORDER BY DATE_FORMAT(first_order_date, '%Y-%m');



/* ============================================================
11. Peak Sales Period Identification
Purpose: Identify top 3 months with highest sales volume
============================================================ */

SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS Month,
    SUM(total_amount) AS TotalSales
FROM orders
GROUP BY Month
ORDER BY TotalSales DESC
LIMIT 3;
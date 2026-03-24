/* ============================================================
Retail SQL Analysis Case Study
Author: Soumya Upadhyay

This project focuses on data cleaning, transformation,
customer segmentation, and sales analysis for a retail company.
============================================================ */


/* ============================================================
1. Remove Duplicates
============================================================ */

SELECT
    TransactionID,
    COUNT(*)
FROM sales_transaction
GROUP BY 1
HAVING COUNT(*) > 1;

CREATE TABLE sales_transactions AS
SELECT DISTINCT * FROM sales_transaction;

DROP TABLE sales_transaction;

ALTER TABLE sales_transactions
RENAME TO sales_transaction;

SELECT * FROM sales_transaction;



/* ============================================================
2. Fix Incorrect Prices
============================================================ */

SELECT
    st.TransactionID,
    st.Price AS TransactionPrice,
    pi.Price AS InventoryPrice
FROM sales_transaction st
JOIN product_inventory pi
    ON st.ProductID = pi.ProductID
WHERE st.Price <> pi.Price;

UPDATE sales_transaction st
JOIN product_inventory pi
    ON st.ProductID = pi.ProductID
SET st.Price = pi.Price
WHERE st.Price <> pi.Price;

SELECT * FROM sales_transaction;



/* ============================================================
3. Handle NULL Values
============================================================ */

SELECT COUNT(*)
FROM customer_profiles
WHERE Location IS NULL;

UPDATE customer_profiles
SET Location = 'Unknown'
WHERE Location IS NULL;

SELECT * FROM customer_profiles;



/* ============================================================
4. Clean Date Column
============================================================ */

CREATE TABLE sales_transaction_new AS
SELECT
    TransactionID,
    CustomerID,
    ProductID,
    QuantityPurchased,
    TransactionDate,
    Price,
    STR_TO_DATE(TransactionDate, '%Y-%m-%d') AS TransactionDate_updated
FROM sales_transaction;

DROP TABLE sales_transaction;

ALTER TABLE sales_transaction_new
RENAME TO sales_transaction;

SELECT * FROM sales_transaction;



/* ============================================================
5. Total Sales Summary
============================================================ */

SELECT
    ProductID,
    SUM(QuantityPurchased) AS TotalUnitsSold,
    SUM(Price * QuantityPurchased) AS TotalSales
FROM sales_transaction
GROUP BY 1
ORDER BY 3 DESC;



/* ============================================================
6. Customer Purchase Frequency
============================================================ */

SELECT
    CustomerID,
    COUNT(*) AS NumberOfTransactions
FROM sales_transaction
GROUP BY 1
ORDER BY 2 DESC;



/* ============================================================
7. Product Category Performance
============================================================ */

SELECT
    pi.Category,
    SUM(st.QuantityPurchased) AS TotalUnitsSold,
    SUM(st.Price * st.QuantityPurchased) AS TotalSales
FROM sales_transaction st
JOIN product_inventory pi
    ON st.ProductID = pi.ProductID
GROUP BY 1
ORDER BY 3 DESC;



/* ============================================================
8. High Sales Products
============================================================ */

SELECT
    ProductID,
    SUM(Price * QuantityPurchased) AS TotalRevenue
FROM sales_transaction
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10;



/* ============================================================
9. Low Sales Products
============================================================ */

SELECT
    ProductID,
    SUM(QuantityPurchased) AS TotalUnitsSold
FROM sales_transaction
GROUP BY 1
HAVING SUM(QuantityPurchased) > 0
ORDER BY 2 ASC
LIMIT 10;



/* ============================================================
10. Sales Trend Analysis
============================================================ */

SELECT
    DATE_FORMAT(TransactionDate, '%Y-%m-%d') AS DateTrans,
    COUNT(*) AS TransactionCount,
    SUM(QuantityPurchased) AS TotalUnitsSold,
    SUM(Price * QuantityPurchased) AS TotalSales
FROM sales_transaction
GROUP BY 1
ORDER BY 1 DESC;



/* ============================================================
11. Growth Rate of Sales
============================================================ */

WITH monthly_sales AS (
    SELECT
        MONTH(TransactionDate) AS month,
        ROUND(SUM(Price * QuantityPurchased), 2) AS total_sales
    FROM sales_transaction
    GROUP BY MONTH(TransactionDate)
),

with_prev AS (
    SELECT
        month,
        total_sales,
        LAG(total_sales) OVER (ORDER BY month) AS prev_total_sales
    FROM monthly_sales
)

SELECT
    month,
    total_sales,
    ROUND(prev_total_sales, 2) AS previous_month_sales,
    ROUND(
        (total_sales - prev_total_sales)
        / NULLIF(prev_total_sales, 0) * 100,
    2) AS mom_growth_percentage
FROM with_prev
ORDER BY month;



/* ============================================================
12. High Purchase Frequency Customers
============================================================ */

SELECT
    CustomerID,
    COUNT(*) AS NumberOfTransactions,
    SUM(Price * QuantityPurchased) AS TotalSpent
FROM sales_transaction
GROUP BY 1
HAVING COUNT(*) > 10
AND SUM(Price * QuantityPurchased) > 1000
ORDER BY 3 DESC;



/* ============================================================
13. Occasional Customers
============================================================ */

SELECT
    CustomerID,
    COUNT(*) AS NumberOfTransactions,
    SUM(Price * QuantityPurchased) AS TotalSpent
FROM sales_transaction
GROUP BY 1
HAVING COUNT(*) <= 2
ORDER BY 2 ASC, 3 DESC;



/* ============================================================
14. Repeat Purchases
============================================================ */

SELECT
    CustomerID,
    ProductID,
    COUNT(*) AS TimesPurchased
FROM sales_transaction
GROUP BY 1, 2
HAVING COUNT(*) > 1
ORDER BY 3 DESC;



/* ============================================================
15. Loyalty Indicators
============================================================ */

WITH cleaned AS (
    SELECT
        CustomerID,
        STR_TO_DATE(TransactionDate, '%Y-%m-%d') AS tx_date
    FROM sales_transaction
    WHERE TransactionDate IS NOT NULL
)

SELECT
    CustomerID,
    MIN(tx_date) AS FirstPurchase,
    MAX(tx_date) AS LastPurchase,
    DATEDIFF(MAX(tx_date), MIN(tx_date)) AS DaysBetweenPurchases
FROM cleaned
GROUP BY CustomerID
HAVING DaysBetweenPurchases > 0
ORDER BY DaysBetweenPurchases DESC;



/* ============================================================
16. Customer Segmentation
============================================================ */

WITH total_qty AS (
    SELECT
        c.CustomerID,
        SUM(s.QuantityPurchased) AS total_quantity
    FROM customer_profiles c
    LEFT JOIN sales_transaction s
        ON c.CustomerID = s.CustomerID
    GROUP BY c.CustomerID
),

segmented AS (
    SELECT
        CustomerID,
        total_quantity,
        CASE
            WHEN total_quantity BETWEEN 1 AND 10 THEN 'Low'
            WHEN total_quantity BETWEEN 11 AND 30 THEN 'Medium'
            WHEN total_quantity > 30 THEN 'High'
            ELSE 'None'
        END AS CustomerSegment
    FROM total_qty
)

SELECT
    CustomerSegment,
    COUNT(*) AS CustomerCount
FROM segmented
GROUP BY CustomerSegment
ORDER BY CustomerSegment;
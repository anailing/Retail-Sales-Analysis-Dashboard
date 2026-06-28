SELECT TOP 10 *
FROM retail_sales_dataset;

/*
=========================================
Retail Sales Analysis SQL Queries
Author: Alexis Nailing
Project: Retail Sales Analysis Dashboard
=========================================
*/

--------------------------------------------------
-- 1. Revenue by Product Category
--------------------------------------------------

SELECT
    product_category,
    SUM(total_amount) AS total_revenue
FROM retail_sales_dataset
GROUP BY product_category
ORDER BY total_revenue DESC;

--------------------------------------------------
-- 2. Monthly Sales Trend
--------------------------------------------------

SELECT
    YEAR([Date]) AS sales_year,
    MONTH([Date]) AS sales_month,
    SUM(total_amount) AS total_revenue
FROM retail_sales_dataset
GROUP BY
    YEAR([Date]),
    MONTH([Date])
ORDER BY
    sales_year,
    sales_month;

    --------------------------------------------------
-- 3. Revenue by Gender
--------------------------------------------------

SELECT
    gender,
    SUM(total_amount) AS total_revenue
FROM retail_sales_dataset
GROUP BY gender
ORDER BY total_revenue DESC;

--------------------------------------------------
-- 4. Revenue by Age Group
--------------------------------------------------

SELECT
    CASE
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        WHEN age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56+'
    END AS age_group,
    SUM(total_amount) AS total_revenue
FROM retail_sales_dataset
GROUP BY
    CASE
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 45 THEN '36-45'
        WHEN age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56+'
    END
ORDER BY total_revenue DESC;

--------------------------------------------------
-- 5. Average Order Value
--------------------------------------------------

SELECT
    ROUND(AVG(total_amount), 2) AS average_order_value
FROM retail_sales_dataset;

--------------------------------------------------
-- 6. Quantity Sold by Product Category
--------------------------------------------------

SELECT
    product_category,
    SUM(quantity) AS total_units_sold
FROM retail_sales_dataset
GROUP BY product_category
ORDER BY total_units_sold DESC;

--------------------------------------------------
-- 7. Overall Sales KPIs
--------------------------------------------------

SELECT
    SUM(total_amount) AS total_revenue,
    COUNT(transaction_id) AS total_transactions,
    SUM(quantity) AS total_units_sold,
    ROUND(AVG(total_amount), 2) AS average_order_value
FROM retail_sales_dataset;
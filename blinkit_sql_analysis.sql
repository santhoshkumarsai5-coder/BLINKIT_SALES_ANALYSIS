/* =========================================================
   BLINKIT GROCERY DATA ANALYSIS PROJECT
   SQL Analysis Queries
   ========================================================= */


/* =========================================================
   1. TABLE CREATION
   ========================================================= */

CREATE TABLE blinkit_data (
    item_id INT,
    item_name TEXT,
    category TEXT,
    price NUMERIC,
    quantity INT,
    city TEXT,
    order_date DATE,
    rating NUMERIC
);



/* =========================================================
   2. TOTAL ORDERS
   ========================================================= */

SELECT COUNT(*) AS total_orders
FROM blinkit_data;



/* =========================================================
   3. TOTAL REVENUE
   ========================================================= */

SELECT
    SUM(price * quantity) AS total_revenue
FROM blinkit_data;



/* =========================================================
   4. AVERAGE ORDER VALUE
   ========================================================= */

SELECT
    AVG(price * quantity) AS avg_order_value
FROM blinkit_data;



/* =========================================================
   5. REVENUE BY CATEGORY
   ========================================================= */

SELECT
    category,
    SUM(price * quantity) AS revenue
FROM blinkit_data
GROUP BY category
ORDER BY revenue DESC;



/* =========================================================
   6. ORDERS BY CITY
   ========================================================= */

SELECT
    city,
    COUNT(*) AS total_orders
FROM blinkit_data
GROUP BY city
ORDER BY total_orders DESC;



/* =========================================================
   7. MONTHLY SALES TREND
   ========================================================= */

SELECT
    DATE_TRUNC('month', order_date) AS month,
    SUM(price * quantity) AS revenue
FROM blinkit_data
GROUP BY 1
ORDER BY 1;



/* =========================================================
   8. TOP SELLING ITEMS
   ========================================================= */

SELECT
    item_name,
    SUM(quantity) AS total_sold
FROM blinkit_data
GROUP BY item_name
ORDER BY total_sold DESC;



/* =========================================================
   9. AVERAGE RATING
   ========================================================= */

SELECT
    AVG(rating) AS avg_rating
FROM blinkit_data;



/* =========================================================
   10. MTD SALES
   ========================================================= */

SELECT
    SUM(price * quantity) AS mtd_sales
FROM blinkit_data
WHERE order_date >= DATE_TRUNC('month', CURRENT_DATE);



/* =========================================================
   11. PMTD SALES
   ========================================================= */

SELECT
    SUM(price * quantity) AS pmtd_sales
FROM blinkit_data
WHERE order_date >=
DATE_TRUNC('month', CURRENT_DATE - INTERVAL '1 month')
AND order_date <
DATE_TRUNC('month', CURRENT_DATE);



/* =========================================================
   12. YTD SALES
   ========================================================= */

SELECT
    SUM(price * quantity) AS ytd_sales
FROM blinkit_data
WHERE order_date >=
DATE_TRUNC('year', CURRENT_DATE);



/* =========================================================
   13. MOM GROWTH
   ========================================================= */

WITH mtd AS (

    SELECT SUM(price * quantity) AS sales
    FROM blinkit_data
    WHERE order_date >=
    DATE_TRUNC('month', CURRENT_DATE)

),

pmtd AS (

    SELECT SUM(price * quantity) AS sales
    FROM blinkit_data
    WHERE order_date >=
    DATE_TRUNC('month', CURRENT_DATE - INTERVAL '1 month')
    AND order_date <
    DATE_TRUNC('month', CURRENT_DATE)

)

SELECT
    mtd.sales,
    pmtd.sales,
    ROUND(
        (mtd.sales - pmtd.sales) * 100 / pmtd.sales,
        2
    ) AS mom_percent

FROM mtd, pmtd;


USE retail_analytics;

SELECT
    COUNT(*) AS total_orders,
    ROUND(SUM(Net_Revenue_USD), 2) AS total_revenue,
    ROUND(SUM(Profit_USD), 2) AS total_profit
FROM retail_sales;


-- Discount and Profitability Analysis

WITH discount_groups AS (
    SELECT
        Order_ID,
        Net_Revenue_USD,
        Profit_USD,
        Discount_Pct,
        CASE
            WHEN Discount_Pct = 0 THEN '0%'
            WHEN Discount_Pct <= 5 THEN '0-5%'
            WHEN Discount_Pct <= 10 THEN '5-10%'
            WHEN Discount_Pct <= 15 THEN '10-15%'
            WHEN Discount_Pct <= 20 THEN '15-20%'
            ELSE 'Above 20%'
        END AS discount_range,
        CASE
            WHEN Discount_Pct = 0 THEN 1
            WHEN Discount_Pct <= 5 THEN 2
            WHEN Discount_Pct <= 10 THEN 3
            WHEN Discount_Pct <= 15 THEN 4
            WHEN Discount_Pct <= 20 THEN 5
            ELSE 6
        END AS sort_order
    FROM retail_sales
)

SELECT
    discount_range,
    COUNT(*) AS total_orders,
    ROUND(AVG(Discount_Pct), 2) AS avg_discount_pct,
    ROUND(SUM(Net_Revenue_USD), 2) AS revenue,
    ROUND(SUM(Profit_USD), 2) AS profit,
    ROUND(
        100 * SUM(Profit_USD) /
        NULLIF(SUM(Net_Revenue_USD), 0),
        2
    ) AS profit_margin_pct
FROM discount_groups
GROUP BY discount_range, sort_order
ORDER BY sort_order;


-- Profitability by Promotion Type

SELECT
    Promotion_Type,
    COUNT(*) AS total_orders,
    ROUND(AVG(Discount_Pct), 2) AS avg_discount_pct,
    ROUND(SUM(Net_Revenue_USD), 2) AS total_revenue,
    ROUND(SUM(Profit_USD), 2) AS total_profit,
    ROUND(
        100 * SUM(Profit_USD) /
        NULLIF(SUM(Net_Revenue_USD), 0),
        2
    ) AS profit_margin_pct
FROM retail_sales
GROUP BY Promotion_Type
ORDER BY total_profit DESC;


-- Loss-making Transactions by Product Category

SELECT
    Product_Category,
    COUNT(*) AS total_orders,
    SUM(
        CASE WHEN Profit_USD < 0 THEN 1 ELSE 0 END
    ) AS loss_making_orders,
    ROUND(
        SUM(
            CASE WHEN Profit_USD < 0
                 THEN Profit_USD ELSE 0 END
        ), 2
    ) AS total_loss_usd,
    ROUND(AVG(Discount_Pct), 2) AS avg_discount_pct
FROM retail_sales
GROUP BY Product_Category
ORDER BY loss_making_orders DESC;

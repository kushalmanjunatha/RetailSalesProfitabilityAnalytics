
USE retail_analytics;

-- Customer Type Performance

SELECT
    Customer_Type,
    COUNT(*) AS total_orders,
    SUM(Units_Sold) AS units_sold,
    ROUND(SUM(Net_Revenue_USD), 2) AS revenue,
    ROUND(SUM(Profit_USD), 2) AS profit,
    ROUND(
        100 * SUM(Profit_USD) /
        NULLIF(SUM(Net_Revenue_USD), 0),
        2
    ) AS profit_margin_pct
FROM retail_sales
GROUP BY Customer_Type
ORDER BY revenue DESC;


-- Sales Channel Performance

SELECT
    Sales_Channel,
    COUNT(*) AS total_orders,
    ROUND(SUM(Net_Revenue_USD), 2) AS revenue,
    ROUND(SUM(Profit_USD), 2) AS profit,
    ROUND(AVG(Discount_Pct), 2) AS avg_discount_pct,
    ROUND(
        100 * SUM(Profit_USD) /
        NULLIF(SUM(Net_Revenue_USD), 0),
        2
    ) AS profit_margin_pct
FROM retail_sales
GROUP BY Sales_Channel
ORDER BY revenue DESC;


-- Australian Retail Performance by City

SELECT
    City,
    COUNT(*) AS total_orders,
    ROUND(SUM(Net_Revenue_USD), 2) AS revenue,
    ROUND(SUM(Profit_USD), 2) AS profit,
    ROUND(
        100 * SUM(Profit_USD) /
        NULLIF(SUM(Net_Revenue_USD), 0),
        2
    ) AS profit_margin_pct
FROM retail_sales
WHERE Country = 'Australia'
GROUP BY City
ORDER BY revenue DESC;


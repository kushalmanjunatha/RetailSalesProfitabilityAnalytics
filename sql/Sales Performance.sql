
USE retail_analytics;

-- Overall Retail Sales KPIs

SELECT
    COUNT(*) AS total_orders,
    SUM(Units_Sold) AS total_units_sold,
    ROUND(SUM(Net_Revenue_USD), 2) AS total_revenue,
    ROUND(SUM(Profit_USD), 2) AS total_profit,
    ROUND(
        100 * SUM(Profit_USD) /
        NULLIF(SUM(Net_Revenue_USD), 0),
        2
    ) AS profit_margin_pct
FROM retail_sales;


-- Sales and Profitability by Product Category

SELECT
    Product_Category,
    COUNT(*) AS total_orders,
    SUM(Units_Sold) AS units_sold,
    ROUND(SUM(Net_Revenue_USD), 2) AS total_revenue,
    ROUND(SUM(Profit_USD), 2) AS total_profit,
    ROUND(
        100 * SUM(Profit_USD) /
        NULLIF(SUM(Net_Revenue_USD), 0),
        2
    ) AS profit_margin_pct
FROM retail_sales
GROUP BY Product_Category
ORDER BY total_revenue DESC;


-- Yearly Sales and Profit Trends

SELECT
    Year,
    COUNT(*) AS total_orders,
    ROUND(SUM(Net_Revenue_USD), 2) AS total_revenue,
    ROUND(SUM(Profit_USD), 2) AS total_profit,
    ROUND(
        100 * SUM(Profit_USD) /
        NULLIF(SUM(Net_Revenue_USD), 0),
        2
    ) AS profit_margin_pct
FROM retail_sales
GROUP BY Year
ORDER BY Year;

USE retail_analytics;

-- Top 3 most profitable products in each category

WITH product_summary AS (
    SELECT
        Product_Category,
        Product_Name,
        COUNT(*) AS total_orders,
        ROUND(SUM(Net_Revenue_USD), 2) AS revenue,
        ROUND(SUM(Profit_USD), 2) AS profit
    FROM retail_sales
    GROUP BY Product_Category, Product_Name
),

category_summary AS (
    SELECT
        Product_Category,
        ROUND(SUM(Profit_USD), 2) AS category_profit
    FROM retail_sales
    GROUP BY Product_Category
),

ranked_products AS (
    SELECT
        p.Product_Category,
        p.Product_Name,
        p.total_orders,
        p.revenue,
        p.profit,
        c.category_profit,

        DENSE_RANK() OVER (
            PARTITION BY p.Product_Category
            ORDER BY p.profit DESC
        ) AS profit_rank

    FROM product_summary p
    JOIN category_summary c
        ON p.Product_Category = c.Product_Category
)

SELECT
    Product_Category,
    Product_Name,
    total_orders,
    revenue,
    profit,
    category_profit,
    profit_rank
FROM ranked_products
WHERE profit_rank <= 3
ORDER BY Product_Category, profit_rank;

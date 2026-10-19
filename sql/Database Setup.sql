CREATE DATABASE IF NOT EXISTS retail_analytics;
USE retail_analytics;

CREATE TABLE IF NOT EXISTS retail_sales (
    Order_ID VARCHAR(30) PRIMARY KEY,
    Order_Date DATE,
    Year INT,
    Quarter VARCHAR(5),
    Month INT,
    Month_Name VARCHAR(20),
    Region VARCHAR(30),
    Country VARCHAR(50),
    City VARCHAR(50),
    Sales_Person VARCHAR(50),
    Customer_Type VARCHAR(20),
    Sales_Channel VARCHAR(30),
    Promotion_Type VARCHAR(50),
    Product_Category VARCHAR(50),
    Brand VARCHAR(50),
    Product_Name VARCHAR(100),
    SKU VARCHAR(30),
    Units_Sold INT,
    Unit_Price_USD DECIMAL(12,2),
    Discount_Pct DECIMAL(6,2),
    Gross_Sales_USD DECIMAL(14,2),
    Marketing_Spend_USD DECIMAL(14,2),
    COGS_USD DECIMAL(14,2),
    Logistics_Cost_USD DECIMAL(14,2),
    Net_Revenue_USD DECIMAL(14,2),
    Profit_USD DECIMAL(14,2),
    Profit_Margin_Pct DECIMAL(7,2)
);

-- Run these checks after importing the CSV data through MySQL Workbench.
SELECT COUNT(*) AS total_orders FROM retail_sales;
SELECT * FROM retail_sales LIMIT 10;

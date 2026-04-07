-- CREATE DATABASE
CREATE DATABASE ecommerce_db;

USE ecommerce_db;

-- CREATE TABLE
CREATE TABLE orders (
	Order_Number INT,
    State_Code VARCHAR(5),
    Customer_Name VARCHAR(100),
    Order_Date DATE,
    Status VARCHAR(20),
    Product VARCHAR(100),
    Category VARCHAR(50),
    Brand VARCHAR(50),
    Cost INT,
    Sales INT,
    Quantity INT,
    Total_Cost INT,
    Total_Sales INT,
    Supervisor VARCHAR(100)
);

SELECT COUNT(*) FROM orders;

-- Total Revenue, Cost, Profit by Year
SELECT 
	YEAR(Order_Date) AS Order_Year,
    SUM(Total_Sales) AS Total_Revenue,
    SUM(Total_Cost) AS Total_Cost,
    SUM(Total_Sales - Total_Cost) AS Total_Profit
FROM orders
GROUP BY YEAR(Order_Date)
ORDER BY Order_Year;

-- Top Categories by Profit
SELECT
	Category,
    SUM(Total_Sales) AS Total_Revenue,
    SUM(Total_Cost) AS Total_Cost,
    SUM(Total_Sales - Total_Cost) AS Total_Profit,
    ROUND(SUM(Total_Sales - Total_Cost) * 100.0 / SUM(Total_Sales), 2) AS Profit_Margin
FROM orders
GROUP BY Category
ORDER BY Total_Profit DESC;

-- Top 10 Sales by Revenue
SELECT
	State_Code,
    COUNT(Order_Number) AS Total_Orders,
    SUM(Total_Sales) AS Total_Revenue,
    SUM(Total_Sales - Total_Cost) AS Total_Profit
FROM orders
GROUP BY State_Code
ORDER BY Total_Revenue DESC
LIMIT 10;

-- Fulfillment Rate by Supervisor
SELECT
	Supervisor,
    COUNT(Order_Number) AS Total_Orders,
    SUM(CASE WHEN Status = 'Delivered' THEN 1 ELSE 0 END) AS Delivered_Orders,
    ROUND(SUM(CASE WHEN Status = 'Delivered' THEN 1 ELSE 0 END) * 100.0 / COUNT(Order_Number), 2) AS Fulfillment_Rate_Pct
FROM orders
GROUP BY Supervisor
ORDER BY Fulfillment_Rate_Pct DESC;
    
-- Brand Performance by Profit Margin
SELECT
	Brand, 
    SUM(Total_Sales) AS Total_Revenue,
    SUM(Total_Sales - Total_Cost) AS Total_Profit,
    ROUND(SUM(Total_Sales - Total_Cost) * 100.0 / SUM(Total_Sales), 2) AS Profit_Margin_Pct
FROM orders
GROUP BY Brand
ORDER BY Profit_Margin_Pct DESC;

-- Monthly Sales Trend
SELECT
	YEAR(Order_Date) AS Order_Year,
    MONTH(Order_Date) AS Order_Month,
    SUM(Total_Sales) AS Monthly_Revenue,
    SUM(Total_Sales - Total_Cost) AS Monthly_Profit
FROM orders
GROUP BY Year(Order_Date), Month(Order_Date)
ORDER BY Order_Year, Order_Month;

-- Order Status Breakdown
SELECT
	Status,
    COUNT(Order_Number) AS Total_Orders,
    ROUND(COUNT(Order_Number) * 100.0 / (SELECT COUNT(*) FROM orders), 2) AS Status_Pct
FROM orders
GROUP BY Status
ORDER BY Total_Orders DESC;

-- This exports WITH headers
SELECT 'Order_Number','State_Code','Customer_Name','Order_Date','Status',
       'Product','Category','Brand','Cost','Sales','Quantity',
       'Total_Cost','Total_Sales','Supervisor'
UNION ALL
SELECT * FROM orders
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/cleaned_ecommerce.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
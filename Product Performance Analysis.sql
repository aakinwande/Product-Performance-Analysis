SELECT * FROM product_analysis.sales;

-- 1. Sales Trends Over Time
-- Monthly Sales Trend
-- This query calculates the total revenue for each month across different years
SELECT Month, Year, SUM(Revenue) as Total_Revenue FROM product_analysis.sales
GROUP BY Month, Year
ORDER BY Year, Month;

-- Yearly Sales Trend
-- This query calculates the total revenue for each year
SELECT  Year, SUM(Revenue) as Total_Revenue FROM product_analysis.sales
GROUP BY Year
ORDER BY Year;


-- 2. Customer Demographics Analysis
-- Age Group Preferences
-- This query groups customers into age brackets (e.g., 20-29, 30-39) and calculates the total quantity of products purchased by each age group
SELECT 
    FLOOR(Customer_Age / 10) * 10 AS Age_Group, 
    Product_Category, 
    SUM(Quantity) AS Total_Quantity
FROM 
    product_analysis.sales
GROUP BY Age_Group, product_category
ORDER BY Age_Group, Total_Quantity DESC;

-- Gender-Based Purchasing Patterns
-- This query calculates the total quantity of products purchased by male and female customers for each product category. 
SELECT 
    Customer_Gender, 
    Product_Category, 
    SUM(Quantity) AS Total_Quantity
FROM 
    product_analysis.sales
GROUP BY Customer_Gender, Product_Category
ORDER BY Customer_Gender, Total_Quantity DESC;
    
    
-- 3. Geographical Analysis
-- Country Performance
-- This query calculates the total revenue generated from each country.
SELECT Country, SUM(Revenue) AS Total_Revenue FROM product_analysis.sales
GROUP BY Country
ORDER BY Total_Revenue DESC;


-- State Performance
-- This query calculates the total revenue generated from each state within different countries.
SELECT State, Country, SUM(Revenue) AS Total_Revenue FROM product_analysis.sales
GROUP BY Country, State
ORDER BY Total_Revenue DESC;


-- 4. Product Category and Sub-Category Performance
-- Top Performing Categories
-- This query calculates the total revenue for each product category
SELECT Product_Category, SUM(Revenue) AS Total_Revenue FROM product_analysis.sales
GROUP BY Product_Category
ORDER BY Total_Revenue DESC;

-- Top Performing Sub-Categories
-- This query calculates the total revenue for each sub-category within product categories
SELECT Product_Category, Sub_Category, SUM(Revenue) AS Total_Revenue FROM product_analysis.sales
GROUP BY Product_Category, Sub_Category
ORDER BY Total_Revenue DESC;


-- 5. Revenue and Profit Analysis
-- Revenue Contribution
-- This query calculates the total revenue contribution of each product category,
SELECT Product_Category, SUM(Revenue) AS Total_Revenue FROM product_analysis.sales
GROUP BY Product_Category
ORDER BY Total_Revenue DESC;

-- Profit Margins
-- This query calculates the total profit for each product category by subtracting unit cost from unit price and multiplying by the quantity sold
SELECT 
    Product_Category, 
    ROUND(SUM((Unit_Price - Unit_Cost) * Quantity), 2) AS Total_Profit
FROM 
    product_analysis.sales
GROUP BY Product_Category
ORDER BY Total_Profit DESC;


-- 6. Pricing Strategy Effectiveness
-- Price Sensitivity
-- This query calculates the average price and total quantity sold for each product category
SELECT 
    Product_Category, 
    ROUND(AVG(Unit_Price), 2) AS Avg_Price, 
    SUM(Quantity) AS Total_Quantity
FROM 
    product_analysis.sales
GROUP BY Product_Category
ORDER BY Avg_Price DESC;

-- Promotional Impact
-- This query calculates the total revenue for products sold at a price less than 10% above their cost
SELECT Product_Category, SUM(Revenue) AS Total_Revenue FROM product_analysis.sales
WHERE Unit_Price < Unit_Cost * 1.1
GROUP BY Product_Category
ORDER BY Total_Revenue DESC;


-- 7. Average Order Value (AOV)
-- Average Order Value by Month
-- This query calculates the average revenue per transaction (AOV) for each month. 
SELECT Year, Month, AVG(Revenue) AS average_order_value FROM product_analysis.sales
GROUP BY Year, Month
ORDER BY Year, Month;


-- 8. Sales Performance by Channel
-- Sales by Country and State
-- This query calculates the total revenue generated from each state within different countries
SELECT Country, State, SUM(Revenue) AS Total_Revenue FROM product_analysis.sales
GROUP BY Country, State
ORDER BY Total_Revenue DESC;


-- 9. Inventory Management
-- Average Inventory Level by Product Category
-- This query calculates the average quantity of products sold for each product category
SELECT Product_Category, AVG(Quantity) AS Average_Inventory_level FROM product_analysis.sales
GROUP BY Product_Category
ORDER BY Average_Inventory_level DESC;


-- 10.  Sales Performance by Season
-- Seasonal Sales Analysis
-- This query calculates the total revenue for each season
SELECT 
    CASE 
		WHEN Month IN ('December', 'January', 'February') THEN 'Winter'
        WHEN Month IN ('March', 'April', 'May') THEN 'Spring'
        WHEN Month IN ('June', 'July', 'August') THEN 'Summer'
        WHEN Month IN ('September', 'October', 'November') THEN 'Fall'
    END AS Season, 
    SUM(Revenue) AS Total_Revenue
FROM 
    product_analysis.sales
GROUP BY Season
ORDER BY Total_Revenue DESC;


-- 11. Sales Performance by Sub-Category
-- Revenue and Quantity by Sub-Category
-- This query calculates the total revenue and quantity sold for each sub-category within product categories
SELECT 
    Product_Category, 
    Sub_Category, 
    SUM(Revenue) AS total_revenue, 
    SUM(Quantity) AS total_quantity
FROM 
    product_analysis.sales
GROUP BY Product_Category, Sub_Category
ORDER BY total_revenue DESC;
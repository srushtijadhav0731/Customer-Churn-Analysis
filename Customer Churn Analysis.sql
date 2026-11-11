# Customer Churn Analysis – SQL Project

-- 1. Total Customers
SELECT COUNT(*) AS Total_Customers
FROM customer_churn;

-- 2. Total Churn Customers
SELECT COUNT(*) AS Total_Churn_Customers
FROM customer_churn
WHERE Churn = 'Yes';

-- 3. Churn Rate
SELECT
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 /
        COUNT(*), 2
    ) AS Churn_Rate
FROM customer_churn;

-- 4. Average Monthly Charges
SELECT AVG(Monthly_Charges) AS Average_Monthly_Charges
FROM customer_churn;

-- 5. Average Tenure
SELECT AVG(Tenure_Months) AS Average_Tenure
FROM customer_churn;

-- 6. Churn by Contract Type
SELECT Contract_Type, COUNT(*) AS Customers
FROM customer_churn
GROUP BY Contract_Type;

-- 7. Customers by Internet Service
SELECT Internet_Service, COUNT(*) AS Customers
FROM customer_churn
GROUP BY Internet_Service;

-- 8. Churn by State
SELECT State, COUNT(*) AS Churned_Customers
FROM customer_churn
WHERE Churn = 'Yes'
GROUP BY State
ORDER BY Churned_Customers DESC;

-- 9. Customers by Payment Method
SELECT Payment_Method, COUNT(*) AS Customers
FROM customer_churn
GROUP BY Payment_Method;

-- 10. Customers by Subscription Type
SELECT Subscription_Type, COUNT(*) AS Customers
FROM customer_churn
GROUP BY Subscription_Type;

-- 11. Highest Revenue States
SELECT State, SUM(Total_Charges) AS Total_Revenue
FROM customer_churn
GROUP BY State
ORDER BY Total_Revenue DESC;

-- 12. Average Charges by Contract
SELECT Contract_Type, AVG(Monthly_Charges) AS Average_Charges
FROM customer_churn
GROUP BY Contract_Type;

-- 13. Senior Citizen Churn
SELECT Senior_Citizen, COUNT(*) AS Churned_Customers
FROM customer_churn
WHERE Churn = 'Yes'
GROUP BY Senior_Citizen;

-- 14. Top 10 High Value Customers
SELECT Customer_Name, Customer_Value
FROM customer_churn
ORDER BY Customer_Value DESC
LIMIT 10;

-- 15. Customers Without Tech Support
SELECT *
FROM customer_churn
WHERE Tech_Support = 'No';
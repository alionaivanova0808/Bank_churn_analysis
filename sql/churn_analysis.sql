--Общий процент оттока
SELECT AVG(Exited) * 100 AS ChurnRatePercent
FROM churn;

--Отток по странам
SELECT 
    Geography,
    COUNT(*) AS TotalCustomers,
    SUM(Exited) AS Churned,
    AVG(Exited) * 100 AS ChurnRatePercent
FROM churn
GROUP BY Geography
ORDER BY ChurnRatePercent DESC;

--Отток по возрастным группам
SELECT 
    CASE 
        WHEN Age < 30 THEN '18-29'
        WHEN Age < 40 THEN '30-39'
        WHEN Age < 50 THEN '40-49'
        WHEN Age < 60 THEN '50-59'
        ELSE '60+'
    END AS AgeGroup,
    COUNT(*) AS Customers,
    SUM(Exited) AS Churned,
    AVG(Exited) * 100 AS ChurnRatePercent
FROM churn
GROUP BY AgeGroup
ORDER BY MIN(Age);  

-- Отток по количеству продуктов
SELECT 
    NumOfProducts,
    COUNT(*) AS Customers,
    SUM(Exited) AS Churned,
    AVG(Exited) * 100 AS ChurnRatePercent
FROM churn
GROUP BY NumOfProducts
ORDER BY NumOfProducts;

--Отток по активности
SELECT 
    IsActiveMember,
    COUNT(*) AS Customers,
    SUM(Exited) AS Churned,
    AVG(Exited) * 100 AS ChurnRatePercent
FROM churn
GROUP BY IsActiveMember;

--Средний баланс ушедших vs оставшихся
SELECT 
    Exited,
    AVG(Balance) AS AvgBalance
FROM churn
GROUP BY Exited;

--Отток по стране и активности
SELECT 
    Geography,
    IsActiveMember,
    COUNT(*) AS Customers,
    AVG(Exited) * 100 AS ChurnRatePercent
FROM churn
GROUP BY Geography, IsActiveMember
ORDER BY Geography, IsActiveMember;

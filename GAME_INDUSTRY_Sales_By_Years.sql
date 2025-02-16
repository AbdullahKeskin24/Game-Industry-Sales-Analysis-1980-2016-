WITH RankedPublishers AS (
    SELECT 
        Year, 
        Publisher, 
        COUNT(*) AS Game_Count,
        sum([EU_Sales]+[JP_Sales]+[Global_Sales]+[NA_Sales]+[Other_Sales])as Total_Sales,
        RANK() OVER (PARTITION BY Year ORDER BY COUNT(*) DESC) AS Rank
    FROM vgsales
    GROUP BY Year, Publisher
)
SELECT Year, Publisher, Game_Count, Total_Sales
FROM RankedPublishers
WHERE Rank <= 15
ORDER BY Year, Total_Sales DESC;

--TR
--Yýllara göre top 15 þirketin toplam satýþý 

--EN
--Total sales of top 15 companies by year


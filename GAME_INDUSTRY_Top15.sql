WITH RankedPublishers AS (
    SELECT 
        [Year], 
        Publisher, 
        COUNT(*) AS Game_Count,
        sum([EU_Sales]+[JP_Sales]+[Global_Sales]+[NA_Sales]+[Other_Sales])as Total_Sales,
        RANK() OVER (PARTITION BY [Year] ORDER BY COUNT(*) DESC) AS Rank
    FROM vgsales
    WHERE Publisher IN (
        'Nintendo', 'Electronic Arts', 'Activision', 'Sony Computer Entertainment', 
        'Ubisoft', 'Take-Two Interactive', 'THQ', 'Konami Digital Entertainment', 
        'Sega', 'Namco Bandai Games', 'Microsoft Game Studios', 'Capcom', 
        'Atari', 'Warner Bros. Interactive Entertainment', 'Square Enix'
    )
    GROUP BY [Year], Publisher
)
SELECT [Year], Publisher, Game_Count, Total_Sales
FROM RankedPublishers
ORDER BY [Year], Total_Sales DESC;

--TR
--Y�llara g�re belirlenen ilk 15 �irketin yay�nlad��� oyun sat��� say�s� ve toplam sat���.

--EN
--Number of games sold and total sales of the top 15 companies, determined by year.
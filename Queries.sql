WITH hotels AS (
SELECT * FROM dbo.[2018]
UNION
SELECT * FROM dbo.[2019]
UNION
SELECT * FROM dbo.[2020]
)

-- Q1: Is our hotel revenue growing yearly?

SELECT 
arrival_date_year, 
hotel,
ROUND(SUM((CAST(stays_in_week_nights AS float) + CAST(stays_in_weekend_nights AS float)) * CAST(adr AS float)), 2) AS revenue 
FROM hotels
GROUP BY arrival_date_year, hotel;

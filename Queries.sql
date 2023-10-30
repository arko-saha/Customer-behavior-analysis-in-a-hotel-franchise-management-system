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


-- Combining the hotels table with the market_segment table by matching the market_segment column
-- Then combining the hotels table with the meal_cost table by matching the meal column

SELECT * FROM hotels
LEFT JOIN dbo.market_segment
ON hotels.market_segment = market_segment.market_segment
LEFT JOIN dbo.meal_cost
ON meal_cost.meal = hotels.meal;


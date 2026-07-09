-- Total Records
SELECT COUNT(*) AS Total_Records
From air_pollution;

-- Total cities
SELECT COUNT(DISTINCT city) AS Total_cities
From air_pollution;

-- List of cities
SELECT DISTINCT city
FROM air_pollution;

-- Average AQI
SELECT ROUND(AVG(aqi),2) AS Average_AQI
From air_pollution;

-- Highest and lowest AQI
SELECT MAX(aqi) AS Highest_AQI,
MIN(aqi) As Lowest_AQI
From air_pollution;

-- Average AQI by city
Select city , ROUND(AVG(aqi) ,2) as Average_AQI_city
From air_pollution
GROUP by city
ORDER by Average_AQI_city DESC;

-- Average AQI by season
SELECT season , ROUND(AVG(aqi),2) AS Average_AQI_season
From air_pollution
GROUP BY season
Order by Average_AQI_season DESC;

-- Average AQI by month 
SELECT month , ROUND(AVG(aqi),2) AS Average_AQI_month
FROM air_pollution
GROUP by month
ORDER by month;

-- AQI category Count 
SELECT aqi_category , Count(*) AS Total_records
From air_pollution
GROUP by aqi_category
order by Total_records Desc;

-- Average PM2.5 by city 
SELECT city, ROUND(AVG(pm25),2) AS Average_PM25
FROM air_pollution
Group by city 
Order by Average_PM25 Desc;

-- Average PM10 by city
SELECT city, ROUND(AVG(pm10),2) AS Average_PM10
FROM air_pollution
Group by city 
Order by Average_PM10 Desc;

-- Average NO2 by city
SELECT city, ROUND(AVG(no2),2) AS Average_NO2
FROM air_pollution
Group by city 
Order by Average_NO2 Desc;

-- Average SO2 by city
SELECT city, ROUND(AVG(so2),2) AS Average_SO2
FROM air_pollution
Group by city 
Order by Average_SO2 Desc;

-- Average CO by city 
SELECT city, ROUND(AVG(co),2) AS Average_CO
FROM air_pollution
Group by city 
Order by Average_CO Desc;

-- Average O3 by city
SELECT city, ROUND(AVG(o3),2) AS Average_O3
FROM air_pollution
Group by city 
Order by Average_O3 Desc;

-- Which are the top 10 most polluted observations?
SELECT city, date, aqi
FROM air_pollution
ORDER BY aqi DESC
LIMIT 10;

-- Show all records where AQI is above 400.
SELECT city , date , aqi
From air_pollution
WHERE AQI > 400
ORDER by aqi DESC;

-- Cities having an average AQI greater than 260
SELECT city , ROUND(AVG(aqi) ,2) AS Average_AQI
From air_pollution
Group by city 
HAVING Avg(aqi) > 260;

-- Which cities have an average AQI higher than the overall average AQI?
SELECT city,
       ROUND(AVG(aqi),2) AS Average_AQI
FROM air_pollution
GROUP BY city
HAVING AVG(aqi) >
(
    SELECT AVG(aqi)
    FROM air_pollution
);

-- Classify each AQI reading into a pollution level.
SELECT city,
       aqi,
       CASE
           WHEN aqi <= 50 THEN 'Good'
           WHEN aqi <= 100 THEN 'Satisfactory'
           WHEN aqi <= 200 THEN 'Moderate'
           WHEN aqi <= 300 THEN 'Poor'
           WHEN aqi <= 400 THEN 'Very Poor'
           ELSE 'Severe'
       END AS Pollution_Level
FROM air_pollution;

-- Rank Cities by Average AQI
SELECT
    city,
    ROUND(AVG(aqi), 2) AS Average_AQI,
    RANK() OVER (ORDER BY AVG(aqi) DESC) AS City_Rank
FROM air_pollution
GROUP BY city;

-- Dense Rank cities 
SELECT
    city,
    ROUND(AVG(aqi), 2) AS Average_AQI,
    DENSE_RANK() OVER (ORDER BY AVG(aqi) DESC) AS Dense_Rank
FROM air_pollution
GROUP BY city;


-- Top 3 polluted cities (CTEs)

WITH CityAQI AS
(
    SELECT
        city,
        ROUND(AVG(aqi),2) AS Average_AQI
    FROM air_pollution
    GROUP BY city
)

SELECT *
FROM CityAQI
ORDER BY Average_AQI DESC
LIMIT 3;

-- Cleanest city (CTE)
WITH CityAQI AS
(
    SELECT
        city,
        ROUND(AVG(aqi),2) AS Average_AQI
    FROM air_pollution
    GROUP BY city
)

SELECT *
FROM CityAQI
ORDER BY Average_AQI ASC
LIMIT 1;

-- Average AQI by weekend
SELECT
    is_weekend,
    ROUND(AVG(aqi),2) AS Average_AQI
FROM air_pollution
GROUP BY is_weekend;

-- Pollutant with highest monthly average (PM2.5)
SELECT
    month,
    ROUND(AVG(pm25),2) AS Average_PM25
FROM air_pollution
GROUP BY month
ORDER BY Average_PM25 DESC;

-- Average visibility by season
SELECT
    season,
    ROUND(AVG(visibility),2) AS Average_Visibility
FROM air_pollution
GROUP BY season
ORDER BY Average_Visibility DESC;

-- Highest Temprature by city
SELECT
    city,
    MAX(temperature) AS Highest_Temperature
FROM air_pollution
GROUP BY city
ORDER BY Highest_Temperature DESC;

-- Monthly Record Count
SELECT
    month,
    COUNT(*) AS Total_Records
FROM air_pollution
GROUP BY month
ORDER BY month;
































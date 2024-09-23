--4.1

/* No, because there are still records of VA in the income and population tables. */

 --4.2

/* This does not work because there is no fips value that is 80. */

 --4.3

/* ChatGPT produced a pretty good code for this purpose but there is room for improvements. */

--4.5

/* yes, perfect */

--4.6 
--Step 1 
SELECT MAX(year) AS most_recent_year
FROM income;

-- Step 2
SELECT n.name, i.income, i.year
FROM income i
JOIN name n ON i.fips = n.fips
ORDER BY i.income DESC
LIMIT 1;

-- 4.7
WITH population_va AS (
    SELECT p.year, p.pop
    FROM population p
    WHERE p.fips = '51'
    ORDER BY p.year DESC
    LIMIT 6
)
SELECT 
    current.year AS current_year,
    previous.year AS previous_year,
    current.pop AS current_population,
    previous.pop AS previous_population,
    ((current.pop - previous.pop) / CAST(previous.pop AS DECIMAL) * 100) AS growth_rate_percentage
FROM population_va current
JOIN population_va previous ON current.year = previous.year + 1
ORDER BY current.year DESC;

/* I modifed the prompt to give it a more accurate guideline. */ 

--4.8 
/* ChatGPT does have some good codes, but does not always have an accurate response right away and needs to be double checked. */

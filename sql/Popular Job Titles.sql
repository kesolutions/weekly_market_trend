/*
-- ===========================================
-- Author: Abby Zhu
-- Create date: 2023-08-29
-- Desription: Popular job Titles
-- Returns Columns:
-- 1.category STRING
-- 2.category_count INTEGER
-- 3.percentage DECIMAL
*/

SELECT
    category,
    COUNT(Category) AS category_count, round(count(Category)/(select count(url) from `weekly-market-trend.backfill_source.after_fill`),4) as percentageURL
FROM (
    SELECT
        SPLIT(Category, ', ') AS category_array
    FROM `weekly-market-trend.backfill_source.after_fill`
)
CROSS JOIN UNNEST(category_array) AS category
GROUP BY category
order by count(Category) desc
limit 10;
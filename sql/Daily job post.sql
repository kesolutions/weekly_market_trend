/*
-- ===========================================
-- Author: Abby Zhu
-- Create date: 2023-08-29
-- Desription: Calculate the number of job posting last day
-- Returns Columns:
-- 1.Jobs INTEGER

*/


SELECT count(url) as Jobs 
FROM `weekly-market-trend.backfill_source.after_fill`
WHERE date(timestamp) = DATE_ADD(current_date(),INTERVAL -2 DAY);
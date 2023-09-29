/*
-- ===========================================
-- Author: Abby Zhu
-- Create date: 2023-09-8
-- Desription: Compare this month's avalible job with previous month
-- Returns Columns:
-- 1. previous_Monthly_jobs INTEGER
-- 2. Monthly_jobs INTEGER


*/





SELECT count(url) as previous_Monthly_jobs, (SELECT count(url) as Monthly_jobs FROM `weekly-market-trend.backfill_source.after_fill` WHERE date(timestamp) >= DATE_ADD(current_date(),INTERVAL -31 DAY)) as Monthly_jobs
FROM `weekly-market-trend.backfill_source.after_fill` 
WHERE date(timestamp) between DATE_ADD(current_date(),INTERVAL -62 DAY) and DATE_ADD(current_date(),INTERVAL -31 DAY);
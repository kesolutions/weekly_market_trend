/*
-- ===========================================
-- Author: Abby Zhu
-- Create date: 2023-09-8
-- Desription: Compare today's avalible job with previous day
-- Returns Columns:
-- 1. PreviousDay_Jobs INTEGER
-- 2. daily_job INTEGER


*/





SELECT count(url) as PreviousDay_Jobs, (SELECT count(url) as PreviousDay_Jobs 
FROM `weekly-market-trend.backfill_source.after_fill`
WHERE date(timestamp) = DATE_ADD(current_date(),INTERVAL -2 DAY)) as daily_job
FROM `weekly-market-trend.backfill_source.after_fill`
WHERE date(timestamp) = DATE_ADD(current_date(),INTERVAL -3 DAY);
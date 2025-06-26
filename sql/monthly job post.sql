/*
-- ===========================================
-- Author: Abby Zhu
-- Create date: 2023-08-29
-- Desription: Calculate the number of jobs posted in last months
-- Returns Columns:
-- 1.Monthly_jobs INTEGER
*/


SELECT count(url) as Monthly_jobs FROM `weekly-market-trend.backfill_source.after_fill` WHERE date(timestamp) >= DATE_ADD(current_date(),INTERVAL -31 DAY);
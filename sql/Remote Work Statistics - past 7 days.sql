/*
-- ===========================================
-- Author: Abby Zhu
-- Create date: 2023-08-29
-- Desription: Calculate percentage of remote jobs
-- Returns Columns:
-- 1.category STRING
-- 2.past7days DATE
-- 3.percentage DECIMAL
*/

select category,past7days, round(sum(remote)/count(remote),4) as percentage from (SELECT *,
       CASE WHEN LOWER(location) LIKE '%remote%' AND LOWER(location) NOT LIKE '%hybrid%'  THEN 1 ELSE 0 END AS Remote
FROM (select category,location, date(timestamp) as past7days from `weekly-market-trend.backfill_source.after_fill` where date(timestamp) >= DATE_ADD(current_date(),INTERVAL -8 DAY)))
group by past7days, category
order by past7days desc, sum(remote)/count(*) desc;

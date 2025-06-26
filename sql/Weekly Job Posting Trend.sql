/*
-- ===========================================
-- Author: Abby Zhu
-- Create date: 2023-08-29
-- Desription: Jobs posted in the past 7 days
-- Returns Columns:
-- 1.past7days DATE
-- 2.Number INTEGER
*/

select Past7Days, count(Past7Days) as Number from (select date(timestamp) as past7days from `weekly-market-trend.backfill_source.after_fill`) where Past7Days >= DATE_ADD(current_date(),INTERVAL -8 DAY) 
group by Past7Days
order by Past7Days desc;
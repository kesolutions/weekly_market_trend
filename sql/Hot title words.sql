/*
-- ===========================================
-- Author: Abby Zhu
-- Create date: 2023-09-8
-- Desription: clean title text information in last 30 days
-- Returns Columns:
-- 1.title STRING
-- 2.day_time DATE

*/





select title, day_time from (select (split(title, '-'))[safe_ordinal(1)] as title, link,
   (split(title, '-'))[safe_ordinal(2)] as media, PARSE_DATETIME("%a, %e %b %Y %H:%M:%S", `date_time`) Day_time
 FROM (select *, substr(`date`,1,length(`date`)-4) as date_time, FROM `weekly-market-trend.test.news_Canada` ) )
WHERE date(day_time) >= DATE_ADD(current_date(),INTERVAL -31 DAY) and title <> "Non"
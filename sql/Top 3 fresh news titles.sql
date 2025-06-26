/*
-- ===========================================
-- Author: Abby Zhu
-- Create date: 2023-09-8
-- Desription: Update first 3 news
-- Returns Columns:
-- 1. title STRING
-- 2. link STRING
-- 3. Day_time DATE

*/

select *
from(
select (split(title, '-'))[safe_ordinal(1)] as title,link,
    PARSE_DATETIME("%a, %e %b %Y %H:%M:%S", `date_time`) Day_time
 FROM (select *, substr(`date`,1,length(`date`)-4) as date_time, FROM `weekly-market-trend.test.news_Canada` ) )
order by Day_time desc
limit 3

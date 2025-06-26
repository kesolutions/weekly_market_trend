/*
-- ===========================================
-- Author: Abby Zhu
-- Create date: 2023-08-29
-- Desription: Number of new jobs posted for different city
-- Returns Columns:
-- 1.City STRING
-- 2.number_of_new_jobs INTEGER
*/

select city, count(city) as number_of_new_jobs, 
from (select (split(location, ','))[safe_ordinal(1)] as city
      from  (SELECT location FROM `weekly-market-trend.backfill_source.after_fill` 
      WHERE location NOT LIKE '%remote%' and location NOT  LIKE '%Remote%' and date(timestamp) = DATE_ADD(current_date(),INTERVAL -2  DAY)))
group by city
order by count(city) desc
limit 10;

/*
-- ===========================================
-- Author: Abby Zhu
-- Create date: 2023-08-29
-- Desription: The number of new jobs avaiable in different industry in past 7 days
-- Returns Columns:
-- 1.Industry STRING
-- 2.number_of_new_jobs INTEGER
-- 3.past7days DATE
*/


select i.Industry, count(i.Industry) as number_of_new_jobs, j.past7days 
from 
      (select Company, date(timestamp) as past7days from `weekly-market-trend.backfill_source.after_fill` where date(timestamp) >= DATE_ADD(current_date(),INTERVAL -9 DAY) ) j
left join weekly-market-trend.analysis_dset.industry_lookup_indeed i
on j.Company=i.Name_on_indeed
group by  j.past7days,i.Industry
order by j.past7days desc, count(i.Industry)desc;


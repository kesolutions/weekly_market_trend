/*
-- ===========================================
-- Author: Abby Zhu
-- Create date: 2023-09-8
-- Desription: Unemplyment rate from 2008/01/01-2023/06/01
-- Returns Columns:
-- 1. Years DATE
-- 2. rate INTEGER

*/

SELECT PARSE_DATETIME('%B %Y ', Date) as Years, value as rate FROM (SELECT date AS Date, value FROM `weekly-market-trend.test.unemployment_rate` )
where date IS NOT NULL
order by  PARSE_DATETIME('%B %Y ', Date) desc
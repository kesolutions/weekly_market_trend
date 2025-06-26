/*
-- ===========================================
-- Author: Abby Zhu
-- Create date: 2023-08-29
-- Desription: Average Salary for top Job Titles
-- Returns Columns:
-- 1.title STRING
-- 2.number INTEGER
-- 3.Avg_salary INTEGER
*/




-- Common Table Expression to get the top job titles by count
WITH TopJobTitles AS (
    SELECT
        title,
        COUNT(title) AS number
    FROM
        `weekly-market-trend.backfill_source.after_fill`
    GROUP BY
        title
    ORDER BY
        COUNT(title) DESC
    LIMIT 10
)

-- Common Table Expression to calculate average salary by title
, AvgSalaryByTitle AS (
    SELECT
        title,
        ROUND(
            AVG(CASE
                    WHEN salary_min = 0 OR salary_max = 0 THEN GREATEST(salary_min, salary_max)
                    ELSE (salary_min + salary_max) / 2
                END), 0
        ) AS Avg_salary
    FROM
        `weekly-market-trend.analysis_dset.Indeed_job_CleanedSalary`
    GROUP BY
        title
)

-- Final query to join top job titles with average salaries
SELECT
    tjt.title,
    tjt.number,
    ast.Avg_salary
FROM
    TopJobTitles tjt
LEFT JOIN
    AvgSalaryByTitle ast ON tjt.title = ast.title;

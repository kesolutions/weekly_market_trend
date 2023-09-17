**Project Introduction:**

**Objective:** The primary objective of this project is to provide real-time job market insights for the Canadian job market.

**Approach:** We achieve this by retrieving and analyzing data from BigQuery using SQL queries and presenting our findings through Looker Studio dashboards. This ensures that stakeholders have access to timely and actionable information.

![Project Diagram](https://github.com/kesolutions/weekly_market_trend/assets/116053082/56dca3c5-0711-4cb9-8e84-2e3404c7fa5e)

**Scope:** Our project encompasses tracking various aspects of the job market, including new job postings, popular titles, weekly trends, job descriptions (skills), news sources, new jobs by city, jobs in specific categories, skilled immigrants, recent layoffs, and recent expansion plans.

**Data Sources:** We primarily utilize data from the following BigQuery tables:

1. `Indeed_jobs`: A rich source of job postings data that enables us to track job market trends and job descriptions.

2. `weekly-market-trend.test.news_Canada`: This source provides valuable news data that can be correlated with job market trends.

![Data Sources Diagram](https://github.com/kesolutions/weekly_market_trend/assets/116053082/8c2b33df-e7fb-4fe9-a1e1-cafbce26d0c7)

**Key Metrics:**


| Chart Title                  | Chart Type                   | KPIs Included                                                   | Retrieved Tables                     |
|-----------------------------|------------------------------|----------------------------------------------------------------|--------------------------------------|
| New Jobs Posted Today       | Big Number with Trend        | Total new jobs, Daily postings, Monthly postings              | Daily job post, previous_dailyJob ,monthly job post previous_monthly |
| New Jobs posted by City     | Bar Chart                    | Number of new jobs posted for Toronto, Montreal, Calgary, and Vancouver | New Jobs posted by City               |
| Popular Job Titles          | Bar Chart                    | Top 10 job titles, Percentage of total postings               | Popular Job Titles                    |
| Weekly Job Posting Trend    | Line Chart                   | Jobs posted in the past 7 days, Trend comparison with previous 7 days | Weekly Job Posting Trend              |
| Job Descriptions & Skills   | Word Cloud/Bar               | Top skills required, Most demanding skills, Skill categories  | XXXXX                                |
| Unemployment Rate           | Line Chart                   | National unemployment rate, State/Province unemployment rate  | Unemployment_for_dashboard            |
| Industry Hiring Trends      | Stacked Bar Chart            | Hiring trends in key industries like tech, healthcare, etc.   | Industry Hiring Trends -past 7 days   |
| Remote Work Statistics      | Stacked Bar Chart (by Job Category) | Percentage of remote jobs, Trends in remote hiring   | Work Statistics - past 7 days   |
| Average Salary              | Line/Bar Chart               | Average Salary for top Job Titles                              | Average Salary                        |
| Top Three Recent News Updates | List                        | Show the new updated job news, click to go to the webpage     | Top 3 fresh news titles               |
| Most Trending Topics        | Word Cloud                   | Top news keywords in the past 30 days                         | Hot title words                      |



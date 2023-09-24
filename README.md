**Project Introduction:**

**Objective:** The primary objective of this project is to provide real-time job market insights for the Canadian job market.

**Approach:** We achieve this by retrieving and analyzing data from BigQuery using SQL queries and presenting our findings through Looker Studio dashboards. This ensures that stakeholders have access to timely and actionable information.

![Project Diagram](https://github.com/kesolutions/weekly_market_trend/assets/116053082/56dca3c5-0711-4cb9-8e84-2e3404c7fa5e)

**Scope:** Our project encompasses tracking various aspects of the job market, including new job postings, popular titles, weekly trends, job descriptions (skills), news sources, new jobs by city, jobs in specific categories, skilled immigrants, recent layoffs, and recent expansion plans.

**Data Sources:** We primarily utilize data from the following BigQuery tables:

1. `Indeed_jobs`: A rich source of job postings data that enables us to track job market trends and job descriptions.

2. `weekly-market-trend.test.news2026`: This source provides valuable news data that can be correlated with job market trends.

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
| Most Trending Topics        | Word Cloud                   | Top news keywords in the past 30 days                         | News_title_keywords
                     |


**Data Cleaning:**
1. In the data cleaning phase, we meticulously process the "news2026" news title columns to enhance data quality. This process includes:
   - Converting all text to lowercase to ensure consistency.
   - Removing HTML tags that may have crept into the text.
   - Eliminating special characters and digits that could distort the analysis.

**Natural Language Processing:**
In the realm of Natural Language Processing (NLP), we leverage Python to methodically prepare data pertaining to trending news keywords from the last 30 days. This comprehensive preparation encompasses the following key steps:
1. Tokenization: Breaking down the text into individual words, enabling further analysis at the word level.
2. Lemmatization: Ensuring words are reduced to their base or root form, enhancing text coherence.
3. Word Frequency Count: Calculating the frequency of each word to identify the most prominent keywords.
4. Stopword Removal: Eliminating common and insignificant words that do not contribute meaningfully to the analysis, ensuring a focus on the most relevant keywords.

These detailed processes empower us to generate a word cloud representing the most significant hot news keywords, offering valuable insights into recent trends and topics.


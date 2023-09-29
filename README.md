**Project Introduction:**

**Objective:** The primary objective of this project is to provide real-time job market insights for the Canadian job market.

**Approach:** We achieve this by retrieving and analyzing data from BigQuery using SQL queries and presenting our findings through Looker Studio dashboards. This ensures that stakeholders have access to timely and actionable information.
<div align="center">
  <img src="https://github.com/kesolutions/weekly_market_trend/assets/116053082/d548f4d5-768f-4939-a1be-f5574745e541" alt="Screenshot 2023-09-24 at 20 57 55" width="380" >
</div>




**Scope:** Our project encompasses tracking various aspects of the job market, including new job postings, popular titles, weekly trends, job descriptions (skills), news sources, new jobs by city, jobs in specific categories, skilled immigrants, recent layoffs, and recent expansion plans.

**Data Sources:** We primarily utilize data from the following BigQuery tables:

1. `Indeed_jobs`: A rich source of job postings data that enables us to track job market trends and job descriptions.

2. `weekly-market-trend.test.news2026`: This source provides valuable news data that can be correlated with job market trends.
<div align="center">
  <img src="https://github.com/kesolutions/weekly_market_trend/assets/116053082/39067617-43b2-4234-a403-72079e649f62" alt="Screenshot 2023-09-24 at 20:53:45" width="609">
</div>



**Key Metrics:**


| Chart Title                  | Chart Type                   | KPIs Included                                              | Retrieved Tables                |
|-----------------------------|------------------------------|-----------------------------------------------------------|---------------------------------|
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
| Most Trending Topics        | Word Cloud                   | Top news keywords in the past 30 days                         | News_title_keywords    |  
| Positive News Occupation        | Big Number                | Postive news occupation percentage in past 30 days      | pos_percentage    |



**Data Cleaning:**
1. In the data cleaning phase, we meticulously process the "news2026" news title columns to enhance data quality. This process includes:
   - Converting all text to lowercase to ensure consistency.
   - Removing HTML tags that may have crept into the text.
   - Eliminating special characters and digits that could distort the analysis.

**Natural Language Processing (NLP) Analysis:**
In the domain of Natural Language Processing (NLP), we harness the capabilities of Python to meticulously prepare data pertaining to trending news keywords from the previous 30 days. This meticulous preparation encompasses a series of critical steps:

1. **Tokenization:** The process of breaking down text into individual words, facilitating further analysis at the word level.

2. **Lemmatization:** Ensuring that words are transformed into their base or root form, thereby enhancing text coherence and semantic consistency.

3. **Word Frequency Count:** Calculation of the frequency of each word, enabling the identification of the most prominent and impactful keywords within the dataset.

4. **Stopword Removal:** Pruning common and inconsequential words from the dataset, eliminating noise, and enabling a sharper focus on the most meaningful and relevant keywords.

5. **Sentiment Analysis:** The application of sentiment analysis techniques to classify news articles as positive or negative based on their descriptions.

These meticulous processes collectively empower us to generate a word cloud visualization that encapsulates the most significant and influential hot news keywords. This provides valuable insights into emerging trends and topical discussions, contributing to a deeper understanding of recent developments.


**Looker Studio Visulization Dashboard:** [https://lookerstudio.google.com/u/2/reporting/9d201f82-efd2-4023-a04f-f9ff8a72f574/page/p_br8dhxfc9c/edit ](https://lookerstudio.google.com/reporting/9d201f82-efd2-4023-a04f-f9ff8a72f574)https://lookerstudio.google.com/reporting/9d201f82-efd2-4023-a04f-f9ff8a72f574

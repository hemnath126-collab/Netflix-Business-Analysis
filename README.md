Netflix Content Analytics

This project analyzes Netflix content using Python, MySQL, and Power BI to identify trends in movie and TV show distribution, content ratings, genres, and production countries.

🔧 Tools Used
Tool	Purpose
Python	Data cleaning and preprocessing
MySQL	Data analysis queries
Power BI	Dashboard visualization
📂 Dataset

The dataset contains 8800+ Netflix titles including:

Title

Type (Movie / TV Show)

Director

Country

Release Year

Rating

Duration

Genres

🧹 Data Cleaning (Python)

Python was used to:

Handle missing values

Convert date columns

Extract numeric durations

Prepare the dataset for SQL analysis

Example:

import pandas as pd

df = pd.read_csv("netflix_titles.csv")

df = df.dropna(subset=['type','country','release_year'])

df['date_added'] = pd.to_datetime(df['date_added'], errors='coerce')

df['duration_numeric'] = df['duration'].str.extract('(\d+)')
🗄 SQL Analysis

Example query used to analyze content distribution:

SELECT type,
COUNT(*) AS total_titles
FROM netflix_data_analysis
GROUP BY type;

Example query for country analysis:

SELECT TRIM(country_name) AS country,
COUNT(*) AS total_titles
FROM netflix_data_analysis ,
JSON_TABLE(
CONCAT('["', REPLACE(country, ',', '","'), '"]'),
'$[*]' COLUMNS(country_name VARCHAR(100) PATH '$')
) jt
GROUP BY TRIM(country_name);
📊 Power BI Dashboard

The Power BI dashboard provides insights into Netflix content using interactive visualizations.

Dashboard includes:

Total Movies

Total TV Shows

Average Movie Duration

Average TV Seasons

Genre Distribution

Rating Distribution

Country Distribution

Release Year Trends

📈 Key Insights

• Movies represent ~70% of Netflix content

• United States produces the most Netflix titles

• Drama and International Movies dominate genre distribution

• TV-MA is the most common rating

• Netflix content production increased rapidly after 2016

📷 Dashboard Preview

(Insert your dashboard screenshot here)

📊 Business Recommendations

• Expand international content production

• Invest in popular genres like Drama

• Continue producing TV-MA rated content

🚀 Future Improvements

Add predictive analytics

Perform viewer engagement analysis

Build machine learning recommendation models

⭐ Skills Demonstrated

Data Cleaning

SQL Analytics

Data Visualization

Dashboard Design

Business Insight Generation

💼 Author

Hemnath S

Data Analyst | Python | SQL | Power BI

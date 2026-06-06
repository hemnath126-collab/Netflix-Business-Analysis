# 🎬 Netflix Business Analysis

End-to-end Netflix content analysis using **Python, MySQL, and Power BI** to explore movie vs TV show distribution, genre trends, ratings, and top producing countries.

---

## 🔍 Overview

Netflix has over 8,800+ titles across movies and TV shows. This project analyzes content trends to understand how Netflix has grown its library, which genres dominate, and which countries produce the most content.

---

## 🎯 Objectives

- Analyze the distribution of Movies vs TV Shows
- Identify top content-producing countries
- Explore genre and rating trends
- Understand Netflix content growth over the years
- Build an interactive Power BI dashboard for business insights

---

## 🛠 Tools & Technologies

| Tool | Purpose |
|---|---|
| Python (Pandas) | Data cleaning and preprocessing |
| MySQL | Data analysis and querying |
| Power BI | Interactive dashboard and visualization |

---

## 📂 Dataset

The dataset contains **8,800+ Netflix titles** including:
- Title, Type (Movie / TV Show)
- Director, Country, Release Year
- Rating, Duration, Genres

---

## 🧹 Data Cleaning (Python)

Python was used to:
- Handle missing values in country, director, and rating columns
- Convert date columns to proper datetime format
- Extract numeric duration values from string format
- Prepare cleaned dataset for SQL analysis

---

## 🗄 SQL Analysis

Key queries performed:
- Content distribution by type (Movie vs TV Show)
- Top 10 countries by number of titles
- Genre frequency analysis using JSON_TABLE for multi-value columns
- Year-over-year content growth trends
- Rating distribution analysis

---

## 📊 Power BI Dashboard

The interactive dashboard includes:
- Total Movies and Total TV Shows (KPI cards)
- Average Movie Duration and Average TV Seasons
- Genre Distribution (bar chart)
- Rating Distribution (pie chart)
- Country Distribution (map visual)
- Release Year Trend (line chart)

### Dashboard Preview

https://github.com/hemnath126-collab/Netflix-Business-Analysis/blob/main/Dashbord%20Screenshot.png
---

## 📈 Key Insights

- **Movies make up ~70%** of Netflix content vs 30% TV Shows
- **United States** is the top content-producing country
- **Drama and International Movies** dominate genre distribution
- **TV-MA** is the most common content rating
- Netflix content production **increased sharply after 2016**, reflecting major investment in originals

---

## 💡 Business Recommendations

- Expand international content production — non-US content is growing in demand
- Invest further in Drama and Thriller genres based on audience popularity
- Continue TV-MA content strategy as it dominates viewer preferences
- Target underrepresented regions (Africa, Southeast Asia) for new original content

---

## 🚀 Future Improvements

- Add predictive analytics for content performance
- Perform viewer engagement analysis
- Build a machine learning content recommendation model

---

## 📁 Files Included

| File | Description |
|---|---|
| `Netflix_Business_Analysis.ipynb` | Python data cleaning and EDA notebook |
| `Netflix_Data_Analysis.sql` | SQL queries for content analysis |
| `Netflix_Business_Analysis.ipynb.pbix` | Power BI dashboard |
| `Netflix-Business-Analysis.pdf` | Project report (PDF) |
| `netflix.csv` | Dataset |

---

## ⭐ Skills Demonstrated

`Data Cleaning` `SQL Analytics` `Exploratory Data Analysis` `Power BI` `Data Visualization` `Business Insight Generation`

---

## 💼 Author

**Hemnath S**  
Data Analyst | Python | SQL | Power BI  
📧 hemnath126@gmail.com | 🔗 [GitHub](https://github.com/hemnath126-collab)

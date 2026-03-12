Use Netflix_Business_Analysis;

select * 
from netflix_data_analysis
limit 10;


alter table 
	netflix_data_analysis
	modify 
		release_year year;


-- Find the Movie vs TV Show distribution
Select 
	ifnull(type,"Total") as type,
    Count(*) As type_count,
    round(
		(count(*)/
		(Select 
			count(*) 
		FROM netflix_data_analysis)*100
        ),2) as percent
from netflix_data_analysis
group by 
	type With rollup;	


-- Find the total number of Movie and TV Show with country
SELECT  
	TRIM(country_name) AS country,
	sum(type = "Movie") AS Movies,
    sum(type = "TV Show")as TV_Show
FROM netflix_data_analysis ,
JSON_TABLE(
    CONCAT('["', REPLACE(country, ',', '","'), '"]'),
    '$[*]' COLUMNS(country_name VARCHAR(100) PATH '$')
) AS jt
WHERE country IS NOT NULL
AND Trim(country_name) != ""
GROUP BY Trim(country_name)
order by Movies DESC, Tv_Show DESC;


-- Find the Top 10 Countries Producing Netflix Content
SELECT  
	TRIM(country_name) AS country,
	sum(type = "Movie") AS Movies,
    sum(type = "TV Show")as TV_Show
FROM netflix_data_analysis ,
JSON_TABLE(
    CONCAT('["', REPLACE(country, ',', '","'), '"]'),
    '$[*]' COLUMNS(country_name VARCHAR(100) PATH '$')
) AS jt
WHERE country IS NOT NULL
AND Trim(country_name) != ""
GROUP BY Trim(country_name)
order by Movies DESC, Tv_Show DESC
limit 10;


-- Find the Country Contribution Percentage
SELECT  
	TRIM(country_name) AS country,
	ROUND(
		(sum(type = "Movie")
        /(SELECT COUNT(*) FROM netflix_data_analysis ))*100
        ,2) AS Movies,
    ROUND(
		(sum(type = "TV Show")
        /(SELECT COUNT(*) FROM netflix_data_analysis ))*100
        ,2) AS TV_Show
FROM netflix_data_analysis ,
JSON_TABLE(
    CONCAT('["', REPLACE(country, ',', '","'), '"]'),
    '$[*]' COLUMNS(country_name VARCHAR(100) PATH '$')
) AS jt
WHERE country IS NOT NULL
AND Trim(country_name) != ""
GROUP BY Trim(country_name)
order by Movies DESC, Tv_Show DESC;



--  Find the total number of Movie and TV Show by gener
SELECT  
	Trim(genre) as listed_in,
	sum(type = "Movie") AS Movies,
    sum(type = "TV Show")as TV_Show
FROM netflix_data_analysis,
JSON_TABLE(
	concat('["',REPLACE(listed_in,',','","'),'"]'),
	'$[*]'columns(genre varchar(100) path '$')
)AS t
WHERE listed_in IS NOT NULL 
AND Trim(genre) != ""
GROUP BY Trim(genre)
order by Movies DESC, Tv_Show DESC;



-- Find the Genre frequency

SELECT  
	Trim(genre) as listed_in,
	count(*) AS Type
FROM netflix_data_analysis,
JSON_TABLE(
	concat('["',REPLACE(listed_in,',','","'),'"]'),
	'$[*]'columns(genre varchar(100) path '$')
)AS t
WHERE listed_in IS NOT NULL 
AND Trim(genre) != ""
GROUP BY Trim(genre)
order by Type DESC ;



-- Find Top Genres on Netflix

SELECT  
	Trim(genre) as listed_in,
	count(*) AS Type
FROM netflix_data_analysis,
JSON_TABLE(
	concat('["',REPLACE(listed_in,',','","'),'"]'),
	'$[*]'columns(genre varchar(100) path '$')
)AS t
WHERE listed_in IS NOT NULL 
AND Trim(genre) != ""
GROUP BY Trim(genre)
order by Type DESC
LIMIT 10 ;

--  Find the Movie vs TV Show Trend by Year
SELECT 
	DISTINCT release_year,
	sum(type = "Movie") AS Movies,
    sum(type = "TV Show")as TV_Show
FROM netflix_data_analysis
group by release_year
ORDER BY Movies DESC ,TV_Show DESC ;

-- Top Years with Most Content Releases
Select
	Distinct release_year,
    Count(*) AS Total_Content_released
From netflix_data_analysis
Group by release_year
Order by Total_Content_released Desc
Limit 10;


--  Find the Most Frequent Directors

Select 
	director,
    Count(*) AS Movie_directoed
From netflix_data_analysis
where director is not null
group by director
ORDER BY Movie_directoed DESC
LIMIT 10;

-- Find Longest Movies on Netflix
Select
	title,
    CAST(SUBSTRING_INDEX(duration,' ',1) AS UNSIGNED) AS runtime_minutes
From netflix_data_analysis
order by runtime_minutes Desc
limit 10;

-- Find Average Movies duration on Netflix
Select
	type,
    Round(Avg(CAST(SUBSTRING_INDEX(duration,' ',1) AS UNSIGNED)),2) AS Avg_movie_duration
From netflix_data_analysis
Where type = "Movie";

-- Find Average TV show seasons on Netflix
Select
	type,
    Round(Avg(CAST(SUBSTRING_INDEX(duration,' ',1) AS UNSIGNED)),2) AS avg_tvshow_seasons
From netflix_data_analysis
Where type = "TV Show";

-- Content Distribution by Rating
Select
	Distinct rating,
    Count(*) Distribution_count
From netflix_data_analysis
Where rating is not null
group by rating
order by Distribution_count Desc;

-- Find Country vs Genre Analysis

Select 
	Trim(country_name) AS country,
    Trim(Genres) AS genre,
	COUNT(*) AS total_titles
From netflix_data_analysis,
Json_table(
	Concat('["',Replace(country,',','","'),'"]'),
	"$[*]" Columns(country_name Varchar(100) path "$")
)As Jt1,
JSON_TABLE(
		Concat('["',Replace(listed_in,',','","'),'"]'),
	"$[*]" Columns(Genres Varchar(100) path "$")
)As Jt2
Where country_name is not null
And Genres is not null
GROUP BY country_name, Genres
ORDER BY total_titles DESC;
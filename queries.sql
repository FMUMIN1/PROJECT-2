-- Query for the most popular movie and tv show released in each year from 2012 - 2022 based on IMDB votes from Paramount's dataset
SELECT *
FROM (
  SELECT *, 
    ROW_NUMBER() OVER (PARTITION BY release_year, type ORDER BY imdb_votes DESC) AS rn
  FROM paramount
) t
WHERE rn = 1 AND release_year <= 2022 AND release_year >= 2012
ORDER BY release_year, imdb_votes DESC;


-- Query for the most popular movie and tv show released in each year from 2012 - 2022 based on IMDB votes from Netflix's dataset
SELECT *
FROM (
  SELECT *, 
    ROW_NUMBER() OVER (PARTITION BY release_year, type ORDER BY imdb_votes DESC) AS rn
  FROM netflix
) t
WHERE rn = 1 AND release_year <= 2022 AND release_year >= 2012
ORDER BY release_year, imdb_votes DESC;

-- Based on the number of IMDB votes, does Netflix or Paramount have higher viewership?
SELECT SUM(imdb_votes) from netflix
SELECT COUNT(imdb_votes) from netflix
SELECT SUM(imdb_votes) from paramount
SELECT COUNT(imdb_votes) from paramount

-- Between 2012 and 2022, how many releases were there per year? 
SELECT COUNT(id), release_year
FROM paramount
GROUP BY release_year
ORDER BY COUNT (id) DESC;

SELECT COUNT(id), release_year
FROM netflix
GROUP BY release_year
ORDER BY COUNT (id) DESC;

CREATE TABLE combined as
	SELECT * FROM paramount
		UNION
	SELECT * FROM netflix;

SELECT COUNT(id), release_year
FROM combined
GROUP BY release_year
ORDER BY COUNT (id) DESC;

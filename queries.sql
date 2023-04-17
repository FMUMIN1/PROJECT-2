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
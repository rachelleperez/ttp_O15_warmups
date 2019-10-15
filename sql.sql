--Which are the 10 longest R rated movies?

SELECT film_id, title, length, rating
FROM film
WHERE rating = 'R'
ORDER BY length DESC
LIMIT 10;



-- What are the NEXT 10 longest R rated movies?
-- hint: google "how to get next 10 records in sql"

SELECT film_id, title, length, rating
FROM film
WHERE rating = 'R'
ORDER BY length DESC
OFFSET 10 ROWS
LIMIT 10;


--How many films are as long as the longest film?
-- RETURN an exact number

SELECT length, COUNT(film_id) as count
FROM film
GROUP BY length
HAVING length = (SELECT MAX(length) FROM film);

--Which are the 10 longest R rated movies, SORTED IN ALPHABETICAL ORDER?
-- hint: might need a subquery

WITH longest_r_films AS (

SELECT film_id, title, length, rating
FROM film
WHERE rating = 'R'
ORDER BY length DESC
LIMIT 10)

SELECT title
FROM  longest_r_films
ORDER by title;


--Which are the 10 kids films with the longest description?
-- G, PG, PG-13
--hint: google "SQL count length of string"


SELECT film_id, title, LENGTH(description) AS description_len
FROM film
WHERE rating IN ('G', 'PG', 'PG-13')
ORDER BY description_len DESC
LIMIT 10;


-- How many unique release_years are there in the dvd rental database?
-- Return an exact number


WITH years AS (SELECT DISTINCT release_year FROM film)
SELECT COUNT(*) from years;

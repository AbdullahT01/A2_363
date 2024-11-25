
--Question 6
 CREATE VIEW "movie-summary" AS
 SELECT
     m.tmdb_id,
     m.imdb_id,
     m.title,
     m.description,
     m.content_rating,
     m.runtime,
     (SELECT COUNT(*) FROM movie_keyword mKeyword WHERE mKeyword.movie_id = m.movie_id) AS number_of_keywords,
     (SELECT COUNT(*) FROM movie_country mCountry WHERE mCountry.movie_id = m.movie_id) AS number_of_countries
 FROM
     movie m;
 SELECT * FROM "movie-summary";
--Question 7a)
 SELECT
     COUNT(CASE WHEN m.imdb_id IS NOT NULL THEN 1 END) AS movies_with_imdb,
     COUNT(CASE WHEN m.imdb_id IS NULL THEN 1 END) AS movies_without_imdb
 FROM
     movie m;
 --Question 7b)
 SELECT movie.tmdb_id AS TMDB_ID, movie.imdb_id AS IMDB_ID,movie.title AS Title, movie.release_year AS Release_Year,movie.watchmode_id AS Watchmode_ID
 FROM actor
 INNER JOIN movie_actor ON actor.actor_id = movie_actor.actor_id
 INNER JOIN movie ON movie_actor.movie_id = movie.movie_id
 WHERE actor.actor_name = 'Keanu Reeves' AND movie.release_year BETWEEN 2000 AND 2020;
 --Question 7c)
 SELECT movie.title AS Title,movie.release_year AS Year,COUNT(movie_review.review_id) AS number_reviews
 FROM movie
 Inner JOIN movie_review ON movie.movie_id = movie_review.movie_id
 GROUP BY movie.movie_id
 ORDER BY number_reviews DESC
 LIMIT 3;
--Question 7d)
 SELECT m.title, COUNT(mLanguage.language_id) AS number_language
 FROM movie m
 Inner JOIN movie_language mLanguage ON m.movie_id = mLanguage.movie_id
 GROUP BY m.movie_id
 HAVING COUNT(mLanguage.language_id) > 1;
--Question 7e)
 SELECT l.language_name AS Language, COUNT(mLanguage.movie_id) AS number_movie
 FROM language l
 JOIN movie_language mLanguage ON l.language_id ---------------------------------------= mLanguage.language_id
 GROUP BY l.language_id
 ORDER BY number_movie DESC;
--Question 7f)
 SELECT m.title, m.rating
 FROM movie m
 JOIN movie_genre mGenre ON m.movie_id = mGenre.movie_id
 JOIN genre g ON mGenre.genre_id = g.genre_id
 WHERE g.genre = 'Comedy' or g.genre='comedy'
 ORDER BY m.rating DESC
 LIMIT 2;
--Question 8g)
 UPDATE movie SET rating = CEIL(rating);
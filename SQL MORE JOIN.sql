------------------------MORE JOIN----------------------------
/*List the films where the yr is 1962 [Show id, title]*/
SELECT id, title
FROM movie
WHERE yr=1962
/*Give year of 'Citizen Kane'.*/
SELECT yr
FROM movie
WHERE title ='Citizen Kane'
/*List all of the Star Trek movies, include the id, title and yr (all of these movies include the words Star Trek in the title). Order results by year.*/
SELECT id, title, yr
FROM movie
WHERE title like'Star Trek%'
ORDER by yr
/*What id number does the actor 'Glenn Close' have?*/
SELECT id
FROM actor
WHERE name = 'Glenn Close';
/*What is the id of the film 'Casablanca'*/
SELECT id
FROM movie
WHERE title =  'Casablanca'
/*Obtain the cast list for 'Casablanca'.
what is a cast list?
Use movieid=11768, (or whatever value you got from the previous question)*/
SELECT a.name
FROM actor a
JOIN casting c
ON c.actorid = a.id
WHERE c.movieid = 11768
/*Obtain the cast list for the film 'Alien'*/
SELECT name
FROM movie m
JOIN casting c
ON m.id = c.movieid
JOIN actor a
ON c.actorid = a.id
WHERE title='Alien'
/*List the films in which 'Harrison Ford' has appeared*/
SELECT title
FROM movie m
JOIN casting c
ON m.id = c.movieid
JOIN actor a
ON c.actorid = a.id
WHERE a.name ='Harrison Ford'
/*List the films where 'Harrison Ford' has appeared - but not in the starring role.
[Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]*/
SELECT title
FROM movie m
JOIN casting c
ON m.id = c.movieid
JOIN actor a
ON c.actorid = a.id
WHERE a.name ='Harrison Ford' and ord!= 1
/*List the films together with the leading star for all 1962 films.*/
SELECT title, name
FROM movie m
JOIN casting c
ON m.id = c.movieid
JOIN actor a
ON c.actorid = a.id
WHERE yr = 1962 and ord =1

/*Which were the busiest years for 'Rock Hudson', show the year and the number of movies he made each year for any year in which he made more than 2 movies.*/
SELECT yr,COUNT(title) 
FROM movie JOIN casting ON movie.id=movieid
           JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2
/*List the film title and the leading actor for all of the films 'Julie Andrews' played in.*/
SELECT name
FROM casting JOIN actor
ON  actorid = actor.id
WHERE ord=1
GROUP BY name
HAVING COUNT(movieid)>=15
/*Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.*/
SELECT title, COUNT(actorid)
FROM casting,movie                
WHERE yr=1978
AND movieid=movie.id
GROUP BY title
ORDER BY 2 DESC,1 ASC
/*List the films released in the year 1978 ordered by the number of actors in the cast, then by title.*/
SELECT title, COUNT(actorid)
FROM casting,movie                
WHERE yr=1978
AND movieid=movie.id
GROUP BY title
ORDER BY 2 DESC,1 ASC
/*List all the people who have worked with 'Art Garfunkel'.*/
SELECT DISTINCT d.name
FROM actor d
JOIN casting a ON (a.actorid=d.id)
JOIN casting b on (a.movieid=b.movieid)
JOIN actor c on (b.actorid=c.id 
                and c.name='Art Garfunkel')
WHERE d.id!=c.id

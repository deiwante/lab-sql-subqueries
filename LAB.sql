-- Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.
-- Got movie ID.
SELECT * FROM film
WHERE title = "Hunchback Impossible";
-- Find all the copies in inventory
SELECT * FROM inventory
WHERE film_id = "439";

SELECT film_id, COUNT(*) AS num_copies
FROM inventory
WHERE film_id = (
    SELECT film_id
    FROM film
    WHERE title = "Hunchback Impossible"
)
GROUP BY film_id;

-- List all films whose length is longer than the average length of all the films in the Sakila database.
-- Got the average length
SELECT ROUND(AVG(length),2) AS 'Average' FROM sakila.film;

SELECT * FROM sakila.film 
WHERE length > (SELECT ROUND(AVG(length)) AS 'Average' FROM sakila.film);

-- Use a subquery to display all actors who appear in the film "Alone Trip".

SELECT actor_id FROM film_actor
WHERE film_id = "17";

SELECT actor_id, first_name, last_name AS actors_in
FROM actor
WHERE actor_id IN (
    SELECT actor_id 
    FROM film_actor
	WHERE film_id = "17"
)
GROUP BY actor_id;

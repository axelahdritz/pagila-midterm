/*
 * You want to watch a movie tonight.
 * But you're superstitious,
 * and don't want anything to do with the letter 'F'.
 * List the titles of all movies that:
 * 1) do not have the letter 'F' in their title,
 * 2) have no actors with the letter 'F' in their names (first or last),
 * 3) have never been rented by a customer with the letter 'F' in their names (first or last).
 *
 * NOTE:
 * Your results should not contain any duplicate titles.
 */

SELECT 
    title
FROM 
    film
WHERE film_id NOT IN (
	SELECT 
        fa.film_id
	FROM 
        film_actor fa
	JOIN  actor a ON (a.actor_id = fa.actor_id)
	WHERE 
        a.first_name LIKE '%F%'
      OR a.last_name LIKE '%F%'
)
AND film_id NOT IN (
	SELECT
		i.film_id 
	FROM 
        inventory i
    JOIN rental r ON (r.inventory_id = i.inventory_id)
    JOIN customer c ON (c.customer_id = r.customer_id)
    WHERE 
        c.first_name LIKE '%F%'
      OR c.last_name LIKE '%F%'
)
AND title NOT LIKE '%F%'
ORDER BY title;

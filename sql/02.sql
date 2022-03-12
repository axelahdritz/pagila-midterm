/*
 * Count the number of distinct customers who have rented a movie that 'RUSSELL BACALL' has acted in.
 *
 * NOTE:
 * You cannot hard-code Russell Bacall's actor_id.
 * You're where clause must include a condition using the "first_name" and "last_name" fields of the "actor" table.
 */


SELECT
    COUNT(customer_id)
FROM 
    customer
WHERE 
    customer_id IN (
        SELECT 
            customer_id
        FROM actor a
        JOIN film_actor fa ON (fa.actor_id = a.actor_id)
        JOIN film f ON (f.film_id = fa.film_id)
        JOIN inventory i ON (i.film_id = f.film_id)
        JOIN rental r ON (r.inventory_id = i.inventory_id)
        WHERE 
            a.first_name = 'RUSSELL'
         AND a.last_name = 'BACALL'
    );

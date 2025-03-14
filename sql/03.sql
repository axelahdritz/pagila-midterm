/*
 * List the titles of all films in the 'Children' category that have a rating of 'R' or 'NC-17'.
 *
 * NOTE:
 * Your results should not contain any duplicate titles.
 */

SELECT
	DISTINCT title 
FROM 
    film f
JOIN film_category fc ON (fc.film_id = f.film_id)
JOIN category c ON (c.category_id = fc.category_id)
WHERE 
    c.name = 'Children' AND
    (f.rating = 'R' OR f.rating = 'NC-17')
ORDER BY title;


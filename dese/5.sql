SELECT city, COUNT(id) AS number_of_public_schools
FROM schools
WHERE type = 'Public School'
GROUP BY city
HAVING number_of_public_schools <= 3
ORDER BY number_of_public_schools DESC, city ASC;

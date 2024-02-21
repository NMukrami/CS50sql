SELECT city, COUNT(*) AS most_public_schools
FROM schools
WHERE type = 'Public School'
GROUP BY city
ORDER BY  most_public_schools DESC, city ASC
LIMIT 10;

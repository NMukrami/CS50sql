SELECT pl.first_name, pl.last_name, s.salary
FROM players pl
INNER JOIN salaries s ON pl.id = s.player_id
WHERE s.year = 2001
GROUP BY pl.first_name, pl.last_name, pl.id
ORDER BY s.salary
LIMIT 50
;

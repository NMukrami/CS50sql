-- SELECT pl.first_name, pl.last_name
-- FROM players pl
-- INNER JOIN salaries s ON s.player_id = pl.id
-- ORDER BY s.salary DESC
-- LIMIT 1
-- ;

SELECT pl.first_name, pl.last_name
FROM players pl
INNER JOIN salaries s ON s.player_id = pl.id
WHERE s.salary = (
    SELECT MAX(salary)
    FROM salaries
    )
;

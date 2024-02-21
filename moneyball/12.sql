
SELECT first_name, last_name
FROM (
    SELECT pl.first_name, pl.last_name, pl.id AS "id"
    FROM performances p
    JOIN players pl ON pl.id = p.player_id
    JOIN salaries s ON s.player_id = pl.id AND s.year = p.year
    WHERE p.year = 2001 AND p.H > 0
    ORDER BY s.salary / p.H
    LIMIT 10)

INTERSECT

SELECT first_name, last_name
FROM (
    SELECT pl.first_name, pl.last_name, pl.id AS "id"
    FROM performances p
    JOIN players pl ON pl.id = p.player_id
    JOIN salaries s ON s.player_id = pl.id AND s.year = p.year
    WHERE p.year = 2001 AND p.RBI > 0
    ORDER BY s.salary / p.RBI
    LIMIT 10)
ORDER BY last_name ASC
;

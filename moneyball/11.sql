
SELECT
    pl.first_name,
    pl.last_name,
    s.salary / p.H AS 'dollars_per_hit'
FROM
    players pl
INNER JOIN salaries s ON pl.id = s.player_id
INNER JOIN performances p ON pl.id = p.player_id
WHERE s.year = 2001 AND p.year = 2001 AND p.H > 0
ORDER BY dollars_per_hit, pl.first_name, pl.last_name
LIMIT 10
;


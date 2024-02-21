SELECT s.year, s.salary
FROM salaries s
INNER JOIN players p ON p.id = s.player_id
WHERE p.first_name = 'Cal' AND p.last_name = 'Ripken'
ORDER BY s.year DESC
;

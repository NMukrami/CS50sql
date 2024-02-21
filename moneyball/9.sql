SELECT t.name, ROUND(AVG(s.salary), 2) AS 'average_salary'
FROM teams t
INNER JOIN salaries s ON s.team_id = t.id
WHERE s.year = 2001
GROUP BY t.name
ORDER BY average_salary
LIMIT 5
;

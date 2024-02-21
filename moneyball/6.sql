SELECT t.name, SUM(p.H) AS 'total_hits'
FROM performances p
INNER JOIN teams t ON t.id = p.team_id
WHERE p.year = 2001
GROUP BY t.name
ORDER BY total_hits DESC
LIMIT 5
;


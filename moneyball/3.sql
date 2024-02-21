SELECT p.year, p.HR
FROM performances p
INNER JOIN players pl ON pl.id = p.player_id
WHERE (pl.first_name = 'Ken' AND pl.last_name = 'Griffey' ) AND pl.birth_year = 1969
ORDER BY p.year DESC
;

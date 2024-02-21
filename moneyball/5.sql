SELECT t.name
FROM teams t
INNER JOIN performances p ON p.team_id = t.id
INNER JOIN players pl ON pl.id = p.player_id
WHERE pl.first_name = 'Satchel' AND pl.last_name = 'Paige'
;


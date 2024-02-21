SELECT s.salary
FROM salaries s
INNER JOIN players pl ON pl.id = s.player_id
INNER JOIN performances p ON pl.id = p.player_id
WHERE s.year = 2001
    AND p.HR = (
        SELECT MAX(HR)
        FROM performances
    )
;

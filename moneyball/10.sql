SELECT
    pl.first_name,
    pl.last_name,
    s.salary, s.year,
    p.HR
FROM performances p
INNER JOIN players pl
    ON pl.id = p.player_id
INNER JOIN salaries s
    ON pl.id = s.player_id
    AND p.year = s.year
ORDER BY
        pl.id,
        s.year DESC,
        HR DESC,
        salary DESC
;



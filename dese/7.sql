SELECT name
FROM schools
WHERE district_id = (
    SELECT id
    FROM districts
    WHERE name = 'Cambridge'
);


-- find cambridge id = 81
-- SELECT *
-- FROM districts
-- WHERE name = 'Cambridge';




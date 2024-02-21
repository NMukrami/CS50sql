SELECT "first_name" AS "first", "last_name" AS "Last"
FROM "players"
WHERE "final_game" LIKE '2022%'
ORDER BY "first_name" ASC, "last_name" ASC;

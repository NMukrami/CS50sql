
SELECT
    "friends1"."friend_id"
FROM
    "friends" "friends1"
JOIN
    "friends" "friends2" ON "friends1"."friend_id" = "friends2"."friend_id"
WHERE "friends1"."user_id" = (
    SELECT "id"
    FROM "users"
    WHERE "username" = 'lovelytrust487'
)
AND "friends2"."user_id" = (
    SELECT "id"
    FROM "users"
    WHERE "username" = 'exceptionalinspiration482'
);







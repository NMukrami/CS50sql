SELECT
    "messages"."to_user_id"
FROM
    "messages"
JOIN
    "users" ON "messages"."from_user_id" = "users"."id"
WHERE
    "users"."username" = 'creativewisdom377'
GROUP BY
    "messages"."to_user_id"
ORDER BY
    COUNT("messages"."to_user_id") DESC
LIMIT 3
;


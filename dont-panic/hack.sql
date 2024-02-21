-- alter password admin--
UPDATE "users"
SET "password" = '982c0381c279d139fd221fce974916e7'
WHERE "username" = (
    SELECT "username"
    FROM "users"
    WHERE "username" = 'admin'
    );


-- erase logs password --
DELETE FROM "user_logs"
WHERE id = (
    SELECT "id"
    FROM user_logs
    WHERE "new_password" = '982c0381c279d139fd221fce974916e7'
    );


-- add data to logs--
INSERT INTO "user_logs" ("type", "old_username", "new_username", "old_password", "new_password")
SELECT 'update',
        'admin',
        'admin',
        NULL,
        (SELECT "password" FROM "users" WHERE "username" = 'emily33');


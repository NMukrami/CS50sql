SELECT COUNT(*)
FROM "views"
WHERE "artist" = 'Hiroshige' AND ("english_title" LIKE '%Eastern%' OR "english_title" LIKE '%Capital%');
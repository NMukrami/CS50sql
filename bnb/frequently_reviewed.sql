
CREATE VIEW "frequently_reviewed" AS
SELECT
    "listings"."id",
    "listings"."property_type",
    "listings"."host_name"
FROM
    "listings"
JOIN
    "reviews" ON "listings"."id" = "reviews"."listing_id"
GROUP BY
    "listings"."id"
ORDER BY
    COUNT("reviews"."listing_id") DESC,
    "listings"."property_type",
    "listings"."host_name"
;

-- SELECT * FROM "frequently_reviewed" LIMIT 10;
-- DROP VIEW FROM "frequently_reviewed"

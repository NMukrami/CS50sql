
-- new view table from listings contain 1 bedroom
CREATE VIEW "one_bedrooms" AS
SELECT
    "id",
    "property_type",
    "host_name",
    "accommodates"
FROM
    "listings"
WHERE
    "bedrooms" = 1
;


-- SELECT * FROM  "one_bedrooms" LIMIT 10;


-- *** The Lost Letter ***
-- At what type of address did the Lost Letter end up?:
SELECT * FROM "addresses" WHERE "address" = '900 Somerville Avenue';
SELECT * FROM "packages" WHERE "from_address_id" = '432' AND "contents" LIKE '%letter%' AND "contents" LIKE '%congratulatory%';
-- At what address did the Lost Letter end up?
SELECT * FROM "addresses" WHERE "id" = '854';


-- *** The Devious Delivery ***
-- What were the contents of the Devious Delivery?:
SELECT * FROM packages WHERE from_address_id IS NULL;
SELECT * FROM scans WHERE package_id = '5098';
-- At what type of address did the Devious Delivery end up?:
SELECT * FROM addresses WHERE id = '348';


-- *** The Forgotten Gift ***
-- What are the contents of the Forgotten Gift?:
SELECT * FROM addresses WHERE address = '109 Tileston Street';
SELECT * FROM packages WHERE from_address_id = '9873';
-- Who has the Forgotten Gift?:
SELECT * FROM scans WHERE package_id = '9523';

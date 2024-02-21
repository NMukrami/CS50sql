-- SELECT AVG(per_pupil_expenditure)
-- FROM expenditures
--  ;
-- 19528.990025253

-- SELECT AVG(exemplary)
-- FROM staff_evaluations
-- ;
-- 16.938019169329

SELECT districts.name, expenditures.per_pupil_expenditure, staff_evaluations.exemplary
FROM districts
JOIN expenditures
    ON districts.id = expenditures.district_id
JOIN staff_evaluations
    ON districts.id = staff_evaluations.district_id
WHERE districts.type LIKE 'Public%'
    AND per_pupil_expenditure >= 19528.990025253
    AND exemplary >= 16.938019169329
ORDER BY exemplary DESC, per_pupil_expenditure DESC
;


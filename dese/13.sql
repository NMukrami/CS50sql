SELECT districts.name, expenditures.per_pupil_expenditure, staff_evaluations.exemplary
FROM districts
JOIN expenditures
    ON districts.id = expenditures.district_id
JOIN staff_evaluations
    ON districts.id = staff_evaluations.district_id
WHERE districts.type = 'Public School District'
    AND per_pupil_expenditure >= 19528.990025253
    AND exemplary >= 16.938019169329
;


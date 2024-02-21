CREATE INDEX "courses_idx" ON "courses"("semester", "department", "title")
WHERE "semester" = 'Fall 2023' AND "semester" = 'Spring 2024'
;

CREATE INDEX "enrollments_idx" ON "enrollments"("student_id", "course_id")
;

CREATE INDEX "requirements_idx" ON "requirements"("id","name")
;

CREATE INDEX "satisfies_idx" ON "satisfies"("course_id", "requirement_id")
;

CREATE INDEX "students_idx" ON "students"("id", "name")
;






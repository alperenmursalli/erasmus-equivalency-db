ALTER TABLE semester
ADD CONSTRAINT ck_semester_level
CHECK (level > 0);

ALTER TABLE semester
ADD CONSTRAINT ck_semester_term
CHECK (term IN ('Fall', 'Spring'));

select *
from semester;

ALTER TABLE course
ADD CONSTRAINT ck_course_hours
CHECK (teoric_hours >= 0 AND lab_hours >= 0);

ALTER TABLE department
ADD CONSTRAINT uq_department_name_per_uni
UNIQUE (uni_id, dept_name);

ALTER TABLE department
ADD CONSTRAINT ck_department_duration
CHECK (standart_duration > 0 AND maximum_duration >= standart_duration);

ALTER TABLE department
ADD CONSTRAINT ck_department_quota
CHECK (quota >= 0);

ALTER TABLE section
ADD CONSTRAINT ck_section_instructor_required
CHECK (instructor_id IS NOT NULL);

ALTER TABLE course_activities
ADD CONSTRAINT ck_activity_weight_range
CHECK (weight BETWEEN 0 AND 100);


ALTER TABLE equivalency
ADD CONSTRAINT ck_equivalency_ratio
CHECK (match_ratio BETWEEN 0 AND 100);

ALTER TABLE student
ADD CONSTRAINT ck_student_uni_not_same
    CHECK (source_uni_id <> target_uni_id);


CREATE TABLE university (
  uni_id        INTEGER,
  uni_name      VARCHAR(150) NOT NULL,
  erasmus_code  VARCHAR(30),
  location      VARCHAR(150),
  web_address   VARCHAR(255),

  CONSTRAINT pk_university PRIMARY KEY (uni_id)
);


ALTER TABLE university
ALTER COLUMN erasmus_code SET NOT NULL;


CREATE TABLE department (
  dept_id               INTEGER,
  uni_id                INTEGER NOT NULL,
  dept_name             VARCHAR(150) NOT NULL,
  dept_type             VARCHAR(50),
  location              VARCHAR(150),
  instruction_language  VARCHAR(50),
  standart_duration     INTEGER,
  maximum_duration      INTEGER,
  quota                 INTEGER,

  CONSTRAINT pk_department PRIMARY KEY (dept_id),

  CONSTRAINT fk_department_university
    FOREIGN KEY (uni_id)
    REFERENCES university(uni_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);





CREATE TABLE semester (
  semester_num INTEGER,
  level        INTEGER NOT NULL,
  term         VARCHAR(10) NOT NULL,

  CONSTRAINT pk_semester PRIMARY KEY (semester_num)
);

CREATE TABLE course (
  course_id          INTEGER,
  dept_id            INTEGER NOT NULL,
  semester_num       INTEGER,

  course_code        VARCHAR(30),
  course_name        VARCHAR(150) NOT NULL,
  course_type        VARCHAR(50),
  course_level       VARCHAR(50),
  course_description VARCHAR(1000),
  course_goal        VARCHAR(1000),
  teaching_method    VARCHAR(200),

  teoric_hours       INTEGER NOT NULL,
  lab_hours          INTEGER NOT NULL,

  course_crdt NUMERIC(5,2)
    GENERATED ALWAYS AS (teoric_hours + (lab_hours / 2.0)) STORED,

  acts               NUMERIC(4,1),
  course_lang        VARCHAR(50),

  CONSTRAINT pk_course PRIMARY KEY (course_id),
  CONSTRAINT uq_course_code UNIQUE (course_code),

  CONSTRAINT fk_course_department
    FOREIGN KEY (dept_id)
    REFERENCES department(dept_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,

  CONSTRAINT fk_course_semester
    FOREIGN KEY (semester_num)
    REFERENCES semester(semester_num)
    ON UPDATE CASCADE
    ON DELETE SET NULL
);


CREATE TABLE faculty_members (
  faculty_id INTEGER,
  firstname  VARCHAR(100) NOT NULL,
  lastname   VARCHAR(100) NOT NULL,

  CONSTRAINT pk_faculty_members PRIMARY KEY (faculty_id)
);


CREATE TABLE lecturer (
  faculty_id INTEGER,
  title      VARCHAR(50),

  CONSTRAINT pk_lecturer PRIMARY KEY (faculty_id),
  CONSTRAINT fk_lecturer_faculty
    FOREIGN KEY (faculty_id)
    REFERENCES faculty_members(faculty_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);


CREATE TABLE assistant (
  faculty_id INTEGER,

  CONSTRAINT pk_assistant PRIMARY KEY (faculty_id),
  CONSTRAINT fk_assistant_faculty
    FOREIGN KEY (faculty_id)
    REFERENCES faculty_members(faculty_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);




CREATE TABLE instructor (
  faculty_id INTEGER,

  CONSTRAINT pk_instructor PRIMARY KEY (faculty_id),
  
  CONSTRAINT fk_instructor_lecturer
    FOREIGN KEY (faculty_id)
    REFERENCES lecturer(faculty_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);



CREATE TABLE coordinator (
  faculty_id INTEGER,

  CONSTRAINT pk_coordinator PRIMARY KEY (faculty_id),
  CONSTRAINT fk_coordinator_lecturer
    FOREIGN KEY (faculty_id)
    REFERENCES lecturer(faculty_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);



CREATE TABLE section (
  section_id     INTEGER,
  course_id      INTEGER NOT NULL,
  instructor_id  INTEGER NOT NULL,
  coord_id       INTEGER,

  CONSTRAINT pk_section PRIMARY KEY (section_id),

  CONSTRAINT fk_section_course
    FOREIGN KEY (course_id)
    REFERENCES course(course_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,

  CONSTRAINT fk_section_instructor
    FOREIGN KEY (instructor_id)
    REFERENCES instructor(faculty_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,

  CONSTRAINT fk_section_coordinator
    FOREIGN KEY (coord_id)
    REFERENCES coordinator(faculty_id)
    ON UPDATE CASCADE
    ON DELETE SET NULL
);


CREATE TABLE course_topics (
  course_id   INTEGER,
  week_number INTEGER,
  topic_name  VARCHAR(200) NOT NULL,
  topic_brief VARCHAR(500),

  CONSTRAINT pk_course_topics PRIMARY KEY (course_id, week_number),
  CONSTRAINT fk_course_topics_course
    FOREIGN KEY (course_id)
    REFERENCES course(course_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);


CREATE TABLE learning_outcomes (
  course_id      INTEGER,
  outcome_number INTEGER,
  outcome_text   VARCHAR(1000) NOT NULL,

  CONSTRAINT pk_learning_outcomes PRIMARY KEY (course_id, outcome_number),
  CONSTRAINT fk_learning_outcomes_course
    FOREIGN KEY (course_id)
    REFERENCES course(course_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);


CREATE TABLE course_resources (
  course_id     INTEGER,
  resource_name VARCHAR(200),
  resource_type VARCHAR(30),

  CONSTRAINT pk_course_resources PRIMARY KEY (course_id, resource_name),
  CONSTRAINT fk_course_resources_course
    FOREIGN KEY (course_id)
    REFERENCES course(course_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);


CREATE TABLE course_activities (
  course_id     INTEGER,
  activity_name VARCHAR(200),
  activity_type VARCHAR(30),
  weight        NUMERIC(5,2),
  count         INTEGER,
  workload      INTEGER,

  CONSTRAINT pk_course_activities PRIMARY KEY (course_id, activity_name),
  CONSTRAINT fk_course_activities_course
    FOREIGN KEY (course_id)
    REFERENCES course(course_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);

CREATE TABLE prerequisites (
  offer_course_id INTEGER,
  preq_course_id  INTEGER,

  CONSTRAINT pk_prerequisites PRIMARY KEY (offer_course_id, preq_course_id),
  CONSTRAINT ck_prereq_not_self CHECK (offer_course_id <> preq_course_id), -- !=

  CONSTRAINT fk_prereq_offer
    FOREIGN KEY (offer_course_id)
    REFERENCES course(course_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,

  CONSTRAINT fk_prereq_preq
    FOREIGN KEY (preq_course_id)
    REFERENCES course(course_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);
CREATE TABLE student (
  student_id INTEGER,
  firstname  VARCHAR(100) NOT NULL,
  lastname   VARCHAR(100) NOT NULL,

  source_uni_id INTEGER NOT NULL,
  target_uni_id INTEGER NOT NULL,

  CONSTRAINT pk_student PRIMARY KEY (student_id),

  CONSTRAINT fk_student_source_uni
    FOREIGN KEY (source_uni_id)
    REFERENCES university(uni_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,

  CONSTRAINT fk_student_target_uni
    FOREIGN KEY (target_uni_id)
    REFERENCES university(uni_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);

CREATE TABLE equivalency (
  home_course_id INTEGER NOT NULL,
  host_course_id INTEGER NOT NULL,
  match_ratio    NUMERIC(5,2),
  match_type     VARCHAR(50),

  CONSTRAINT pk_equivalency
    PRIMARY KEY (home_course_id, host_course_id),

  CONSTRAINT ck_equiv_not_same_course
    CHECK (home_course_id <> host_course_id),

  CONSTRAINT fk_equiv_home_course
    FOREIGN KEY (home_course_id)
    REFERENCES course(course_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,

  CONSTRAINT fk_equiv_host_course
    FOREIGN KEY (host_course_id)
    REFERENCES course(course_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);


CREATE TABLE enrollment (
  enrollment_id  INTEGER NOT NULL,
  home_course_id INTEGER NOT NULL,
  host_course_id INTEGER,

  CONSTRAINT pk_enrollment
    PRIMARY KEY (enrollment_id),

  CONSTRAINT fk_enr_equivalency
    FOREIGN KEY (home_course_id, host_course_id)
    REFERENCES equivalency(home_course_id, host_course_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT
);

ALTER TABLE enrollment
ADD CONSTRAINT uq_enrollment_home_host
UNIQUE (home_course_id, host_course_id);


CREATE TABLE enrolls (
  student_id     INTEGER NOT NULL,
  enrollment_id  INTEGER NOT NULL,

  CONSTRAINT pk_enrolls
    PRIMARY KEY (student_id, enrollment_id),

  CONSTRAINT fk_enrolls_student
    FOREIGN KEY (student_id)
    REFERENCES student(student_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE,

  CONSTRAINT fk_enrolls_enrollment
    FOREIGN KEY (enrollment_id)
    REFERENCES enrollment(enrollment_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);
ALTER TABLE enrolls
ADD CONSTRAINT uq_enrolls_unique
UNIQUE (student_id, enrollment_id);


CREATE TABLE assist (
  faculty_id INTEGER,
  section_id INTEGER,

  CONSTRAINT pk_assist PRIMARY KEY (faculty_id, section_id),

  CONSTRAINT fk_assist_assistant
    FOREIGN KEY (faculty_id)
    REFERENCES assistant(faculty_id)
    ON UPDATE CASCADE
    ON DELETE RESTRICT,

  CONSTRAINT fk_assist_section
    FOREIGN KEY (section_id)
    REFERENCES section(section_id)
    ON UPDATE CASCADE
    ON DELETE CASCADE
);



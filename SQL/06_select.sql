---- öğretmenlerin verdikleri dersler
SELECT
  fm.faculty_id,
  fm.firstname || ' ' || fm.lastname AS instructor_name,
  c.course_id,
  c.course_name
FROM section as s
JOIN instructor as i
  ON i.faculty_id = s.instructor_id
JOIN faculty_members as fm
  ON fm.faculty_id = i.faculty_id
JOIN course as c
  ON c.course_id = s.course_id

ORDER BY faculty_id, course_name;


/*1- unilerde kaç department , ve kaç ders var (3 tablo)*/
SELECT u.uni_name,
       COUNT(DISTINCT d.dept_id) AS total_departments,
       COUNT(c.course_id)        AS total_courses
FROM university as u
JOIN department as d ON u.uni_id = d.uni_id
LEFT JOIN course AS c ON d.dept_id = c.dept_id
GROUP BY u.uni_name; 

/*2- en fazla sectiona giren öğretmenler listesi*/
SELECT f.firstname,
       f.lastname,
       COUNT(s.section_id) AS total_sections
FROM faculty_members AS f
JOIN instructor AS i 
ON f.faculty_id = i.faculty_id
JOIN section AS s 
ON i.faculty_id = s.instructor_id
GROUP BY f.firstname, f.lastname
ORDER BY total_sections DESC; 
/* 3-kaç student var (host ya da home)*-----------------------*/
SELECT
  c.course_id,
  c.course_name,
  COUNT(DISTINCT er.student_id) AS student_count
FROM enrollment AS e
JOIN enrolls AS er
  ON er.enrollment_id = e.enrollment_id
JOIN course AS c
  ON c.course_id = e.home_course_id
   OR c.course_id = e.host_course_id
GROUP BY c.course_id, c.course_name
ORDER BY student_count DESC;



/*4-prereq isimleri ve üniler */
SELECT

    oc.course_id          AS offered_course_id,
    oc.course_name        AS offered_course_name,
    ou.uni_id             AS offered_uni_id,
    ou.uni_name           AS offered_university,

  
    pc.course_id          AS prerequisite_course_id,
    pc.course_name        AS prerequisite_course_name,
    pu.uni_id             AS prerequisite_uni_id,
    pu.uni_name           AS prerequisite_university
FROM prerequisites AS p

JOIN course AS oc 
     ON p.offer_course_id = oc.course_id
JOIN department AS od 
     ON oc.dept_id = od.dept_id
JOIN university AS ou 
     ON od.uni_id = ou.uni_id

JOIN course AS pc 
     ON p.preq_course_id = pc.course_id
JOIN department AS pd 
     ON pc.dept_id = pd.dept_id
JOIN university AS pu 
     ON pd.uni_id = pu.uni_id

ORDER BY 
    ou.uni_id,
    oc.course_name; 

/*5-öğretmenlerin ünileri-----------------------------------------------------*/
SELECT DISTINCT
  fm.faculty_id,
  fm.firstname,
  fm.lastname,
  d.uni_id
FROM faculty_members AS fm

LEFT JOIN lecturer AS l
  ON l.faculty_id = fm.faculty_id
LEFT JOIN instructor AS i
  ON i.faculty_id = l.faculty_id
LEFT JOIN section s_i
  ON s_i.instructor_id = i.faculty_id

LEFT JOIN assistant AS a
  ON a.faculty_id = fm.faculty_id
LEFT JOIN assist AS asst
  ON asst.faculty_id = a.faculty_id
LEFT JOIN section AS s_a
  ON s_a.section_id = asst.section_id


LEFT JOIN course AS c
  ON c.course_id = COALESCE(s_i.course_id, s_a.course_id)
LEFT JOIN department AS d
  ON d.dept_id = c.dept_id

ORDER BY fm.faculty_id; 

/*6-öğrencilerin ünileri ve erasmus için aldıkları dersler-------------*/
SELECT
  s.student_id,
  s.firstname || ' ' || s.lastname AS student_name,
  
  su.uni_id   AS source_uni_id,
  su.uni_name AS source_uni_name,

  s.target_uni_id,
  tu.uni_name AS target_uni_name,

  el.enrollment_id,

  el.home_course_id,
  hc.course_name AS home_course_name,

  el.host_course_id,
  tc.course_name AS host_course_name,

  eq.match_ratio,
  eq.match_type

FROM student AS s
JOIN university AS su
  ON su.uni_id = s.source_uni_id

LEFT JOIN university AS tu
  ON tu.uni_id = s.target_uni_id

LEFT JOIN enrolls AS er
  ON er.student_id = s.student_id

LEFT JOIN enrollment AS el
  ON el.enrollment_id = er.enrollment_id

LEFT JOIN course AS hc
  ON hc.course_id = el.home_course_id

LEFT JOIN course AS tc
  ON tc.course_id = el.host_course_id

LEFT JOIN equivalency AS eq
  ON eq.home_course_id = el.home_course_id
 AND eq.host_course_id = el.host_course_id

ORDER BY s.student_id, el.enrollment_id;

/*7)** tek ders alan öğrenciler ------*/
SELECT
  s.student_id,
  s.firstname || ' ' || s.lastname AS student_name,
  c.course_id,
  c.course_name
FROM enrolls er
JOIN enrollment en ON en.enrollment_id = er.enrollment_id
JOIN student s ON s.student_id = er.student_id
JOIN course c ON c.course_id = en.home_course_id
WHERE en.host_course_id IS NULL;
/*8------------------full equivalency olan dersler*/
SELECT
  hc.course_name AS home_course,
  tc.course_name AS host_course,
  e.match_ratio
FROM equivalency as e
JOIN course hc ON hc.course_id = e.home_course_id
JOIN course tc ON tc.course_id = e.host_course_id
WHERE e.match_type = 'FULL'
ORDER BY e.match_ratio DESC;

/*9-DERSLERIN KAÇ TANE TOPİCİ VAR*/
SELECT
  c.course_name,
  COUNT(ct.week_number) AS topic_count
FROM course AS c
LEFT JOIN course_topics AS ct
  ON ct.course_id = c.course_id
GROUP BY c.course_name;

/*10-ünideki öğrenci sayısı-----------------------------*/
SELECT
  u.uni_id,
  u.uni_name,
  COUNT(s.student_id) AS student_count
FROM university AS u
LEFT JOIN student AS s
  ON s.source_uni_id = u.uni_id
GROUP BY u.uni_id, u.uni_name
ORDER BY student_count DESC;

/*----------TEST---------------*/



begin;
update course -- simple update, cascade olduğu için tbalolarda güncellenir
set course_id=99
where course_id=11;
rollback;

begin;
update course
set course_lang= '100% English' -- update
where course_lang='English';
select * from course;
commit;

insert into student values --simple insert
(88,'Özgür','Say',2,3),
(99,'Ali Ekrem','Yapıcı',2,1);

select * from student;

delete from student --simple delete
where student_id=88
or firstname='Ali Ekrem';

begin;

select *
from equivalency
order by match_ratio desc;

select * from similarity_weights;
update similarity_weights --ağrılıklar değişirse otomaitk yeniden hesaplanıyor
set topic_weight=0.05;

update course --içerik değişirse yeniden hesaplanır
set course_name='test'
where course_id=11;
rollback;

/*course silmeye çalışma*/
begin;
select * from course;
delete from course
where course_id=24;

ALTER TABLE enrollment 
DROP CONSTRAINT fk_enr_equivalency;

rollback;

/*öğrenciye başka üniversiteden ders eklemeye çalışma*/
select * from student
where source_uni_id=1;

select * from enrolls;
insert into enrolls values (2,12); -- trigger

/*enrollmenta low ikili eklemeye çalışma*/
select * from equivalency
where match_type='LOW';

insert into enrollment values(90,11,36); --LOW olduğu için hata


select * from equivalency order by match_ratio desc;



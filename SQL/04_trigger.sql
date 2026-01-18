--equivalency table otomatik type atama
CREATE OR REPLACE FUNCTION trg_equivalency_set_match_type()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
  NEW.match_type := --new , triggerın işleidği satırın yeni hali
    CASE
      WHEN NEW.match_ratio >= 80 THEN 'FULL'
      WHEN NEW.match_ratio >= 60 THEN 'PARTIAL'
      ELSE 'LOW'
    END;

  RETURN NEW;
END;
$$;

CREATE TRIGGER equivalency_match_type_auto
BEFORE INSERT OR UPDATE OF match_ratio
ON equivalency
FOR EACH ROW
EXECUTE FUNCTION trg_equivalency_set_match_type(); /*bu match type için */
/*tüm equivalency tableı günceller. ağırlık tablosu değişirse------------*/
CREATE OR REPLACE FUNCTION refresh_all_equivalencies() --tüm course için yeniden equivalency hesaplama
RETURNS void
LANGUAGE plpgsql
AS $$
DECLARE
  i RECORD; -- DEĞİŞKEN TANIMLADIK DÖNGÜ İÇİn
BEGIN
  FOR i IN (SELECT course_id FROM course) LOOP
    PERFORM refresh_equivalency_for_course(i.course_id);
  END LOOP;
END;
$$;

CREATE OR REPLACE FUNCTION trg_weights_update_equivalency()
-- trigger sadece trigger döndüren fonk çağırır onun için bu var
RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
  PERFORM refresh_all_equivalencies();
  RETURN NEW;
END;
$$;

CREATE TRIGGER trg_weights_update -- ağırlık değişirse çalışcak
AFTER UPDATE ON similarity_weights
FOR EACH STATEMENT
EXECUTE FUNCTION trg_weights_update_equivalency();



/*low değerler enrollmentta atanamaz--------------*/

CREATE OR REPLACE FUNCTION trg_enrollment_check_equivalency()
RETURNS trigger
LANGUAGE plpgsql
AS $$
DECLARE
  v_match_type VARCHAR; --değişken tanımladık
BEGIN
  IF NEW.host_course_id IS NULL THEN --insert edilen tuple'da host course yoksa direkt oluştur. low koşulu yok
    RETURN NEW;
  END IF;

  SELECT match_type
  INTO v_match_type
  FROM equivalency
  WHERE home_course_id = NEW.home_course_id
    AND host_course_id = NEW.host_course_id;

  IF v_match_type IS NULL OR v_match_type = 'LOW' THEN
    RAISE EXCEPTION
      'LOW or invalid equivalency cannot be assigned';
  END IF;

  RETURN NEW;
END;
$$;

--enrollment tablosu için check edilecek
CREATE TRIGGER trg_enrollment_check_equivalency 
BEFORE INSERT OR UPDATE OF home_course_id, host_course_id
ON enrollment
FOR EACH ROW
EXECUTE FUNCTION trg_enrollment_check_equivalency();

/* öğrenciye kendi üniversitesinden ders atanabilir. diğer ünilerden atanamaz kontolu*/

CREATE OR REPLACE FUNCTION trg_enrollment_check_home_course_uni()
RETURNS trigger
LANGUAGE plpgsql
AS $$
DECLARE
  v_course_uni  INTEGER;
  v_source_uni  INTEGER;
BEGIN
  SELECT d.uni_id
  INTO v_course_uni
  FROM course c
  JOIN department d ON d.dept_id = c.dept_id
  WHERE c.course_id = NEW.home_course_id;

  SELECT s.source_uni_id
  INTO v_source_uni
  FROM enrolls e
  JOIN student s ON s.student_id = e.student_id
  WHERE e.enrollment_id = NEW.enrollment_id;

  IF v_course_uni <> v_source_uni THEN  --<> bu != ile aynı
    RAISE EXCEPTION
      'Home course does not belong to student''s source university';
  END IF;

  RETURN NEW;
END;
$$;

CREATE TRIGGER trg_enrollment_check_home_course_uni
BEFORE INSERT OR UPDATE OF home_course_id
ON enrollment
FOR EACH ROW
EXECUTE FUNCTION trg_enrollment_check_home_course_uni();



/* öğrenci erasmusa gideceği üniden host ders alabilir. onun kontrolu*/
CREATE OR REPLACE FUNCTION trg_enrolls_check_host_course_uni()
RETURNS trigger
LANGUAGE plpgsql
AS $$
DECLARE
  v_course_uni INTEGER;
  v_target_uni INTEGER;
BEGIN
  -- enrollment'taki host_course_id NULL ise kontrol yok
  SELECT d.uni_id
  INTO v_course_uni
  FROM enrollment el
  JOIN course c     ON c.course_id = el.host_course_id
  JOIN department d ON d.dept_id = c.dept_id
  WHERE el.enrollment_id = NEW.enrollment_id
    AND el.host_course_id IS NOT NULL;

  IF v_course_uni IS NULL THEN
    RETURN NEW;
  END IF;

  -- öğrencinin target üniversitesi
  SELECT target_uni_id
  INTO v_target_uni
  FROM student
  WHERE student_id = NEW.student_id;

  IF v_course_uni <> v_target_uni THEN
    RAISE EXCEPTION
      'Host course does not belong to student''s target university';
  END IF;

  RETURN NEW;
END;
$$;


CREATE TRIGGER trg_enrolls_check_host_course_uni
BEFORE INSERT OR UPDATE
ON enrolls
FOR EACH ROW
EXECUTE FUNCTION trg_enrolls_check_host_course_uni();


/*-------------*/
CREATE OR REPLACE FUNCTION refresh_equivalency_for_course(
  p_course_id INTEGER
)
RETURNS void
LANGUAGE plpgsql
AS $$
BEGIN
  UPDATE equivalency e
  SET
    match_ratio = sub.match_ratio --alt sorgudan gelen değerle güncelle
  FROM (
    SELECT
      LEAST(home_course_id, host_course_id)  AS c_low,
      GREATEST(home_course_id, host_course_id) AS c_high,
      round(
        compute_course_similarity_full(
          LEAST(home_course_id, host_course_id),
          GREATEST(home_course_id, host_course_id)
        ),2) AS match_ratio
    FROM equivalency
    WHERE home_course_id = p_course_id
       OR host_course_id = p_course_id
    GROUP BY c_low, c_high
  ) as sub
  WHERE
    LEAST(e.home_course_id, e.host_course_id) = sub.c_low
    AND GREATEST(e.home_course_id, e.host_course_id) = sub.c_high;
END;
$$;

CREATE OR REPLACE FUNCTION trg_course_update_equivalency() --bi trigger sadece return trigger çağırabilir
RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
  PERFORM refresh_equivalency_for_course(NEW.course_id);
  RETURN NEW;
END;
$$;

CREATE TRIGGER trg_course_update_equivalency
AFTER UPDATE OF course_name, course_description, course_goal, acts
ON course
FOR EACH ROW
EXECUTE FUNCTION trg_course_update_equivalency();


/*-------------------*/
CREATE OR REPLACE FUNCTION trg_learning_outcomes_update_equivalency()
RETURNS trigger
LANGUAGE plpgsql
AS $$
DECLARE
  v_course_id INTEGER;
BEGIN
  v_course_id := COALESCE(NEW.course_id, OLD.course_id);
  PERFORM refresh_equivalency_for_course(v_course_id);
  RETURN COALESCE(NEW, OLD);
END;
$$;


CREATE TRIGGER trg_learning_outcomes_equivalency_refresh
AFTER INSERT OR UPDATE OR DELETE
ON learning_outcomes
FOR EACH ROW
EXECUTE FUNCTION trg_learning_outcomes_update_equivalency();

/*--------------------------------*/

CREATE OR REPLACE FUNCTION trg_course_topics_update_equivalency() 
RETURNS trigger
LANGUAGE plpgsql
AS $$
DECLARE
  v_course_id INTEGER;
BEGIN
  v_course_id := COALESCE(NEW.course_id, OLD.course_id);
  PERFORM refresh_equivalency_for_course(v_course_id);
  RETURN COALESCE(NEW, OLD); 
END;
$$;

select *
from equivalency
order by match_ratio desc;

CREATE TRIGGER trg_course_topics_equivalency_refresh
AFTER INSERT OR UPDATE OR DELETE
ON course_topics
FOR EACH ROW
EXECUTE FUNCTION trg_course_topics_update_equivalency();



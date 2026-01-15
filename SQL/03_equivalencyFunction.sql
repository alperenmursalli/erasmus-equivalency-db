CREATE EXTENSION IF NOT EXISTS pg_trgm; --similarity fonksiyonu için trigram extensionu

CREATE OR REPLACE VIEW course_outcome_text AS /*outcomeları tek bir meitn haline getiriyo */
SELECT
  course_id,
  string_agg(outcome_text, ' ') AS outcome_text
FROM learning_outcomes
GROUP BY course_id;

SELECT outcome_text
FROM course_outcome_text
where course_id=11;


select *
from learning_outcomes;



CREATE OR REPLACE VIEW course_topic_text AS /*bazı topicler null olduğu için coalesce nulları boş 
stringe ' ' çevirir. string_agg arada boşluk bırakarak tek bir metin haline getiriyo*/
SELECT
  course_id,
  string_agg(topic_name || ' ' || COALESCE(topic_brief, ''),' ') AS topic_text --coalesce null olmayan değeri tutar
FROM course_topics
GROUP BY course_id;


CREATE TABLE similarity_weights (
  name_weight    NUMERIC,
  desc_weight    NUMERIC,
  goal_weight    NUMERIC,
  outcome_weight NUMERIC,
  topic_weight   NUMERIC,
  acts_weight    NUMERIC
);

INSERT INTO similarity_weights VALUES
(0.30, 0.15, 0.15, 0.15, 0.15, 0.10);


CREATE OR REPLACE FUNCTION compute_course_similarity_full(p_course_id_1 INTEGER,p_course_id_2 INTEGER)
--bunlar parameter, yani dışarıdan girilen değerler
RETURNS NUMERIC
LANGUAGE plpgsql
AS $$
DECLARE
 
  v_name_score    NUMERIC := 0;
  v_desc_score    NUMERIC := 0;
  v_goal_score    NUMERIC := 0;
  v_outcome_score NUMERIC := 0;
  v_topic_score   NUMERIC := 0;
  v_acts_score    NUMERIC := 0;

  -- ağırlıklar
  w_name    NUMERIC;
  w_desc    NUMERIC;
  w_goal    NUMERIC;
  w_outcome NUMERIC;
  w_topic   NUMERIC;
  w_acts    NUMERIC;

  v_final_score NUMERIC;

  v_outcome_text_1 TEXT;
  v_outcome_text_2 TEXT;
  v_topic_text_1   TEXT;
  v_topic_text_2   TEXT;
BEGIN

  SELECT
    name_weight,
    desc_weight,
    goal_weight,
    outcome_weight,
    topic_weight,
    acts_weight
  INTO
    w_name, w_desc, w_goal, w_outcome, w_topic, w_acts
  FROM similarity_weights
  LIMIT 1;

  SELECT similarity(lower(c1.course_name), lower(c2.course_name))
  INTO v_name_score
  FROM course c1, course c2
  WHERE c1.course_id = p_course_id_1
    AND c2.course_id = p_course_id_2;


  SELECT ts_rank(
  /*null değerler boş stirnge çevriliyo ve kelimeler
			köklerine indirgenip bağlaçlar atılıyo. konum tutluyo
		   "Introduction to Algorithms" --> Introduct:1 algorithm:3
		   sağdaki parametrenin içindeki kelimeler soldaki parametrenin içinde ne kadar geçiyor*/
           to_tsvector('english', coalesce(c1.course_description, '')),
           plainto_tsquery('english', coalesce(c2.course_description, ''))
         )
  INTO v_desc_score
  FROM course c1, course c2
  WHERE c1.course_id = p_course_id_1
    AND c2.course_id = p_course_id_2;

  SELECT ts_rank(
           to_tsvector('english', coalesce(c1.course_goal, '')),
           plainto_tsquery('english', coalesce(c2.course_goal, ''))
         )
  INTO v_goal_score
  FROM course c1, course c2
  WHERE c1.course_id = p_course_id_1
    AND c2.course_id = p_course_id_2;


  SELECT outcome_text INTO v_outcome_text_1
  FROM course_outcome_text
  WHERE course_id = p_course_id_1;

  SELECT outcome_text INTO v_outcome_text_2
  FROM course_outcome_text
  WHERE course_id = p_course_id_2;

  v_outcome_score :=
    ts_rank(
      to_tsvector('english', coalesce(v_outcome_text_1, '')),
      plainto_tsquery('english', coalesce(v_outcome_text_2, ''))
    );


  SELECT topic_text INTO v_topic_text_1
  FROM course_topic_text
  WHERE course_id = p_course_id_1;

  SELECT topic_text INTO v_topic_text_2
  FROM course_topic_text
  WHERE course_id = p_course_id_2;

  v_topic_score :=
    ts_rank(
      to_tsvector('english', coalesce(v_topic_text_1, '')),
      plainto_tsquery('english', coalesce(v_topic_text_2, ''))
    );

  SELECT
    CASE
      WHEN abs(c1.acts - c2.acts) <= 1 THEN 1
      WHEN abs(c1.acts - c2.acts) <= 2 THEN 0.5
      ELSE 0
    END
  INTO v_acts_score
  FROM course c1, course c2
  WHERE c1.course_id = p_course_id_1
    AND c2.course_id = p_course_id_2;

  v_final_score :=
    (
      w_name    * v_name_score +
      w_desc    * v_desc_score +
      w_goal    * v_goal_score +
      w_outcome * v_outcome_score +
      w_topic   * v_topic_score +
      w_acts    * v_acts_score
    ) * 100;

  IF v_name_score > 0.4 THEN
    v_final_score := LEAST(v_final_score + 10, 100);
  END IF;

  RETURN round(v_final_score, 2);
END;
$$;


INSERT INTO equivalency (home_course_id,host_course_id,match_ratio)
SELECT
  c1.course_id,
  c2.course_id,
  r.ratio
FROM course AS c1
JOIN department AS d1 ON d1.dept_id = c1.dept_id
JOIN department AS d2 ON d2.uni_id <> d1.uni_id
JOIN course AS c2 ON c2.dept_id = d2.dept_id
 -- lateral ile c2ye erişip parametre olarka kullanbiliyoz
CROSS JOIN LATERAL (SELECT compute_course_similarity_full(c1.course_id, c2.course_id) AS ratio) as r
WHERE c1.course_id < c2.course_id

UNION ALL

SELECT
  c2.course_id,
  c1.course_id,
  r.ratio
FROM course c1
JOIN department d1 ON d1.dept_id = c1.dept_id
JOIN department d2 ON d2.uni_id <> d1.uni_id
JOIN course c2 ON c2.dept_id = d2.dept_id
CROSS JOIN LATERAL (SELECT compute_course_similarity_full(c1.course_id, c2.course_id) AS ratio) as r
WHERE c1.course_id < c2.course_id;


SELECT *
FROM equivalency
WHERE home_course_id = 11
ORDER BY match_ratio DESC;


select *
from enrollment;






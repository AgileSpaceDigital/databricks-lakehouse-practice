-- Databricks notebook source
CREATE OR REPLACE TABLE admissions_mvp.analytics.admissions360 AS

WITH latest_stage AS (

    SELECT
        application_id,
        stage_name AS latest_stage,
        stage_outcome,

        ROW_NUMBER() OVER (
            PARTITION BY application_id
            ORDER BY stage_sequence DESC,
                     entered_date DESC
        ) AS rn

    FROM admissions_mvp.curated.application_stage_event
)

SELECT

    a.application_id,
    a.application_date,
    a.current_status,

    ap.applicant_id,
    ap.first_name,
    ap.last_name,
    ap.gender,
    ap.email,
    ap.phone,

    p.program_id,
    p.program_name,
    p.school,
    p.degree_level,

    c.campus_id,
    c.campus_name,

    i.intake_id,
    i.intake_name,
    i.academic_term,
    i.academic_year,

    ls.latest_stage,
    ls.stage_outcome,

    r.review_id,
    r.review_status,

    o.offer_id,
    o.offer_status,
    o.offer_date,

    e.enrollment_id,
    e.enrollment_status,
    e.enrollment_date,

    CURRENT_TIMESTAMP() AS load_timestamp

FROM admissions_mvp.curated.application a

LEFT JOIN admissions_mvp.curated.applicant ap
    ON a.applicant_id = ap.applicant_id

LEFT JOIN admissions_mvp.curated.program p
    ON a.program_id = p.program_id

LEFT JOIN admissions_mvp.curated.campus c
    ON a.campus_id = c.campus_id

LEFT JOIN admissions_mvp.curated.intake i
    ON a.intake_id = i.intake_id

LEFT JOIN latest_stage ls
    ON a.application_id = ls.application_id
   AND ls.rn = 1

LEFT JOIN admissions_mvp.curated.review r
    ON a.application_id = r.application_id

LEFT JOIN admissions_mvp.curated.offer o
    ON a.application_id = o.application_id

LEFT JOIN admissions_mvp.curated.enrollment e
    ON o.offer_id = e.offer_id

-- COMMAND ----------


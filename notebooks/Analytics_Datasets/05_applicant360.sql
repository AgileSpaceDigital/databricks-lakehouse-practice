-- Databricks notebook source
CREATE OR REPLACE TABLE admissions_mvp.analytics.applicant360 AS

WITH applicant_metrics AS (

    SELECT

        ap.applicant_id,

        COUNT(DISTINCT a.application_id) AS total_applications,

        COUNT(DISTINCT ca.communication_id) AS total_communications,

        COUNT(DISTINCT o.offer_id) AS total_offers,

        COUNT(DISTINCT e.enrollment_id) AS total_enrollments,

        MAX(a.application_date) AS latest_application_date

    FROM admissions_mvp.curated.applicant ap

    LEFT JOIN admissions_mvp.curated.application a
        ON ap.applicant_id = a.applicant_id

    LEFT JOIN admissions_mvp.curated.communication_activity ca
        ON ap.applicant_id = ca.applicant_id

    LEFT JOIN admissions_mvp.curated.offer o
        ON a.application_id = o.application_id

    LEFT JOIN admissions_mvp.curated.enrollment e
        ON o.offer_id = e.offer_id

    GROUP BY
        ap.applicant_id
)

SELECT

    ap.applicant_id,
    ap.first_name,
    ap.last_name,
    ap.gender,
    ap.email,
    ap.phone,
    ap.created_date,

    g.country,
    g.state,
    g.city,

    am.total_applications,
    am.total_communications,
    am.total_offers,
    am.total_enrollments,
    am.latest_application_date,

    CASE
        WHEN am.total_enrollments > 0 THEN 'Enrolled'
        WHEN am.total_offers > 0 THEN 'Offer Received'
        WHEN am.total_applications > 0 THEN 'Applied'
        ELSE 'Prospect'
    END AS applicant_status,

    CURRENT_TIMESTAMP() AS load_timestamp

FROM admissions_mvp.curated.applicant ap

LEFT JOIN admissions_mvp.curated.geography g
    ON ap.geography_id = g.geography_id

LEFT JOIN applicant_metrics am
    ON ap.applicant_id = am.applicant_id;

-- COMMAND ----------

SELECT *
FROM admissions_mvp.analytics.applicant360
LIMIT 100;

-- COMMAND ----------


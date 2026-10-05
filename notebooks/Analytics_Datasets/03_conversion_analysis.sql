-- Databricks notebook source
CREATE OR REPLACE TABLE admissions_mvp.analytics.conversion_analysis AS

WITH conversion_base AS (

    SELECT

        a.program_id,
        p.program_name,

        a.campus_id,
        c.campus_name,

        a.intake_id,
        i.intake_name,

        COUNT(DISTINCT a.application_id) AS total_applications,

        COUNT(DISTINCT CASE
            WHEN ase.stage_name = 'Under Review'
            THEN a.application_id
        END) AS review_count,

        COUNT(DISTINCT CASE
            WHEN ase.stage_name = 'Offer Made'
            THEN a.application_id
        END) AS offer_count,

        COUNT(DISTINCT CASE
            WHEN ase.stage_name = 'Enrolled'
            THEN a.application_id
        END) AS enrolled_count

    FROM admissions_mvp.curated.application a

    LEFT JOIN admissions_mvp.curated.application_stage_event ase
        ON a.application_id = ase.application_id

    LEFT JOIN admissions_mvp.curated.program p
        ON a.program_id = p.program_id

    LEFT JOIN admissions_mvp.curated.campus c
        ON a.campus_id = c.campus_id

    LEFT JOIN admissions_mvp.curated.intake i
        ON a.intake_id = i.intake_id

    GROUP BY

        a.program_id,
        p.program_name,

        a.campus_id,
        c.campus_name,

        a.intake_id,
        i.intake_name

)

SELECT

    program_id,
    program_name,

    campus_id,
    campus_name,

    intake_id,
    intake_name,

    total_applications,
    review_count,
    offer_count,
    enrolled_count,

    ROUND(
    TRY_DIVIDE(
        review_count * 100.0,
        total_applications
            ),
        2
    ) AS application_to_review_pct,

    ROUND(
    TRY_DIVIDE(
        offer_count * 100.0,
        review_count
            ),
        2
    ) AS review_to_offer_pct,

    ROUND(
    TRY_DIVIDE(
        enrolled_count * 100.0,
        offer_count
            ),
        2
    ) AS offer_to_enrollment_pct,

    ROUND(
    TRY_DIVIDE(
        enrolled_count * 100.0,
        total_applications
            ),
        2
    ) AS overall_conversion_pct,

    CURRENT_TIMESTAMP() AS load_timestamp

FROM conversion_base;

-- COMMAND ----------

SELECT *
FROM admissions_mvp.analytics.conversion_analysis
ORDER BY overall_conversion_pct DESC;

-- COMMAND ----------


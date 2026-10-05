-- Databricks notebook source
CREATE OR REPLACE TABLE admissions_mvp.analytics.stage_dropoff_analysis AS

WITH stage_counts AS (

    SELECT
        a.program_id,
        a.campus_id,
        a.intake_id,

        ds.stage_sequence,
        ds.stage_name,

        COUNT(DISTINCT ase.application_id) AS application_count

    FROM admissions_mvp.curated.application_stage_event ase

    INNER JOIN admissions_mvp.curated.application a
        ON ase.application_id = a.application_id

    INNER JOIN admissions_mvp.curated.dim_stage ds
        ON ase.stage_name = ds.stage_name

    WHERE ds.stage_name IN (
        'Submitted',
        'Under Review',
        'Qualified',
        'Offer Made',
        'Offer Accepted',
        'Enrolled'
    )

    GROUP BY
        a.program_id,
        a.campus_id,
        a.intake_id,
        ds.stage_sequence,
        ds.stage_name
),

dropoff_base AS (

    SELECT
        *,
        LAG(application_count) OVER (
            PARTITION BY
                program_id,
                campus_id,
                intake_id
            ORDER BY stage_sequence
        ) AS previous_stage_count

    FROM stage_counts
)

SELECT
    program_id,
    campus_id,
    intake_id,

    stage_sequence,
    stage_name,

    application_count,
    previous_stage_count,

    ROUND(
        (application_count * 100.0)
        / previous_stage_count,
        2
    ) AS conversion_pct,

    ROUND(
        100 -
        (
            (application_count * 100.0)
            / previous_stage_count
        ),
        2
    ) AS dropoff_pct,

    CURRENT_TIMESTAMP() AS load_timestamp

FROM dropoff_base;

-- COMMAND ----------

SELECT *
FROM admissions_mvp.analytics.stage_dropoff_analysis
LIMIT 100;

-- COMMAND ----------


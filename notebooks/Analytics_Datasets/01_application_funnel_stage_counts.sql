-- Databricks notebook source
WITH stage_counts AS (

SELECT
    ds.stage_sequence AS stage_order,
    ase.stage_name,
    COUNT(DISTINCT ase.application_id) AS application_count

FROM admissions_mvp.curated.application_stage_event ase

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
    ds.stage_sequence,
    ase.stage_name

)

SELECT *
FROM stage_counts
ORDER BY stage_order;

-- COMMAND ----------

WITH stage_counts AS (

    SELECT
        ds.stage_sequence AS stage_order,
        ase.stage_name,
        COUNT(DISTINCT ase.application_id) AS application_count

    FROM admissions_mvp.curated.application_stage_event ase

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
        ds.stage_sequence,
        ase.stage_name
),

funnel_base AS (

    SELECT
        stage_order,
        stage_name,
        application_count,

        LAG(application_count)
        OVER (
            ORDER BY stage_order
        ) AS previous_stage_count

    FROM stage_counts

)

SELECT *
FROM funnel_base
ORDER BY stage_order;

-- COMMAND ----------

WITH stage_counts AS (

    SELECT
        ds.stage_sequence AS stage_order,
        ase.stage_name,
        COUNT(DISTINCT ase.application_id) AS application_count

    FROM admissions_mvp.curated.application_stage_event ase

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
        ds.stage_sequence,
        ase.stage_name
),

funnel_base AS (

    SELECT
        stage_order,
        stage_name,
        application_count,

        LAG(application_count)
            OVER (ORDER BY stage_order)
            AS previous_stage_count

    FROM stage_counts

)

SELECT

    stage_order,
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
    ) AS dropoff_pct

FROM funnel_base
ORDER BY stage_order;

-- COMMAND ----------

CREATE OR REPLACE TABLE admissions_mvp.analytics.application_funnel AS

WITH stage_counts AS (

    SELECT
        ds.stage_sequence AS stage_order,
        ase.stage_name,
        COUNT(DISTINCT ase.application_id) AS application_count

    FROM admissions_mvp.curated.application_stage_event ase

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
        ds.stage_sequence,
        ase.stage_name
),

funnel_base AS (

    SELECT
        stage_order,
        stage_name,
        application_count,

        LAG(application_count)
            OVER (ORDER BY stage_order)
            AS previous_stage_count

    FROM stage_counts

)

SELECT

    stage_order,
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

FROM funnel_base;

-- COMMAND ----------

SELECT *
FROM admissions_mvp.analytics.application_funnel
ORDER BY stage_order;

-- COMMAND ----------


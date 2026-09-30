-- Databricks notebook source
SELECT * FROM admissions_mvp.curated.applicant;

-- COMMAND ----------

SELECT * FROM admissions_mvp.curated.application;

-- COMMAND ----------

SELECT * FROM admissions_mvp.curated.campus;

-- COMMAND ----------

SELECT * FROM admissions_mvp.curated.counselor;

-- COMMAND ----------

SELECT * FROM admissions_mvp.curated.application_stage_event
LIMIT 10;

-- COMMAND ----------

SELECT * FROM admissions_mvp.curated.dim_stage;

-- COMMAND ----------

SELECT * FROM admissions_mvp.curated.enrollment;

-- COMMAND ----------

SELECT * FROM admissions_mvp.curated.geography;

-- COMMAND ----------

SELECT geography_name, city from admissions_mvp.curated.geography where geography_name != city;

-- COMMAND ----------

SELECT * FROM admissions_mvp.curated.offer;

-- COMMAND ----------

SELECT * FROM admissions_mvp.curated.communication_activity;

-- COMMAND ----------


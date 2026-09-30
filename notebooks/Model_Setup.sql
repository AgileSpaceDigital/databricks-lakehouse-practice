-- Databricks notebook source
CREATE CATALOG IF NOT EXISTS admissions_mvp
  COMMENT 'Catalog for the admissions MVP project';

-- COMMAND ----------

CREATE SCHEMA IF NOT EXISTS admissions_mvp.raw;
CREATE SCHEMA IF NOT EXISTS admissions_mvp.curated;
CREATE SCHEMA IF NOT EXISTS admissions_mvp.analytics;

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS admissions_mvp.curated.applicant (
  applicant_id   BIGINT       NOT NULL,
  first_name      STRING,
  last_name       STRING,
  gender         STRING,
  email          STRING,
  phone          STRING,
  geography_id   BIGINT,
  created_date   TIMESTAMP,
  CONSTRAINT applicant_pk PRIMARY KEY (applicant_id)
)
  COMMENT 'Raw applicant data for the admissions MVP project';

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS admissions_mvp.curated.program (
    program_id   BIGINT NOT NULL,
    program_name STRING,
    school       STRING,
    degree_level STRING,
    CONSTRAINT program_pk PRIMARY KEY (program_id)
)
    COMMENT 'Program reference data for the admissions MVP project';

CREATE TABLE IF NOT EXISTS admissions_mvp.curated.campus (
    campus_id BIGINT NOT NULL,
    campus_name STRING,
    state STRING,
    CONSTRAINT campus_pk PRIMARY KEY (campus_id)
);

CREATE TABLE IF NOT EXISTS admissions_mvp.curated.intake (
    intake_id BIGINT NOT NULL,
    intake_name STRING,
    academic_term STRING,
    academic_year STRING,
    CONSTRAINT intake_pk PRIMARY KEY (intake_id)
);
CREATE TABLE IF NOT EXISTS admissions_mvp.curated.geography (
    geography_id BIGINT NOT NULL,
    geography_name STRING,
    state STRING,
    CONSTRAINT geography_pk PRIMARY KEY (geography_id)
);


CREATE TABLE IF NOT EXISTS admissions_mvp.curated.dim_stage (
    stage_id BIGINT NOT NULL,
    stage_name STRING,
    stage_sequence INT,
    CONSTRAINT stage_pk PRIMARY KEY (stage_id)
);



-- COMMAND ----------

CREATE TABLE IF NOT EXISTS admissions_mvp.curated.application (
    application_id BIGINT NOT NULL,
    applicant_id   BIGINT,
    program_id     BIGINT,
    campus_id      BIGINT,
    intake_id      BIGINT,
    application_date TIMESTAMP,
    current_status STRING,
    CONSTRAINT application_pk PRIMARY KEY (application_id),
    CONSTRAINT application_applicant_fk FOREIGN KEY (applicant_id)
        REFERENCES admissions_mvp.curated.applicant (applicant_id),
    CONSTRAINT application_program_fk FOREIGN KEY (program_id)
        REFERENCES admissions_mvp.curated.program (program_id),
    CONSTRAINT application_campus_fk FOREIGN KEY (campus_id)
        REFERENCES admissions_mvp.curated.campus (campus_id),
    CONSTRAINT application_intake_fk FOREIGN KEY (intake_id)
        REFERENCES admissions_mvp.curated.intake (intake_id)
)
    COMMENT 'Application data linking applicants to programs, campuses, and intakes for the admissions MVP project';


-- COMMAND ----------

CREATE TABLE IF NOT EXISTS admissions_mvp.curated.application_stage_event (
    stage_history_id BIGINT      NOT NULL,
    application_id   BIGINT,
    stage_name       STRING,
    stage_sequence   INT,
    entered_date     TIMESTAMP,
    exited_date      TIMESTAMP,
    stage_outcome    STRING,
    duration_days    INT,
    CONSTRAINT application_stage_event_pk PRIMARY KEY (stage_history_id),
    CONSTRAINT application_stage_event_fk FOREIGN KEY (application_id)
        REFERENCES admissions_mvp.curated.application (application_id)
)
    COMMENT 'Application stage event history tracking each stage an application moves through';

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS admissions_mvp.curated.review (
    review_id          BIGINT      NOT NULL,
    application_id     BIGINT,
    review_status      STRING,
    review_start_date  TIMESTAMP,
    review_end_date    TIMESTAMP,
    CONSTRAINT review_pk PRIMARY KEY (review_id),
    CONSTRAINT review_application_fk FOREIGN KEY (application_id)
        REFERENCES admissions_mvp.curated.application (application_id)
)
    COMMENT 'Application review data for the admissions MVP project';

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS admissions_mvp.curated.offer (
    offer_id        BIGINT      NOT NULL,
    application_id  BIGINT,
    offer_date      TIMESTAMP,
    offer_status    STRING,
    CONSTRAINT offer_pk PRIMARY KEY (offer_id),
    CONSTRAINT offer_application_fk FOREIGN KEY (application_id)
        REFERENCES admissions_mvp.curated.application (application_id)
)
    COMMENT 'Offer data linked to applications for the admissions MVP project';

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS admissions_mvp.curated.enrollment (
    enrollment_id      BIGINT      NOT NULL,
    offer_id           BIGINT,
    enrollment_date    TIMESTAMP,
    enrollment_status  STRING,
    CONSTRAINT enrollment_pk PRIMARY KEY (enrollment_id),
    CONSTRAINT enrollment_offer_fk FOREIGN KEY (offer_id)
        REFERENCES admissions_mvp.curated.offer (offer_id)
)
    COMMENT 'Enrollment data linked to offers for the admissions MVP project';

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS admissions_mvp.curated.communication_activity (
    communication_id BIGINT      NOT NULL,
    applicant_id     BIGINT,
    activity_type    STRING,
    activity_date    TIMESTAMP,
    direction        STRING,
    CONSTRAINT communication_activity_pk PRIMARY KEY (communication_id),
    CONSTRAINT communication_activity_fk FOREIGN KEY (applicant_id)
        REFERENCES admissions_mvp.curated.applicant (applicant_id)
)
    COMMENT 'Communication activity data linked to applicants for the admissions MVP project';

-- COMMAND ----------

CREATE TABLE admissions_mvp.curated.counselor (
counselor_id BIGINT NOT NULL,
counselor_name STRING,
CONSTRAINT counselor_pk PRIMARY KEY (counselor_id)
);

-- COMMAND ----------

DROP table admissions_mvp.curated.review;

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS admissions_mvp.curated.review (
    review_id          BIGINT      NOT NULL,
    application_id     BIGINT,
    counselor_id       BIGINT,
    review_status      STRING,
    review_start_date  TIMESTAMP,
    review_end_date    TIMESTAMP,
    CONSTRAINT review_pk PRIMARY KEY (review_id),
    CONSTRAINT review_application_fk FOREIGN KEY (application_id)
        REFERENCES admissions_mvp.curated.application (application_id),
    CONSTRAINT review_counselor_fk FOREIGN KEY (counselor_id)
        REFERENCES admissions_mvp.curated.counselor (counselor_id)
)
    COMMENT 'Application review data linked to applications and counselors for the admissions MVP project';

-- COMMAND ----------

DROP table admissions_mvp.curated.program;

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS admissions_mvp.curated.program (
    program_id   BIGINT NOT NULL,
    program_name STRING,
    school       STRING,
    degree_level STRING,
    CONSTRAINT program_pk PRIMARY KEY (program_id)
)
    COMMENT 'Program reference data for the admissions MVP project';

-- COMMAND ----------

CREATE TABLE IF NOT EXISTS admissions_mvp.curated.dim_stage (
    stage_id      BIGINT NOT NULL,
    stage_name    STRING,
    stage_sequence INT,
    CONSTRAINT dim_stage_pk PRIMARY KEY (stage_id)
)
    COMMENT 'Dimension table for application stages in the admissions MVP project';

-- COMMAND ----------

ALTER TABLE admissions_mvp.curated.geography
    ADD COLUMNS (
        country STRING,
        city    STRING
    );

-- COMMAND ----------


USE ROLE job_ads_dlt_role;
USE DATABASE job_ads;

SHOW TABLES IN SCHEMA staging;

DESCRIBE TABLE staging.data_field_job_ads;

SELECT
    headline,
    employer__workplace
FROM staging.data_field_job_ads;

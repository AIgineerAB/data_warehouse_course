USE ROLE job_ads_dlt_role;
USE DATABASE job_ads;

SHOW SCHEMAS;

SHOW TABLES IN SCHEMA staging;

DESC TABLE staging.data_field_job_ads;

USE WAREHOUSE dev_wh;
SELECT
    headline,
    employer__workplace
FROM staging.data_field_job_ads;


SELECT * FROM staging.data_field_job_ads;

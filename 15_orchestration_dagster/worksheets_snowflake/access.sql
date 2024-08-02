USE ROLE job_ads_dlt_role;

SHOW GRANTS TO ROLE job_ads_dlt_role;

SHOW TABLES IN job_ads.staging;

USE SCHEMA JOB_ADS.staging;
SELECT * FROM DATA_FIELD_JOB_ADS;

USE ROLE SECURITYADMIN;

GRANT SELECT ON ALL TABLES IN SCHEMA job_ads.staging TO ROLE job_ads_dlt_role;
GRANT SELECT ON FUTURE TABLES IN SCHEMA job_ads.staging TO ROLE job_ads_dlt_role;

SHOW GRANTS ON DATABASE JOB_ADS;
SHOW GRANTS ON SCHEMA JOB_ADS.staging;
SHOW GRANTS ON table JOB_ADS.staging.data_field_job_ads;

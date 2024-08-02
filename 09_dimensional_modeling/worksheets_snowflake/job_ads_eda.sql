SHOW ROLES;

USE ROLE job_ads_dlt_role;

USE SCHEMA job_ads.staging;

SHOW TABLES;

DESC TABLE data_field_job_ads;

USE WAREHOUSE dev_wh;

SELECT
    relevance,
    workplace_address__street_address,
    WORKPLACE_ADDRESS__POSTCODE,
    publication_date,
    webpage_url,
    source_type,
    timestamp,
    TO_CHAR(TO_TIMESTAMP(timestamp / 1000), 'YYYY-MM-DD HH24:MI:SS')
        AS readable_timestamp
FROM data_field_job_ads LIMIT 5;

SELECT
    scope_of_work__min,
    scope_of_work__max,
    employer__name,
    salary_type__label,
    salary_description,
    duration__label,
    logo_url,
    employer__workplace,
    employer__name,
    employer__url
FROM data_field_job_ads LIMIT 5;
USE ROLE SYSADMIN;

USE DATABASE job_ads;   

CREATE SCHEMA IF NOT EXISTS marts;

SHOW SCHEMAS IN DATABASE job_ads;

USE ROLE securityadmin;

GRANT USAGE,
CREATE TABLE,
CREATE VIEW ON SCHEMA job_ads.marts TO ROLE job_ads_dbt_role;

-- grant CRUD and select tables and views
GRANT SELECT,
INSERT,
UPDATE,
DELETE ON ALL TABLES IN SCHEMA job_ads.marts TO ROLE job_ads_dbt_role;
GRANT SELECT ON ALL VIEWS IN SCHEMA job_ads.marts TO ROLE job_ads_dbt_role;

-- grant CRUD and select on future tables and views
GRANT SELECT,
INSERT,
UPDATE,
DELETE ON FUTURE TABLES IN SCHEMA job_ads.marts TO ROLE job_ads_dbt_role;
GRANT SELECT ON FUTURE VIEWS IN SCHEMA job_ads.marts TO ROLE job_ads_dbt_role;
USE ROLE job_ads_dbt_role;

SHOW GRANTS ON SCHEMA job_ads.marts;

-- manual test
USE SCHEMA job_ads.marts;
CREATE TABLE test (id INTEGER);
SHOW TABLES;
DROP TABLE TEST;
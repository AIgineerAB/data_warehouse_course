-- creaet warehouse schema

USE ROLE SYSADMIN;

USE DATABASE job_ads;

CREATE SCHEMA IF NOT EXISTS warehouse;

SHOW SCHEMAS IN DATABASE job_ads;

-- grant privileges to work on warehouse schema
USE ROLE securityadmin;

GRANT ROLE job_ads_dlt_role TO ROLE job_ads_dbt_role;

SHOW GRANTS TO ROLE job_ads_dbt_role; --privileges and roles granted to this role, for existing objects
SHOW GRANTS OF ROLE job_ads_dbt_role; --users granted this role

GRANT USAGE,
CREATE TABLE,
CREATE VIEW ON SCHEMA job_ads.warehouse TO ROLE job_ads_dbt_role; --note that job_ads_dlt_role already has the usage privilege on database job_ads

-- grant CRUD and select tables and views
GRANT SELECT,
INSERT,
UPDATE,
DELETE ON ALL TABLES IN SCHEMA job_ads.warehouse TO ROLE job_ads_dbt_role;
GRANT SELECT ON ALL VIEWS IN SCHEMA job_ads.warehouse TO ROLE job_ads_dbt_role;

-- grant CRUD and select on future tables and views
GRANT SELECT,
INSERT,
UPDATE,
DELETE ON FUTURE TABLES IN SCHEMA job_ads.warehouse TO ROLE job_ads_dbt_role;
GRANT SELECT ON FUTURE VIEWS IN SCHEMA job_ads.warehouse TO ROLE job_ads_dbt_role;

-- test on the new role
USE ROLE job_ads_dbt_role;
SELECT * FROM job_ads.staging.data_field_job_ads LIMIT 10;

SHOW GRANTS ON SCHEMA job_ads.warehouse;

USE SCHEMA job_ads.warehouse;
CREATE TABLE test (id INTEGER);
SHOW TABLES;
SHOW GRANTS TO ROLE job_ads_dbt_role; --privileges and roles granted to this role, for existing objects
DROP TABLE TEST;
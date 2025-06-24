-- NOTE: you should place the create user part 
-- in a separate file and .gitignore it as it contains credentials


-- create dlt user and dlt role 
USE ROLE USERADMIN;

CREATE ROLE IF NOT EXISTS job_ads_dlt_role;

CREATE USER IF NOT EXISTS extract_loader
    PASSWORD = '' -- create a password and fill in here
    DEFAULT_WAREHOUSE = dev_wh;


-- grant role to user
USE ROLE SECURITYADMIN;

GRANT ROLE job_ads_dlt_role TO USER extract_loader;

-- grant privileges to role
GRANT USAGE ON WAREHOUSE dev_wh TO ROLE job_ads_dlt_role;
GRANT USAGE ON DATABASE job_ads TO ROLE job_ads_dlt_role;
GRANT USAGE ON SCHEMA job_ads.staging TO ROLE job_ads_dlt_role;
GRANT CREATE TABLE ON SCHEMA job_ads.staging TO ROLE job_ads_dlt_role;

GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA job_ads.staging TO ROLE job_ads_dlt_role;
GRANT SELECT, INSERT, UPDATE, DELETE ON FUTURE TABLES IN SCHEMA job_ads.staging TO ROLE job_ads_dlt_role;

-- check grants
SHOW GRANTS ON SCHEMA job_ads.staging;
SHOW FUTURE GRANTS IN SCHEMA job_ads.staging;
SHOW GRANTS TO ROLE job_ads_dlt_role;
SHOW GRANTS TO USER extract_loader;

GRANT ROLE job_ads_dlt_role TO USER debbie;

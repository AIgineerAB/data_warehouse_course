USE ROLE useradmin;
CREATE ROLE IF NOT EXISTS amazon_dlt_role;

USE ROLE sysadmin;

CREATE DATABASE IF NOT EXISTS amazon;

CREATE SCHEMA IF NOT EXISTS amazon.staging;

USE ROLE securityadmin;

GRANT ROLE amazon_dlt_role TO USER extract_loader;

GRANT USAGE ON SCHEMA amazon.staging TO ROLE amazon_dlt_role;

GRANT USAGE ON WAREHOUSE dev_wh TO ROLE amazon_dlt_role;

GRANT USAGE ON DATABASE amazon TO ROLE amazon_dlt_role;
GRANT CREATE TABLE ON SCHEMA amazon.staging TO ROLE amazon_dlt_role;
GRANT INSERT,
UPDATE,
DELETE ON ALL TABLES IN SCHEMA amazon.staging TO ROLE amazon_dlt_role;
GRANT INSERT,
UPDATE,
DELETE ON FUTURE TABLES IN SCHEMA amazon.staging TO ROLE amazon_dlt_role;




GRANT ROLE amazon_dlt_role TO USER kokchun;

USE ROLE amazon_dlt_role;

USE WAREHOUSE dev_wh;


SHOW SCHEMAS IN DATABASE amazon;

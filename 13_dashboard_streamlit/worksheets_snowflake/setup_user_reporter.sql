-- NOTE: you should .gitignore this file as it contains credentials
USE ROLE useradmin;
CREATE USER IF NOT EXISTS reporter
    PASSWORD = '' -- create and fill in password
    LOGIN_NAME = 'reporter'
    DEFAULT_WAREHOUSE = dev_wh
    DEFAULT_NAMESPACE = 'job_ads.marts'
    COMMENT = 'reporter user for making analysis and BI'
    DEFAULT_ROLE = 'job_ads_reporter_role';

USE DATABASE CRUNCHBASE_BASIC_COMPANY_DATA;

SHOW SCHEMAS;

USE SCHEMA PUBLIC;

SHOW TABLES;

SHOW VIEWS;

SELECT * FROM organization_summary LIMIT 5;

DESC VIEW organization_summary;

SELECT COUNT(*) AS number_rows FROM organization_summary;

SELECT DISTINCT type
FROM organization_summary;

-- check number unique names
SELECT COUNT(DISTINCT name) AS number_unique_names
FROM organization_summary LIMIT 5;

-- check unique countries
SELECT COUNT(DISTINCT COUNTRY_CODE) FROM organization_summary;

-- check number of organizations in different countries
SELECT
    country_code,
    COUNT(*) AS number_organizations
FROM organization_summary
GROUP BY country_code
ORDER BY number_organizations DESC;

-- check organizations in nordic countries 
SELECT
    country_code,
    COUNT(*) AS number_organizations
FROM organization_summary
GROUP BY country_code
HAVING country_code IN ('SWE', 'DNK', 'NOR', 'FIN', 'ISL')
ORDER BY number_organizations DESC;

-- check organizations in regions in nordic countries
SELECT
    country_code,
    region,
    COUNT(*) AS number_organizations
FROM organization_summary
GROUP BY country_code, region
HAVING country_code IN ('SWE', 'DNK', 'NOR', 'FIN', 'ISL')
ORDER BY number_organizations DESC;

SHOW WAREHOUSES;

CREATE WAREHOUSE demo_warehouse
WITH 
WAREHOUSE_SIZE = 'X-Small' -- t-shirt sizes
AUTO_SUSPEND = 300 
AUTO_RESUME = TRUE
INITIALLY_SUSPENDED = TRUE
COMMENT = 'Demo warehouse created through worksheet';

SHOW WAREHOUSES;

USE WAREHOUSE COMPUTE_WH;

SHOW WAREHOUSES;


-- DDL operation: ALTER to modify compute resources (warehouses) and database objects
ALTER WAREHOUSE COMPUTE_WH
SET AUTO_SUSPEND = 60; -- to decrease cost 

-- scaling out - horizontal scaling
-- 
ALTER WAREHOUSE DEMO_WAREHOUSE
SET MAX_CLUSTER_COUNT = 3;

SHOW WAREHOUSES;

DROP WAREHOUSE DEMO_WAREHOUSE;
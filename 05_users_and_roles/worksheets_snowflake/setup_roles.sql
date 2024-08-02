-- NOTE: use the right role to perform the right actions
-- USERADMIN is responsible for user and role management
USE ROLE USERADMIN;

SELECT current_role();
SELECT current_user();

-- demo: privileges inheritance

-- 3 ROLES 
CREATE ROLE ice_cream_reader COMMENT = 'Able to read ice_cream database';
CREATE ROLE ice_cream_writer COMMENT
= 'Able to do CRUD operations on ice_cream database';
CREATE ROLE ice_cream_analyst COMMENT
= 'Able to create views on ice_cream database';

-- priviliges to ice_cream_reader
USE ROLE SECURITYADMIN; -- manage grants
GRANT USAGE ON WAREHOUSE dev_wh TO ROLE ice_cream_reader;
GRANT USAGE ON DATABASE ice_cream_db TO ROLE ice_cream_reader;

-- gets ability to reference schemas within the db but not any privileges on objs
GRANT USAGE ON ALL SCHEMAS IN DATABASE ice_cream_db TO ROLE ice_cream_reader;

-- grants select on all existing tables
GRANT SELECT ON ALL TABLES IN SCHEMA ice_cream_db.public TO ROLE ice_cream_reader;

-- grants select on all future tables in public
GRANT SELECT ON FUTURE TABLES IN SCHEMA ice_cream_db.public TO ROLE ice_cream_reader;

-- check grants
SHOW GRANTS TO ROLE ice_cream_reader;
SHOW FUTURE GRANTS IN SCHEMA ice_cream_db.public;

GRANT ROLE ice_cream_reader TO ROLE ice_cream_writer;

-- ice_cream_writer role has ice_cream_reader role granted on
SHOW GRANTS TO ROLE ice_cream_writer;

-- grant CRUD operations to ice_cream_writer
GRANT INSERT,
UPDATE,
DELETE ON ALL TABLES IN SCHEMA ice_cream_db.public TO ROLE ice_cream_writer;
GRANT INSERT,
UPDATE,
DELETE ON FUTURE TABLES IN SCHEMA ice_cream_db.public TO ROLE ice_cream_writer;

GRANT CREATE TABLE ON SCHEMA ice_cream_db.public TO ROLE ice_cream_writer;


SHOW FUTURE GRANTS IN SCHEMA ice_cream_db.public;
GRANT ROLE ice_cream_writer TO USER kokchun;

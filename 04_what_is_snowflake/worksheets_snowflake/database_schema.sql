SHOW DATABASES;

-- IF NOT EXISTS makes this statement idempotent
CREATE DATABASE IF NOT EXISTS DEMO_DB;

SHOW DATABASES;

-- creating a schema in DEMO_DB
CREATE SCHEMA IF NOT EXISTS DEMO_DB.STAGING;

SHOW SCHEMAS IN DATABASE DEMO_DB;

-- can also create schema when using database DEMO_DB
USE DATABASE DEMO_DB;

-- now we don't need to reference DEMO_DB as we are using it as database
CREATE SCHEMA IF NOT EXISTS WAREHOUSE;

-- nothing happens if we try to create an already existing schema with this command
CREATE SCHEMA IF NOT EXISTS STAGING;

-- however doing without IF NOT EXISTS will give an error
CREATE SCHEMA STAGING;

SHOW SCHEMAS;

-- tables and views are logically grouped by schemas 
CREATE TABLE IF NOT EXISTS customer (
    customer_id integer PRIMARY KEY,
    age integer,
    email varchar(50)
);

-- note that it is created under schema WAREHOUSE as this was our context 
SHOW TABLES;

-- insert some data into customer table 
INSERT INTO CUSTOMER (customer_id, age, email)
VALUES
(1, 32, 'abc@gmail.com'),
(2, 23, 'cdc@gmail.com');

SELECT * FROM CUSTOMER;


-- we could create under staging if we want, without changing context
CREATE TABLE IF NOT EXISTS staging.stg_customer (
    customer_id integer PRIMARY KEY,
    age integer,
    email varchar(50)
);

SHOW TABLES IN DATABASE DEMO_DB;




-- do some cleanup 
DROP DATABASE DEMO_DB;

SHOW DATABASES;

-- to find account_locator_url 
USE ROLE ORGADMIN;

SHOW ACCOUNTS;

USE ROLE sysadmin;

-- setup database and the staging layer 
CREATE DATABASE IF NOT EXISTS movies;

-- staging layer is a landing zone where data is loaded 
CREATE SCHEMA IF NOT EXISTS movies.staging; 

USE SCHEMA movies.staging;




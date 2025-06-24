USE ROLE sysadmin;


-- setup database and the staging layer 
CREATE DATABASE IF NOT EXISTS movies;


-- staging layer is a landing zone where data is loaded 
CREATE SCHEMA IF NOT EXISTS movies.staging; 








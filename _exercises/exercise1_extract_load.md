# Exercise 1 - Extracting and loading

In this exercise, you get to familiarize yourself with snowflake roles, extracting and loading to snowflake using dlt.

> [!NOTE]
> These exercises covers lectures 05-08.

## 0. Ice cream analyst

In the lecture `setup_dlt` we setup a reader and writer role and also an analyst role for the ice_cream_db. However we never granted any privileges to that role. It needs the following privileges to do its work:

- read data from tables and views in public schema
- use dev_wh
- create views
- create tables
- create temporary tables

Check that it has the correct grants and future grants. Now assign this role to your user, and do some manual testing to see that it works.

## 1. Which role to use?

Use the correct role and do the following

> [!NOTE]
> Correct role refers to the system defined role and custom role that is most suitable for the task, i.e. don't use a top-level role such as ACCOUNTADMIN to do everything.
> Follow the principle of least privilege (PoLP) - only provide necessary access for roles to perform their duties.

&nbsp; a) Create a marketing virtual warehouse called marketing_wh with size xs, 1 min suspend time, it should autoresume, suspend initially and give it a suitable comment.

&nbsp; b) Now create a database called ifood, and add a staging layer by creating a schema called staging.

&nbsp; c) Create a user called extract_loader and setup its credentials.

&nbsp; d) Create a role marketing_dlt_role and grant it access to staging.

&nbsp; e) Assign marketing_dlt_role to extract_loader user.

## 2. Load csv marketing data to snowflake

Load this [marketing data](https://www.kaggle.com/datasets/fayez7/ifood-marketing-campaigns) into the staging layer using dlt.

## 3. Load olympics data from postgres to snowflake

Download this [csv file of olympics data](https://www.kaggle.com/datasets/nitishsharma01/olympics-124-years-datasettill-2020). Setup a database in postgres and copy in the data from the csv file into postgres. Then load this data using dlt into snowflake.

<!-- MOVE TO project
In lecture `extract_load_api_dlt` we loaded ads from data engineering into snowflake data_field_job_ads table. The data field includes more roles than data engineering, so also find other data related job ads such as data science and data analyst and load them into the same table.  -->

## 4. Load parking API to snowflake (\*\*)

Start by asking for an API key in [open stockholm `Trafikkontorets trafik- och vägdata som öppna data`](https://openstreetgs.stockholm.se/home/). Then go into [parkering - API](https://openstreetgs.stockholm.se/Home/Parking), read the documentation and try to load some data you find interesting into snowflake.

## 5. Theory questions

These study questions are good to get an overview of snowflake roles and dlt for extracting and loading data.

&nbsp; a) Why is the principal of least privilege important in a company?

&nbsp; b) Explain the role of dlt in managing data pipelines.

&nbsp; c) What is a data connector and why is it important in data integration?

&nbsp; d) What is the difference between data extraction and data loading?

&nbsp; e) What is ELT and how does it differ from ETL?

&nbsp; f) Discuss the advantages of performing data transformations after loading the data.

&nbsp; g) What is the purpose of roles in Snowflake?

&nbsp; h) Explain the difference between USAGE and OWNERSHIP privileges.

&nbsp; i) What information is required to create a user in Snowflake?

## Glossary

Fill in this table either by copying this into your own markdown file or copy it into a spreadsheet if you feel that is easier to work with.

| terminology         | explanation |
| ------------------- | ----------- |
| SYSADMIN            |             |
| USERADMIN           |             |
| ORGADMIN            |             |
| SECURITYADMIN       |             |
| ACCOUNTADMIN        |             |
| role inheritance    |             |
| PUBLIC role         |             |
| public schema       |             |
| API                 |             |
| ETL                 |             |
| ELT                 |             |
| data ingestion      |             |
| batch ingestion     |             |
| streaming ingestion |             |
| incremental load    |             |
| pagination          |             |
| dlt connectors      |             |
| snowflake user      |             |
| staging layer       |             |
| granted to          |             |
| granted on          |             |
| granted by          |             |
| secrets.toml        |             |
| RBAC                |             |
| CRUD operations     |             |
| resource dlt        |             |
| source dlt          |             |
| yield python        |             |
|                     |             |
|                     |             |

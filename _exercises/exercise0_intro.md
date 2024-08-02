# Exercise 0 - Introduction

In this exercise, you get to familiarize yourself with snowflake and snowsql. You will also get some overview of pricing in Snowflake. Further, you'll get an SQL repetition through querying data from snowflakes marketplace.

> [!NOTE]
> These exercises covers lectures 00-04.

## 0. Google queries

Go into marketplace under data products in snowsight. Search and get the following dataset `Google Keywords search dataset - discover all searches on Google`.

Now create a worksheet on your local repository and start querying this data through snowsql.

&nbsp; a) Use this database and find out the underlying schemas, tables and views to get an overview of its logical structure.

&nbsp; b) Find out the columns and its data types in the table `GOOGLE_KEYWORDS`.

We will now do some exploratory data analysis (EDA) of this dataset.

&nbsp; c) Find out number of rows in the dataset.

&nbsp; d) When is the first search and when is the latest search in the dataset?

&nbsp; e) Which are the 10 most popular keywords?

&nbsp; f) How many unique keywords are there?

&nbsp; g) Check what type of platforms are used and how many users per platform

&nbsp; h) Let's dive into what swedish people are searching. Go into [worldbanks country codes](https://wits.worldbank.org/wits/wits/witshelp/content/codes/country_codes.htm) to find out the country code for Sweden. Find the 20 most popular keywords and the number of searches of that keyword.

&nbsp; i) Lets see how popular spotify is around the world. List the top 10 number countries and the number of searches for spotify. For now it's okay to list the country codes, later we'll join this with the actual country to get more useful information to the stakeholders.

&nbsp; j) Feel free to do additional explorations of this dataset.

## 1. How much does it cost?

For these exercises, look up the credit cost for your snowflake edition, cloud provider and region for your snowflake account.

&nbsp; a) You have a simple workload that runs daily in Snowflake. The workload uses 0.5 credits per day. Calculate the total credit usage and cost for a 30-day month.

&nbsp; b) Your workload varies throughout the month. For the first 10 days, you use 2 credits per day. For the next 10 days, you use 1.5 credits per day, and for the last 10 days, you use 1 credit per day. Calculate the total credit usage and cost for a 30-day month.

&nbsp; c) You have three different warehouses running workloads simultaneously. Warehouse A is of size XS, Warehouse B is of size S, and Warehouse C is of size M. Warehouse A is used for 10h/day, B is used for 2h/day and C is used for 1h/day. Calculate the total monthly cost assuming each warehouse runs for the full 30-day month.

&nbsp; d) Your Snowflake warehouse uses auto-scaling. For the first 10 days, it operates on 2 clusters for 10 hours per day. For the next 10 days, it scales up to 3 clusters for 10 hours per day. For the last 10 days, it scales up to 4 clusters for 10 hours per day. Calculate the total monthly budget. Assume the warehouse consumes 1 credit per hour per cluster.

## 2. Theory questions

These study questions are good to get an overview of how snowflake works.

&nbsp; a) What are the main components of Snowflake's architecture?

&nbsp; b) Explain the role of the storage layer in Snowflake.

&nbsp; c) What is the purpose of the compute layer in Snowflake?

&nbsp; d) How does the cloud services layer enhance the functionality of Snowflake?

&nbsp; e) What is a virtual warehouse in Snowflake, and how does it differ from a traditional data warehouse?

&nbsp; f) When are the cases you would want to scale up versus scaling out in terms of virtual warehouses and compute resources.

&nbsp; g) How does Snowflake's pricing model differ from traditional on-premise data warehousing solutions?

&nbsp; h) What is the difference between pay-as-you-go and upfront storage, and when you should you choose one over the other?

&nbsp; i) Explain the concept of Time Travel and Fail-safe in Snowflake and its use cases

## Glossary

Fill in this table either by copying this into your own markdown file or copy it into a spreadsheet if you feel that is easier to work with.

| terminology       | explanation |
| ----------------- | ----------- |
| downstream        |             |
| upstream          |             |
| data warehouse    |             |
| cloud computing   |             |
| modern data stack |             |
| idempotent        |             |
| OLAP              |             |
| OLTP              |             |
| virtual warehouse |             |
| external stage    |             |
| data consumer     |             |
| scaling out       |             |
| scaling up        |             |
| snowflake credit  |             |
| securable object  |             |
| snowflake object  |             |
| schema            |             |
| permanent table   |             |
| transient table   |             |
| temporary table   |             |
| time-travel       |             |
| fail-safe         |             |
| view              |             |
| table             |             |
| DML               |             |
| DDL               |             |
| DQL               |             |
| DCL               |             |

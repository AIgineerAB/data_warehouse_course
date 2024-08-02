# Exercise 2 - Dimensional modeling

> [!NOTE]
> There are several ways to model data, so there isn't a perfect or correct solution.
> By studying theory about dimensional modeling, you'll have some guidelines on
> how to approach some problems.

## 0. Model an inventory

An inventory has these facts

- stock Level: current stock level.
- reorder quantity: quantity to reorder.

and these associated dimensions:

- date dimension: day, month, quarter, year.
- warehouse dimension: warehouse id, warehouse name, location.
- product dimension: product id, product name, category, supplier.

Model this star schema in an ER diagram.

## 1. Ice cream data

In this task you will work with [ice cream dataset from kaggle](https://www.kaggle.com/datasets/tysonpo/ice-cream-dataset). Throw away the combined data.

&nbsp; a) Setup a database called ice_cream, a staging schema and a warehouse schema. Also create suitable roles and users for loading and transforming data.

&nbsp; b) Use dlt to load the data into snowflake.

&nbsp; c) Now make an ER diagram of a dimensional model. As a tip you can make the following tables

- fct_reviews
- dim_authors
- dim_products
- dim_review

&nbsp; d) Use dbt to make the transformations into the warehouse layer.


## 2. Theory questions

&nbsp; a) Why should you use surrogate keys in dimensional and fact tables?

&nbsp; b) How do you model to associate a fact table with its dimensions?

&nbsp; c) Why is it not good to anticipate business requirements through preslicing and dicing the data?

&nbsp; d) Give examples of facts that are additive, semi-additive and non-additive.

&nbsp; e) Which SCD is most commonly used and how does it work?

&nbsp; f) What is the purpose of a date dimension?

&nbsp; g) Why should you create an ephemeral materialization in dbt?

&nbsp; h)

## 3. Glossary

Fill in this table either by copying this into your own markdown file or copy it into a spreadsheet if you feel that is easier to work with.

| terminology                | explanation |
| -------------------------- | ----------- |
| granularity                |             |
| fact                       |             |
| dimensions                 |             |
| star schema                |             |
| conformed dimension        |             |
| slowly changing dimensions |             |
| business process           |             |
| data mart                  |             |
| snowflake schema           |             |
| 3NF                        |             |
| denomarlized tables        |             |
| ER diagram                 |             |
| foreign key                |             |
| primary key                |             |
| surrogate key              |             |
| foreign key relationship   |             |
| natural key                |             |
| transformation             |             |
| materialization            |             |
| role playing dimensions    |             |
| degenerate dimension       |             |
| factless fact table        |             |
| data quality               |             |
| data integrity             |             |
| inlining SQL               |             |
| ephemeral model            |             |
|                            |             |
|                            |             |

<!-- data quality and down - move to dbt exercise? -->

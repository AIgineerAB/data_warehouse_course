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


## 2. Glossary

Fill in this table either by copying this into your own markdown file or copy it into a spreadsheet if you feel that is easier to work with.

| terminology                | explanation |
| -------------------------- | ----------- |
| granularity                |             |
| fact                       |             |
| dimensions                 |             |
| star schema                |             |
| business process           |             |
| data mart                  |             |
| snowflake schema           |             |
| 3NF                        |             |
| denomarlized tables        |             |
| ER diagram                 |             |
| foreign key                |             |
| primary key                |             |
| surrogate key              |             |
| natural key                |             |



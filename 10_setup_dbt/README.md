# Data transformation with dbt

## What is dbt? 

Video on what is dbt :point_down: 

[![what is dbt?](https://github.com/kokchun/assets/blob/main/data_warehouse/what_is_dbt.png?raw=true)](https://youtu.be/mMJKWOg3nS4)


dbt provides two products: dbt Cloud and dbt Core. Both are data transformation tools. dbt Cloud is a commercial product to deploy dbt projects, while dbt Core is an open-source tool for local development of dbt projects. 

> [!NOTE]
>We will be working with dbt Core in this course. For simplicity, we will use the term *dbt* to refer to dbt Core.

dbt is used for transforming data from staging to transformed layers in data warehouse. Often, the layers can be schemas or databases. We will be using schemas as layers. 

> [!TIP] 
>💡Why using dbt for data transformation?
>- code execution is pushed to the data warehouse, taking advantage of its processing power instead of local computing
>- there is a broad selection for materialization: tables, views and incremental model etc
>- a dbt model is just a simple SELECT statement to define the resulting data  
>- dbt automatically determines execution order based on model dependencies
>- dbt auto-generates a visual documentation of how data flows through a pipeline: [lineage](https://www.getdbt.com/blog/getting-started-with-data-lineage)
>- Jinja templating is used for producing dynamic and reusable SQL codes(models)
>- data testing can be easily customized
>- etc



## Setup in Snowflake

We'll setup a user transformer and a role job_ads_dbt_role which will be granted to the transformer. Also we'll setup warehouse schema in job_ads database. See codes in `worksheets_snowflake`.

Video on setup role and user in snowflake for dbt :point_down: 

[![setup dbt part 1 roles](https://github.com/kokchun/assets/blob/main/data_warehouse/setup_dbt_roles_video.png?raw=true)](https://youtu.be/V2CEc9tCHxM)


## Installation

In your uv virtual environment, install dbt along with snowflake adapter

```bash
uv pip install dbt-core dbt-snowflake
```

## Set up dbt project

Video on setup dbt in vscode :point_down: 

>[!Note]
>In the video, we are running the below because in the past `dbt-core` will be installed automatically,
>```cmd
>uv pip install dbt-snowflake
>```
>Now dbt requires users to install `dbt-core` explicitly, therefore, you should run the below instead:
>```cmd
>uv pip install dbt-core dbt-snowflake
>```


[![setup dbt part 2 vscode](https://github.com/kokchun/assets/blob/main/data_warehouse/setup_dbt_part2_video.png?raw=true)](https://youtu.be/IUMdhf_vsMs)


### Step 1: set up project structure

On command line, initiate a dbt project called, for example, *dbt_code*

```bash 
dbt init dbt_code
```
This will produce 
- a folder with default subfolders and files called *dbt_code* in your working directory, which sets up the project structure for your dbt project
- a yaml file called ```profiles.yml``` in a folder ```.dbt``` in your home directory: ```~/.dbt/```

### Step 2: configure connection to data warehouse 

The `profiles.yml` file store connection settings to data warehouse. Update the file as below:

```YAML
dbt_snowflake: 
  target: dev 
  outputs: 
    dev: 
      type: snowflake
      account: <ACCOUNT_IDENTIFIER> # fill in this field
      user: transformer
      password: <PASSWORD> # fill in this field
      role: job_ads_dbt_role
      database: job_ads
      warehouse: dev_wh
      schema: staging
      client_session_keep_alive: False
```

Then in `dbt_project.yml` in the dbt project directory, update which profile should be used for this project:

```YAML
# This setting configures which "profile" dbt uses for this project.
profile: 'dbt_snowflake'
```

Check the connection to data warehouse with the syntax below. Navigate to the dbt project directory `dbt_code` and run:

```
dbt debug
```
🚀 If the connection is successfully, you are ready to develop your dbt models that transform data from staging to transformed layers in your chosen data warehouse! 

## Extra set up - dbt power user

Download dbt power user from vscode extensions, which will aid a lot in dbt development. This will allow previewing the resulting transformation in the data warehouse before running dbt.

Go into `settings.json` through shift+ctrl+p (windows) or shift+cmd+p (mac) and update the following:

```json
"files.associations": {
    "*.sql": "jinja-sql",
    "*.yml": "jinja-yaml"
},
```

## Extra set up - dbt_utils

We'll also be using a[ package called dbt_utils](https://hub.getdbt.com/dbt-labs/dbt_utils/latest/), which have several utility functions, macros that can be used. Create a file in the root project folder called `packages.yml` 

```bash
touch packages.yml
```
type in the following

```yml
packages:
  - package: dbt-labs/dbt_utils
    version: 1.2.0
```

then run `dbt deps` to install the dependencies specified in packages.yml

## Extra set up - generate_schema_name.sql macro

Copy the macro file called generate_schema_name.sql under *dbt_code/macros* from the course repo and paste it accordingly to your own repo. This file is needed so that we can use our chosen schema names when dbt is creating new tables and views in the database. 

## Overview of a dbt project

| directory/file      | details                                                                              |
| ------------------- | ------------------------------------------------------------------------------------ |
| dbt_project.yml     | main config file for the dbt project with project specific settings                  |
| ~/.dbt/profiles.yml | connection configs for different environments, connect dbt to data warehouse         |
| models              | sql files that define the models for data transformations                            |
| schema.yml          | used for defining tests, documentations, relationships for models, seeds and sources |
| seeds               | contains csv files that can be loaded into data warehouse                            |
| snapshots           | define snapsoht files, useful for slowly changing dimensions (SCD)                   |
| macros              | reusable sql snippets (macros) to DRY up the sql code                                |
| analyses            | ad-hoc analyses for EDA, these files will not materialize as models                  |
| logs                | log files from execution of dbt commands                                             |
| target              | compiled sql code that dbt generates combining model files, macros and configs       |
| tests               | custom test definitions to validate data models for data quality and integrity       |
| docs                | markdown files to document dbt project, can be rendered in dbt documentation         |


## Other videos :video_camera:

from Kahan data solutions 
- [Tips to improve your dbt projects](https://www.youtube.com/watch?v=qOx8l_QFz9I&list=PLy4OcwImJzBLJzLYxpxaPUmCWp8j1esvT&index=2)
- [Add raw sources to your dbt project](https://www.youtube.com/watch?v=Y03CsVDK69Y&list=PLy4OcwImJzBLJzLYxpxaPUmCWp8j1esvT&index=3)
- [Deploy to custom schemas & override dbt defaults](https://www.youtube.com/watch?v=AvrVQr5FHwk&list=PLy4OcwImJzBLJzLYxpxaPUmCWp8j1esvT&index=5)
- [Change the materialization (aka how dbt models deploy)](https://www.youtube.com/watch?v=zpACZu31154&list=PLy4OcwImJzBLJzLYxpxaPUmCWp8j1esvT&index=7)

## Read more :eyeglasses:

dbt from dbt docs
- [About dbt project](https://docs.getdbt.com/docs/build/projects)
- [dbt models](https://docs.getdbt.com/docs/build/models)
- [dbt seeds](https://docs.getdbt.com/docs/build/seeds)
- [Jinja and macros](https://docs.getdbt.com/docs/build/jinja-macros)
- [sources](https://docs.getdbt.com/docs/build/sources)
- [project variables](https://docs.getdbt.com/docs/build/project-variables)
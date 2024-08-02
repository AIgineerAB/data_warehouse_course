# Modeling and transformations in warehouse layer

<!-- [![video](https://github.com/kokchun/assets/blob/025ae8622a25d5522d11b21108f52f1df9388ea2/data_warehouse/snowflake_free_trial.png?raw=true)](https://github.com/kokchun/assets/blob/025ae8622a25d5522d11b21108f52f1df9388ea2/data_warehouse/snowflake_free_trial.png?raw=true) -->

> [!IMPORTANT] > [LINK TO VIDEO &nbsp; :video_camera:](https://)

## Setup user and role

We'll setup a user transformer and a role job_ads_dbt_role which will be granted to the transformer. Also we'll setup warehouse schema in job_ads database. See code in `worksheets_snowflake`.

## Installation

Activate your venv and install dbt-snowflake

```bash
uv pip install dbt-snowflake
```

Now run `dbt init dbt_code` and type in your configurations

Now go to `.dbt/profiles.yml` to see your configurations.

```bash
open ~/.dbt/profiles.yml # or use code or notepad depending on whats installed for you
```

To see that it's correctly configured run in your project dbt_code directory

```bash
dbt debug
```

## dbt power user

Download dbt power user from vscode extensions, which will aid a lot in dbt development.

Go into `settings.json` through shift+ctrl+p (windows) or shift+cmd+p (mac) and update the following:

```json
"files.associations": {
    "*.sql": "jinja-sql",
    "*.yml": "jinja-yaml"
},
```

## dbt_utils

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
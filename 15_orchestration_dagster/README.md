# Orchestration with dagster

<!-- [![video](https://github.com/kokchun/assets/blob/025ae8622a25d5522d11b21108f52f1df9388ea2/data_warehouse/snowflake_free_trial.png?raw=true)](https://github.com/kokchun/assets/blob/025ae8622a25d5522d11b21108f52f1df9388ea2/data_warehouse/snowflake_free_trial.png?raw=true) -->


> [!IMPORTANT]
> [LINK TO VIDEO &nbsp; :video_camera:](https://)


As we want to have new job ads ingested to our data warehouse in order to have an up to date dashboard, we need to run dlt, followed by all dbt models on a schedule. For example once per day in midnight or another frequency. If we are looking at periodical, not-live, data integration, then we have batch ELT, else we have streaming. In our case there is no feasible business requirement to be able to have the dashboard reflect and update live. Once per day is enough for our use case. 

> [!NOTE]
> This is a key decision that should be discussed between data engineers and downstream stakeholders, as it requires another set of technologies to achieve the different goals. Don't go for the coolest and most "buzzwordy", instead focus on what can give real business value.

> [!NOTE]
> This lecture isn't completely finished yet, it orchestrates dbt, but integration with dlt is not setup yet. Feel free to help me come up with solutions on how to setup orchestration of dlt ingestion.

## Setup 

Install dagster 

```bash
uv pip install dagster-dbt dagster-embedded-elt
```

Now create a dagster-dbt project scaffold 

```bash
dagster-dbt project scaffold --project-name pipeline_dagster --dbt-project-dir=dbt_code
```

Run this command to view the project 

```bash
DAGSTER_DBT_PARSE_PROJECT_ON_LOAD=1 dagster dev  
```


## Other videos :video_camera:



## Read more :eyeglasses:

- [Local modern data stack with dagster, dbt and duckdb - A. Milicevic, G. Heiler (2023)](https://georgheiler.com/2023/12/11/dagster-dbt-duckdb-as-new-local-mds/)

- [Deploy with dagster - dlthub docs](https://dlthub.com/docs/walkthroughs/deploy-a-pipeline/deploy-with-dagster)
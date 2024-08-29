# dbt testing

<!-- [![video](https://github.com/kokchun/assets/blob/025ae8622a25d5522d11b21108f52f1df9388ea2/data_warehouse/snowflake_free_trial.png?raw=true)](https://github.com/kokchun/assets/blob/025ae8622a25d5522d11b21108f52f1df9388ea2/data_warehouse/snowflake_free_trial.png?raw=true) -->


Video on dbt testing (coding) :point_down:
[![dbt testing code]()]()



There will be errors along the data pipeline somewhere and sometimes. It can be due to strange input data, some outliers, or something that went wrong in some part in the pipeline. It is thus important for the data team to be the first to capture this error and don't let it propagate to downstream use cases that might base decisions on this data. It could be harmful for the business and the data team might lose its credibility if this happens. 

One way to mitigate this is through testing the data before serving it to downstream. By using dbt we can test the data in various ways.

<!-- TODO: specify some tests here -->

> [!NOTE]
> I haven't made a complete test suite intentionally as it is your job to do it in order to learn how to properly test your models. 


## Setup

Install [dbt_expectation](https://hub.getdbt.com/calogica/dbt_expectations/latest/), which has a lot of test macros that can be used to test the data. The documentation of [dbt-expectations are found here](https://github.com/calogica/dbt-expectations/tree/0.10.3/?tab=readme-ov-file). Start by adding the following to `packages.yml`

```yml
packages:
  - package: calogica/dbt_expectations
    version: 0.10.3
```

Now run `dbt deps` to install the dependencies.


## Other videos :video_camera:

from Kahan data solutions 

- [How to test and debug your dbt models](https://www.youtube.com/watch?v=aCZUiCzoJt4&list=PLy4OcwImJzBLJzLYxpxaPUmCWp8j1esvT&index=6)

## Read more :eyeglasses:

from dbt docs
- [Add data tests to your DAG](https://docs.getdbt.com/docs/build/data-tests)
- [About data tests property](https://docs.getdbt.com/reference/resource-properties/data-tests)
- [About dbt test command](https://docs.getdbt.com/reference/commands/test)
- [Unit tests](https://docs.getdbt.com/docs/build/unit-tests)

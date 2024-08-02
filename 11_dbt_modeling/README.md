# dbt transformations

<!-- [![video](https://github.com/kokchun/assets/blob/025ae8622a25d5522d11b21108f52f1df9388ea2/data_warehouse/snowflake_free_trial.png?raw=true)](https://github.com/kokchun/assets/blob/025ae8622a25d5522d11b21108f52f1df9388ea2/data_warehouse/snowflake_free_trial.png?raw=true) -->

> [!IMPORTANT] > [LINK TO VIDEO &nbsp; :video_camera:](https://)

Based on our previous dimensional models on the job ads we'll transform the data from staging layer to the warehouse layer. This will be our source of truth, that later will serve the data marts layer, which then in turn serves BI dashboards. We will base our modeling on the ER diagram of a star schema created in `dimension_modeling` lecture.

> [!NOTE]
> I haven't implemented the full dimensional model. The rest is intended for you to implement, so  I have intentionally left it out.

## Setup

Start by removing the example directory in your models directory and create the following directories

- src
- fct
- dim
- mart

You can use the terminal

```bash
cd models
mkdir src fct dim mart
cd ..
```

Also create a schema.yml file under models and sources.yml under src.

```bash
touch models/schema.yml
touch src/sources.yml
```


## Other videos :video_camera:

from Kahan data solutions 

- [Tips to improve your dbt projects](https://www.youtube.com/watch?v=qOx8l_QFz9I&list=PLy4OcwImJzBLJzLYxpxaPUmCWp8j1esvT&index=2)
- [Add raw sources to your dbt project](https://www.youtube.com/watch?v=Y03CsVDK69Y&list=PLy4OcwImJzBLJzLYxpxaPUmCWp8j1esvT&index=3)
- [Deploy to custom schemas & override dbt defaults](https://www.youtube.com/watch?v=AvrVQr5FHwk&list=PLy4OcwImJzBLJzLYxpxaPUmCWp8j1esvT&index=5)
- [Change the materialization (aka how dbt models deploy)](https://www.youtube.com/watch?v=zpACZu31154&list=PLy4OcwImJzBLJzLYxpxaPUmCWp8j1esvT&index=7)

## Read more :eyeglasses:

dbt from dbt docs
- [dbt models](https://docs.getdbt.com/docs/build/models)
- [dbt seeds](https://docs.getdbt.com/docs/build/seeds)
- [Jinja and macros](https://docs.getdbt.com/docs/build/jinja-macros)
- [sources](https://docs.getdbt.com/docs/build/sources)
- [project variables](https://docs.getdbt.com/docs/build/project-variables)
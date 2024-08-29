# dbt transformations

Video on dbt theory to transform data :point_down:

[![developing in dbt](https://github.com/kokchun/assets/blob/main/data_warehouse/developing_dbt_video.png?raw=true)](https://youtu.be/PnSL_CPWKxI)

Video on dbt coding to transform data part 1 :point_down:
[![dbt transformations part 1](https://github.com/kokchun/assets/blob/main/data_warehouse/dbt_transformations_part1.png?raw=true)](https://youtu.be/aiYLvu6h0dM)

Video on dbt coding to transform data part 2 :point_down:
[![dbt transformations part 2](https://github.com/kokchun/assets/blob/main/data_warehouse/dbt_transformations_part2_video.png?raw=true)](https://youtu.be/HMvYN3Vdvao)

Video on dbt coding to transform data part 3 :point_down:
[![dbt transformations part 3](https://github.com/kokchun/assets/blob/main/data_warehouse/dbt_transformations_part3_video.png?raw=true)](https://youtu.be/z0G3KoDryww)




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
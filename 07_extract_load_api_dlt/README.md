# Extract and load API to snowflake with dlt 

<!-- [![video](https://github.com/kokchun/assets/blob/025ae8622a25d5522d11b21108f52f1df9388ea2/data_warehouse/snowflake_free_trial.png?raw=true)](https://github.com/kokchun/assets/blob/025ae8622a25d5522d11b21108f52f1df9388ea2/data_warehouse/snowflake_free_trial.png?raw=true) -->


> [!IMPORTANT]
> [LINK TO VIDEO &nbsp; :video_camera:](https://)


Read [dlthub documentation for loading data from API](https://dlthub.com/devel/tutorial/load-data-from-an-api). 

> [!NOTE]
> We will only do simple loading from API and won't go through incremental loading and pagination. Also we won't use API which requires a secret in the lecture, but there will be an exercise on it.


## Initalize project 

Run 

```bash
dlt init jobsearch snowflake
```

Fill in `.dlt/secrets.toml`

```toml
[destination.snowflake.credentials]
database = "job_ads" # please set me up!
password = "<your_password>" # please set me up!
username = "<your_username>" # please set me up!
host = "<your_host>" # can be found through 
warehouse = "COMPUTE_WH" # please set me up!
role = "ACCOUNTADMIN" # please set me up!
```


## Arbetsförmedlingen

We will be using an API to get ads published in arbetsförmedlingen/platsbanken. Go into [this code examples repository](https://gitlab.com/arbetsformedlingen/job-ads/getting-started-code-examples/code-examples-start-here) to read documentation. 



## Other videos :video_camera:


## Read more :eyeglasses:

- [Create a pipeline - dlthub docs](https://dlthub.com/docs/walkthroughs/create-a-pipeline)
- [How to add credentials - dlthub docs](https://dlthub.com/docs/walkthroughs/add_credentials)
- [Add a verified source - dlthub docs](https://dlthub.com/docs/walkthroughs/add-a-verified-source)
- [Run a pipeline - dlthub docs](https://dlthub.com/docs/walkthroughs/run-a-pipeline)
- [Adjust a schema - dlthub docs](https://dlthub.com/docs/walkthroughs/adjust-a-schema)
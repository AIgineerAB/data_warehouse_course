# Extract and load API to snowflake with dlt 

Video on dlt theory to extract and load from API to snowflake :point_down:

[![dlt to extract and load from api to snowflake](https://github.com/kokchun/assets/blob/main/data_warehouse/dlt_api_video.png?raw=true)](https://youtu.be/eohHTUU0RII)


Coding part

<a href="https://youtu.be/5fur2ZTonDQ" target="_blank">
  <img src="https://github.com/kokchun/assets/blob/main/data_engineering/dlt_api_snowflake.png?raw=true" alt="dlt for EL api to snowflake" width="1000">
</a>






Read [dlthub documentation for loading data from API](https://dlthub.com/devel/tutorial/load-data-from-an-api). 

> [!NOTE]
> We will only do simple loading from API and won't go through incremental loading and pagination. Also we won't use API which requires a secret in the lecture, but there will be an exercise on it.


## Set up in snowflake
### Database
Via Snowsight or Snowflake VSC extension, run the worksheet *setup_database.sql*

### Users and roles
Via Snowsight or Snowflake VSC extension, run the worksheet *setup_user_role.sql*

## Extract data with dlt

### Arbetsförmedlingen API data

We will be using jobtech API to get ads published in arbetsförmedlingen/platsbanken. Go into [this code examples repository](https://gitlab.com/arbetsformedlingen/job-ads/getting-started-code-examples/code-examples-start-here) to read documentation. 

### dlt's connection to snowflake
Create a folder *.dlt* and a file *secrets.toml*. The entire *.dlt* folder should be ignored by git. Populate the toml file:

```toml
[destination.snowflake.credentials]
database = "job_ads" 
username = "extract_loader" 
password = "<password for extract_loader>" # please set me up!
host = "<account_identifier>" # please set me up!  
warehouse = "dev_wh" 
role = "job_ads_dlt_role" 
```
### dlt load
Run the script *load_job_ads.py* and control that the data has been loaded to snowflake. 


## Other videos

**Archived**
Video on EDA of jobtech API :point_down:
[![EDA on jobtech API](https://github.com/kokchun/assets/blob/main/data_warehouse/EDA_job_ads_video.png?raw=true)](https://youtu.be/HB6Y8eMQ8w0)

Video on roles, user and database setup for jobtech :point_down:
[![roles, user and database setup](https://github.com/kokchun/assets/blob/main/data_warehouse/roles_jobtech_video.png?raw=true)](https://www.youtube.com/watch?v=EfN1PrpUPyM)

Video on extract and loading data from jobtech API to snowflake with dlt :point_down:
[![extract and load data from dlt to snowflake](https://github.com/kokchun/assets/blob/main/data_warehouse/dlt_jobtech_video.png?raw=true)](https://www.youtube.com/watch?v=PEmcikWd93o)


## Read more :eyeglasses:

- [Create a pipeline - dlthub docs](https://dlthub.com/docs/walkthroughs/create-a-pipeline)
- [How to add credentials - dlthub docs](https://dlthub.com/docs/walkthroughs/add_credentials)
- [Add a verified source - dlthub docs](https://dlthub.com/docs/walkthroughs/add-a-verified-source)
- [Run a pipeline - dlthub docs](https://dlthub.com/docs/walkthroughs/run-a-pipeline)
- [Adjust a schema - dlthub docs](https://dlthub.com/docs/walkthroughs/adjust-a-schema)
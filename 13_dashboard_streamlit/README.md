# Dashboard with streamlit

[![serving streamlit dashboard job ads](https://github.com/kokchun/assets/blob/main/data_warehouse/streamlit_dashboard_video.png?raw=true)](https://youtu.be/3K85fZ0Ak9o)


## Installation

```bash
uv pip install dotenv streamlit snowflake-connector-python
```

## Set up user and role in Snowflake

Use worksheets in the folder *worksheets_snowflake* to create a user *report* and a role *job_ads_reporter_role* which will be used by streamlit dashboard app to read data from Snowflake. 

## Connection credentials to Snowflake

Create a `.env` file and include connection credentials to Snowflake as below:

```YML
SNOWFLAKE_USER="reporter"
SNOWFLAKE_PASSWORD=""
SNOWFLAKE_ACCOUNT=""
SNOWFLAKE_WAREHOUSE="dev_wh"
SNOWFLAKE_DATABASE="job_ads"
SNOWFLAKE_SCHEMA="marts"
SNOWFLAKE_ROLE="job_ads_reporter_role"
```

## Run the streamlit dashboard app

Navigate to the directory where *dashboard.py* is located and run the app with:

```cmd
streamlit run dashboard.py
```

Check the dashboad and modified the dashboard with more visualizations.


## Read more :eyeglasses:

From streamlit docs
- [Basic concepts of streamlit](https://docs.streamlit.io/get-started/fundamentals/main-concepts)
- [Create an app](https://docs.streamlit.io/get-started/tutorials/create-an-app)
- [Theming](https://docs.streamlit.io/develop/concepts/configuration/theming)
- [Deployment concepts](https://docs.streamlit.io/deploy/concepts)
- [Deploy your app](https://docs.streamlit.io/deploy/streamlit-community-cloud/deploy-your-app)
# Setup data load tool (dlt)

Video on dlt theory :point_down:

[![theory on dlt](https://github.com/kokchun/assets/blob/main/data_warehouse/dlt_intro_video.png?raw=true)](https://youtu.be/m4zrj5ZUWs4)

Video on dlt setup part 1 :point_down:
[![setup dlt part 1](https://github.com/kokchun/assets/blob/main/data_warehouse/setup_dlt_1.png?raw=true)](https://youtu.be/u4map_3j9LA)

Video on dlt setup part 2 - setting up roles and user in snowflake :point_down:
[![setup dlt part 2](https://github.com/kokchun/assets/blob/main/data_warehouse/setup_dlt_2.png?raw=true)](https://youtu.be/NdM4iYw37B8)

Video on dlt setup part 3 - loading csv file to snowflake :point_down:
[![setup dlt part 3](https://github.com/kokchun/assets/blob/main/data_warehouse/setup_dlt_3.png?raw=true)](https://youtu.be/KOn6XRDrT8s)



This setup requires that you have the following prerequisites already setup
- python
- pip 

If you haven't [installed Python](https://www.python.org/downloads/),  install **3.11**, don't install 3.12. Also remember to tick the box: `add to path` in the installation, in order for Python to be properly installed. 

> [!WARNING]
> Don't install several versions of python if you don't have experience in switching between versions, e.g. using pyenv. 

## Virtual environment

We'll be using a virtual environment with the [uv package](https://github.com/astral-sh/uv), which is a package installer and resolver for Python. Start by installing uv globally using this command

```bash
pip install uv
```

> [!NOTE]
> Make sure no virtual environment is activated when running that comamnd in order to install it globally. 


Navigate to your repository and run 

```bash
uv venv 
```
This creates a `.venv`  directory, which stores information of your virtual environment. Now you can activate this venv through 

```bash
# in windows
source .venv/Scripts/activate

# in mac/linux
source .venv/bin/activate
```

> [!NOTE]
> On `windows`, you should use git bash, and not powershell or cmd. You can configure vscode to open git bash as default terminal. 

You will see a paranthesis around your directory name in the terminal when your venv is activated. Now you can install packages without affecting the global installations. So let's install dlt and ipykernel (used for jupyter notebooks).  

```bash
uv pip install "dlt[snowflake]" ipykernel pandas 
```

> [!NOTE]
> `"dlt[snowflake]"` means installing `dlt` and its dependencies for connecting to snowflake 

Now check that dlt is installed by typing `dlt --version` in your terminal. Also check the other packages using `pip list`. 


## Connect dlt to snowflake

Start downloading a csv file from Kaggle. We'll be using [Netflix Original Films & IMDB Scores](https://www.kaggle.com/datasets/luiscorter/netflix-original-films-imdb-scores). 

Navigate to your code directory and initialize a dlt project by typing 

```bash
dlt init load_snowflake snowflake
```

Create a data directory and place your csv file there. Then change the script file according to my code in `load_snowflake.py`. Also go into your .dlt and secrets.toml and setup snowflake connection.

```toml
[destination.snowflake.credentials]
database = "movies" # please set me up!
password = "<your_password>" # please set me up!
username = "<your_username>" # please set me up!
host = "<your_host>" # can be found through 
warehouse = "COMPUTE_WH" # please set me up!
role = "ACCOUNTADMIN" # please set me up!
```

> [!NOTE]
> host can be found through using the role ORGADMIN. Copy `account_locator_url` and remove `https://` and `.snowflakecomputing.com`

```
USE ROLE ORGADMIN;
SHOW ACCOUNTS;
```

Now finally before this will work, you need to setup a database called `movies` and a schema called `staging`. This can be done through sql script, see the script `setup_database.sql`. 

Run the script and control that the data has been loaded to snowflake. 

## Other videos :video_camera:

- [Data ingestion from APIs to warehouses - A. Brudaru (2024)](https://www.youtube.com/watch?v=oLXhBM7nf2Q&list=PLoHF48qMMG_R3Migi4SBLkqhkLHDzmEsL)



## Read more :eyeglasses:

- [Why we are building dlt and dlthub - dlthub docs](https://dlthub.com/why-dlt)
- [Getting started - dlthub docs](https://dlthub.com/docs/getting-started)

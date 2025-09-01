# Setup data load tool (dlt)

Video on dlt theory :point_down:

[![theory on dlt](https://github.com/kokchun/assets/blob/main/data_warehouse/dlt_intro_video.png?raw=true)](https://youtu.be/m4zrj5ZUWs4)


Video on dlt to extract and load csv into snowflake :point_down:

<a href="https://youtu.be/3zrs7CBPjaE" target="_blank">
  <img src="https://github.com/kokchun/assets/blob/main/data_engineering/dlt_csv_snowflake.png?raw=true" alt="dlt for EL csv to snowflake" width="1000">
</a>

This setup requires that you have the following prerequisites already setup

- python
- pip

If you haven't [installed Python](https://www.python.org/downloads/), install **3.11**, don't install 3.12. Also remember to tick the box: `add to path` in the installation, in order for Python to be properly installed.

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

This creates a `.venv` directory, which stores information of your virtual environment. Now you can activate this venv through

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
uv pip install "dlt[snowflake]" ipykernel pandas "dlt[parquet]"
```

> [!NOTE] > `"dlt[snowflake]"` means installing `dlt` and its dependencies for connecting to snowflake

Now check that dlt is installed by typing `dlt --version` in your terminal. Also check the other packages using `pip list`.

## Set up in snowflake

### Database

Via Snowsight or Snowflake VSC extension, run the worksheet _setup_database.sql_

### Users and roles

Via Snowsight or Snowflake VSC extension, run the worksheet _setup_user_role.sql_

## Extract data with dlt

### CSV data file

Start downloading a csv file from Kaggle. We'll be using [Netflix Original Films & IMDB Scores](https://www.kaggle.com/datasets/luiscorter/netflix-original-films-imdb-scores). Create a data directory and place your csv file there.

### dlt's connection to snowflake

Create a folder _.dlt_ and a file _secrets.toml_. The entire _.dlt_ folder should be ignored by git. Populate the toml file:

```toml
[destination.snowflake.credentials]
database = "movies"
username = "extract_loader"
password = "<password for extract_loader>" # please set me up!
host = "<account_identifier>" # please set me up!
warehouse = "dev_wh"
role = "movies_dlt_role"
```

### dlt load

Run the script _load_snowflake.py_ and control that the data has been loaded to snowflake.

## Other videos :video_camera:

- [Data ingestion from APIs to warehouses - A. Brudaru (2024)](https://www.youtube.com/watch?v=oLXhBM7nf2Q&list=PLoHF48qMMG_R3Migi4SBLkqhkLHDzmEsL)

**Archived**
Video on dlt setup part 1 :point_down:
[![setup dlt part 1](https://github.com/kokchun/assets/blob/main/data_warehouse/setup_dlt_1.png?raw=true)](https://youtu.be/u4map_3j9LA)

Video on dlt setup part 2 - setting up roles and user in snowflake :point_down:
[![setup dlt part 2](https://github.com/kokchun/assets/blob/main/data_warehouse/setup_dlt_2.png?raw=true)](https://youtu.be/NdM4iYw37B8)

Video on dlt setup part 3 - loading csv file to snowflake :point_down:
[![setup dlt part 3](https://github.com/kokchun/assets/blob/main/data_warehouse/setup_dlt_3.png?raw=true)](https://youtu.be/KOn6XRDrT8s)

## Read more :eyeglasses:

- [Why we are building dlt and dlthub - dlthub docs](https://dlthub.com/why-dlt)
- [Getting started - dlthub docs](https://dlthub.com/docs/getting-started)

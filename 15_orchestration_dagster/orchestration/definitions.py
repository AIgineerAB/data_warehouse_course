# ==================== #
#                      #
#       imports        #
#                      #
# ==================== #
# this file is used for running dagster locally
# this file is loaded directly as code location

from pathlib import Path
import dlt
import dagster as dg
from dagster_dlt import DagsterDltResource, dlt_assets
from dagster_dbt import DbtCliResource, DbtProject, dbt_assets

# to import dlt script
import sys
sys.path.insert(0, '../data_extract_load')
from load_job_ads import jobads_source

 
# ==================== #
#                      #
#       dlt Asset      #
#                      #
# ==================== #
# requires secrets.toml for snowflake connection

dlt_resource = DagsterDltResource() 

@dlt_assets(
    dlt_source = jobads_source(),
    dlt_pipeline = dlt.pipeline(
        pipeline_name="jobsearch",
        dataset_name="staging",
        destination="snowflake",
    ),
)
def dlt_load(context: dg.AssetExecutionContext, dlt: DagsterDltResource): 
    yield from dlt.run(context=context) 


# ==================== #
#                      #
#       dbt Asset      #
#                      #
# ==================== #
# this dbt asset needs dbt_packages pre-installed by 'dbp deps'

# Points to the dbt project path
dbt_project_directory = Path(__file__).parents[1] / "data_transformation"
# Define the path to your profiles.yml file (in your home directory)
profiles_dir = Path.home() / ".dbt"  
dbt_project = DbtProject(project_dir=dbt_project_directory,
                         profiles_dir=profiles_dir)

# References the dbt project object
dbt_resource = DbtCliResource(project_dir=dbt_project)

# Compiles the dbt project & allow Dagster to build an asset graph
dbt_project.prepare_if_dev()

# Yields Dagster events streamed from the dbt CLI
@dbt_assets(manifest=dbt_project.manifest_path,) #access metadata of dbt project so that dagster understand structure of the dbt project
def dbt_models(context: dg.AssetExecutionContext, dbt: DbtCliResource):
    yield from dbt.cli(["build"], context=context).stream() #compile the project and collect all results


# ==================== #
#                      #
#         Job          #
#                      #
# ==================== #

job_dlt = dg.define_asset_job("job_dlt", selection=dg.AssetSelection.keys("dlt_jobads_source_jobads_resource"))
job_dbt = dg.define_asset_job("job_dbt", selection=dg.AssetSelection.key_prefixes("warehouse", "marts"))

# ==================== #
#                      #
#       Schedule       #
#                      #
# ==================== #

#schedule for the first job
schedule_dlt = dg.ScheduleDefinition(
    job=job_dlt,
    cron_schedule="15 13 * * *" #UTC
)

# ==================== #
#                      #
#        Sensor        #
#                      #
# ==================== #

#sensor for the second job
@dg.asset_sensor(asset_key=dg.AssetKey("dlt_jobads_source_jobads_resource"),
                 job_name="job_dbt")
def dlt_load_sensor():
    yield dg.RunRequest()

# ==================== #
#                      #
#     Definitions      #
#                      #
# ==================== #

# Dagster object that contains the dbt assets and resource
defs = dg.Definitions(
                    assets=[dlt_load, dbt_models], 
                    resources={"dlt": dlt_resource,
                               "dbt": dbt_resource},
                    jobs=[job_dlt, job_dbt],
                    schedules=[schedule_dlt],
                    sensors=[dlt_load_sensor],
                    )



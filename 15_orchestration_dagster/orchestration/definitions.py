# ==================== #
#                      #
#       imports        #
#                      #
# ==================== #
# this file is used for running dagster locally
# here we create a single file as a dagster script
# alternatively, one can create a package for your dagster scripts

from pathlib import Path
import dlt
import dagster as dg
from dagster_dlt import DagsterDltResource, dlt_assets
from dagster_dbt import DbtCliResource, DbtProject, dbt_assets

# to import dlt script from another folder outside the orchestration folder
# this part is not needed if you create a package for your dagster scripts
import sys
sys.path.insert(0, '../data_extract_load')
from load_job_ads import jobads_source

 
# ==================== #
#                      #
#       dlt Asset      #
#                      #
# ==================== #
# the creation requires a local secrets.toml for snowflake connection 
# pipeline definition is moved here

# an instance from the dlt resource class to run dlt codes
dlt_resource = DagsterDltResource() 

# create dlt asset 
@dlt_assets(
    dlt_source = jobads_source(),
    dlt_pipeline = dlt.pipeline(
        pipeline_name="jobsearch",
        dataset_name="staging",
        destination="snowflake",
    ),
)
# note the use of dependency injection so that dagster framework constructs instances 
# of necessary classes needed to produce the asset: one for meta data, another for running dlt codes
def dlt_load(context: dg.AssetExecutionContext, dlt: DagsterDltResource): 
    yield from dlt.run(context=context) 


# ==================== #
#                      #
#       dbt Asset      #
#                      #
# ==================== #
# this dbt asset needs dbt_packages pre-installed by 'dbp deps'
# note the update in schema.yml

# Points to the dbt project path
dbt_project_directory = Path(__file__).parents[1] / "data_transformation"
# Define the path to your profiles.yml file (in your home directory)
profiles_dir = Path.home() / ".dbt"  

# instance of DbtProject with all necessary paths
dbt_project = DbtProject(project_dir=dbt_project_directory,
                         profiles_dir=profiles_dir)

# an instance from the dbt resource class to run dbt codes
dbt_resource = DbtCliResource(project_dir=dbt_project)

# produce the manifest file
# the manifest file let dagster understand the dependency between models
dbt_project.prepare_if_dev()

# create dbt asset
@dbt_assets(manifest=dbt_project.manifest_path,) # path to the dbt manifest.json
# note the dependency injection similar to that in dlt asset
def dbt_models(context: dg.AssetExecutionContext, dbt: DbtCliResource):
    yield from dbt.cli(["build"], context=context).stream() # stream() is for showing the progress realtime in dagster UI


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



import os
from dagster import Definitions
from dagster_dbt import DbtCliResource

from .assets import dbt_code_dbt_assets, dlt_asset_factory
from .constants import dbt_project_dir
from .schedules import schedules


defs = Definitions(
    assets=[dbt_code_dbt_assets, dlt_asset_factory],
    schedules=schedules,
    resources={
        "dbt": DbtCliResource(project_dir=os.fspath(dbt_project_dir)),
    },
)

import dlt
from sqlalchemy import create_engine
from pathlib import Path
import os

@dlt.source
def postgres_source():
    postgres_credentials = dlt.secrets["sources.postgres.credentials"]
    connection_string = (
        f"{postgres_credentials['drivername']}://{postgres_credentials['database']}:"
        + f"{postgres_credentials['password']}@{postgres_credentials['host']}:"
        + f"{postgres_credentials['port']}/{postgres_credentials['database']}"
    )

    return [get_amazon_products(connection_string)]


@dlt.resource(write_disposition="append")
def get_amazon_products(connection_string):

    with create_engine(connection_string).connect() as conn:
        query = "SELECT * FROM amazon_products"
        rows = conn.execution_options(yield_per=100).exec_driver_sql(query)
        # convert rows into dict
        yield from map(lambda row: dict(row._mapping), rows)


if __name__ == "__main__":
    working_directory = Path(__file__).parent
    os.chdir(working_directory)

    pipeline = dlt.pipeline(
        pipeline_name="postgres_to_snowflake",
        destination="snowflake",
        dataset_name="staging",
    )

    # run the pipeline with your parameters
    load_info = pipeline.run(postgres_source(), table_name="amazon_products")

    # pretty print the information on data that was loaded
    print(load_info)

import dlt
import pandas as pd
from pathlib import Path
import os

# used for extracting data from source, in this case a local csv file 
@dlt.resource(write_disposition="append")
def load_csv_resource(file_path: str, **kwargs):
    df = pd.read_csv(file_path, **kwargs)
    yield df.to_dict(orient="records")

if __name__ == "__main__":
    # need to change to current working directory as this is where 
    # dlt looks for .dlt and when using the play button in vscode  
    # it will run from where you are in the terminal, not neccessarily 
    # where this script is resided
    working_directory = Path(__file__).parent
    os.chdir(working_directory)

    # will use info from secrets.toml
    pipeline = dlt.pipeline(
        pipeline_name="load_snowflake",
        destination="snowflake",
        dataset_name="staging",  # schema
    )

    data = list(
        load_csv_resource(
            working_directory / "data" / "NetflixOriginals.csv", encoding="latin1"
        )
    )

    # print the data yielded from resource
    print(data)

    # run the pipeline with your parameters
    load_info = pipeline.run(data, table_name="netflix")

    # pretty print the information on data that was loaded
    print(load_info)

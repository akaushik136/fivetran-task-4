import pandas as pd
import json

def model(dbt, session):
    # Load the source data
    raw_json_df = dbt.source("source", "raw_json").to_pandas()

    # Assuming there's only one row, extract the JSON
    json_str = raw_json_df['_DATA'].iloc[0]
    # raise Exception("variable value is {}".format(json_str))

    # Parse the JSON string into a Python dictionary
    json_data = json.loads(json_str)

    # Extract the 'data' key which contains the array of records
    data_records = json_data['data']

    # Create a DataFrame from the data records
    # Each record is a list; we convert it into a DataFrame
    df = pd.DataFrame(data_records)

    # Optionally, if you need to set column names based on the meta structure
    # You can extract column names from the meta view if needed
    column_names = [col['name'] for col in json_data['meta']['view']['columns']]
    df.columns = column_names  # Set the DataFrame column names

    # Perform any additional transformations if necessary

    return df

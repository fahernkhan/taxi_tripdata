{{
    config(
        materialized = "table"
    )
}}

SELECT * FROM {{ source('taxi_tripdata','taxi_tripdata_raw') }}

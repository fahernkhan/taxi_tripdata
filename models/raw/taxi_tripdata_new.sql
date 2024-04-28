{{
    config(
        materialized = "table"
    )
}}

SELECT
  * EXCEPT (
    ehail_fee,
    store_and_fwd_flag
  ),
  store_and_fwd_flag = 'Y' AS store_and_fwd_flag,
  EXTRACT(DAY FROM lpep_pickup_datetime) AS pickup_day,
  EXTRACT(MONTH FROM lpep_pickup_datetime) AS pickup_month,
  EXTRACT(YEAR FROM lpep_pickup_datetime) AS pickup_year,
  EXTRACT(DAY FROM lpep_dropoff_datetime) AS dropoff_day,
  EXTRACT(MONTH FROM lpep_dropoff_datetime) AS dropoff_month,
  EXTRACT(YEAR FROM lpep_dropoff_datetime) AS dropoff_year
FROM
  {{ source('taxi_tripdata','taxi_tripdata_raw') }}

{{ config(
  materialized = "table"
) }}

SELECT
  * EXCEPT (
    ehail_fee,
    store_and_fwd_flag
  ),
  store_and_fwd_flag = 'Y' AS store_and_fwd_flag,
  {{ extract_date('lpep_pickup_datetime', 'DAY') }} AS pickup_day,
  {{ extract_date('lpep_pickup_datetime', 'MONTH') }} AS pickup_month,
  {{ extract_date('lpep_pickup_datetime', 'YEAR') }} AS pickup_year,
  {{ extract_date('lpep_dropoff_datetime', 'DAY') }} AS dropoff_day,
  {{ extract_date('lpep_dropoff_datetime', 'MONTH') }} AS dropoff_month,
  {{ extract_date('lpep_dropoff_datetime', 'YEAR') }} AS dropoff_year
FROM
  {{ source('taxi_tripdata','taxi_tripdata_raw') }}

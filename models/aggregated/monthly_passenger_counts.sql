-- models/aggregated/monthly_passenger_counts.sql

{{ config(
  materialized='table'
) }}

select
  EXTRACT(month from lpep_pickup_datetime) as pickup_month,
  EXTRACT(year from lpep_pickup_datetime) as pickup_year,
  SUM(passenger_count) as total_passengers
from
  {{ source('taxi_tripdata','taxi_tripdata_raw') }}
group by
  pickup_month, pickup_year
order by pickup_year asc, pickup_month asc

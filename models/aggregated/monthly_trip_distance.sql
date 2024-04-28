-- models/aggregated/monthly_trip_distance.sql

{{ config(
  materialized='table'
) }}

select
  ratecodeid,
  EXTRACT(month from lpep_pickup_datetime) as pickup_month,
  EXTRACT(year from lpep_pickup_datetime) as pickup_year,
  SUM(trip_distance) as total_trip_distance
from
  {{ source('taxi_tripdata','taxi_tripdata_raw') }}
group by
  pickup_month, pickup_year, ratecodeid
order by pickup_year asc, pickup_month asc

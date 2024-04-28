-- models/aggregated/monthly_payment_transactions.sql

{{ config(
  materialized='table'
) }}

select
  payment_type,
  EXTRACT(month from lpep_pickup_datetime) as pickup_month,
  EXTRACT(year from lpep_pickup_datetime) as pickup_year,
  COUNT(*) as transaction_count
from
  {{ source('taxi_tripdata','taxi_tripdata_raw') }}
group by
  pickup_month, pickup_year, payment_type
order by pickup_year asc, pickup_month asc

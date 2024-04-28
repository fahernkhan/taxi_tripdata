-- macros/check_month_range.sql

{% macro check_month_range(month_value) %}
{% set month_value_int = try(month_value | int) %}
{% if month_value_int >= 1 and month_value_int <= 12 %}
    {{ return(true) }}
{% else %}
    {{ return(false) }}
{% endif %}
{% endmacro %}

-- macros/check_date_range.sql

{% macro check_date_range(date_value) %}
{% set date_value_int = try(date_value | int) %}
{% if date_value_int >= 1 and date_value_int <= 31 %}
    {{ return(true) }}
{% else %}
    {{ return(false) }}
{% endif %}
{% endmacro %}

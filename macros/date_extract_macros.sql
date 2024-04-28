-- macros/date_extract_macros.sql

{% macro extract_date(column, date_part) %}
  EXTRACT({{ date_part }} FROM {{ column }})
{% endmacro %}

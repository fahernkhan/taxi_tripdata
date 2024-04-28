{% macro check_row_count_threshold(row_count_threshold, model_name) %}
  {% set actual_row_count = run_query("SELECT COUNT(*) FROM {{ this }}") %}
  {% if actual_row_count >= row_count_threshold %}
    select '{{ model_name }}' as model_name, 'pass' as test_result
  {% else %}
    select '{{ model_name }}' as model_name, 'fail' as test_result
  {% endif %}
{% endmacro %}

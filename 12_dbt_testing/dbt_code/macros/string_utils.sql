{% macro capitalize_first_letter(column) %}
    case
        when {{ column }} is null
        then null
        else upper(substr({{ column }}, 1, 1)) || lower(substr({{ column }}, 2))
    end
{% endmacro %}

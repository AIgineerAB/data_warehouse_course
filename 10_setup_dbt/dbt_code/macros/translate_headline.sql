{% macro translate_headline(column_name) %}
    CASE 
        WHEN {{ column_name }} = 'Data Engineer' THEN 'Junior Data Engineer'
        ELSE {{ column_name }}
    END
{% endmacro %}


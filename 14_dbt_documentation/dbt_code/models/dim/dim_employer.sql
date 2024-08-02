WITH src_employer AS (SELECT * FROM {{ ref('src_employer') }})

SELECT 
    {{dbt_utils.generate_surrogate_key(['id', 'employer_name'])}} AS employer_id,
    employer_name,
    {{ capitalize_first_letter("coalesce(workplace_city, 'stad ej specificerat')") }} AS workplace_city
    {# TODO: finish this dimensional model #}
FROM src_employer

WITH ja AS (SELECT * FROM {{ ref('src_job_ads') }}),

jd AS (SELECT * FROM {{ ref('src_job_details') }}),

e AS (SELECT * FROM {{ ref('src_employer') }})

SELECT 
    {{dbt_utils.generate_surrogate_key(['jd.id', 'jd.headline'])}} as job_details_key,
    {{dbt_utils.generate_surrogate_key(['e.id', 'e.employer_name'])}} as employer_key,
    {# TODO: key to junk dimension #}
    relevance, -- if null, aggregation functions can handle it properly
    coalesce(vacancies, 1) as vacancies,
    application_deadline
    -- for verifying FK relationships work
    {# jd.id,
    e.workplace_city,
    e.employer_name,
    jd.description #}
FROM 
    ja 
LEFT JOIN 
    jd ON ja.id = jd.id
LEFT JOIN 
    e ON ja.id = e.id
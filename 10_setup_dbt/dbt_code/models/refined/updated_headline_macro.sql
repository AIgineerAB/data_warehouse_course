WITH staging_data AS (
    SELECT 
        *
    FROM {{ ref('staging_data') }})

SELECT 
    {{ translate_headline('headline') }} AS updated_job_title
FROM staging_data
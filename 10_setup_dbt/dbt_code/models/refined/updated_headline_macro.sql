WITH staging_data AS (
    SELECT 
        *
    FROM {{ ref('original_headline') }})

SELECT 
    {{ translate_headline('headline') }} AS updated_job_title
FROM staging_data
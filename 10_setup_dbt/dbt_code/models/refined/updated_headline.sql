WITH staging_data AS (
    SELECT 
        *
    FROM {{ ref('staging_data') }})

SELECT 
    CASE 
        WHEN headline = 'Data engineer' THEN 'Junior data engineer'
        ELSE headline
    END AS job_title
FROM staging_data
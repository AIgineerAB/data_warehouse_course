{{
  config(
    materialized = 'ephemeral',
    )
}}


WITH stg_job_ads AS (SELECT * FROM {{ source('job_ads', 'stg_data_ads') }})

SELECT
    id,
    employer__name AS employer_name,
    employer__workplace AS employer_workplace,
    workplace_address__city AS workplace_city
FROM stg_job_ads

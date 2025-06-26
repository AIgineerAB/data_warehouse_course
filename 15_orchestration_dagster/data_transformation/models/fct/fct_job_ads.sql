-- this is an extract of the model

with job_ads as (select * from {{ ref('src_job_ads') }})

select
    {{ dbt_utils.generate_surrogate_key(['occupation__label']) }} as occupation_id,
    vacancies,
    relevance,
    application_deadline
from job_ads

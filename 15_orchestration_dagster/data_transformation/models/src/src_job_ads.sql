-- this is an extract of the model

with stg_job_ads as (select * from {{ source('job_ads', 'stg_ads') }})

select
    occupation__label,
    number_of_vacancies as vacancies,
    relevance,
    application_deadline
from stg_job_ads
order by application_deadline

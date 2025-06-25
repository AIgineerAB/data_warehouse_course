with src_occupation as (select * from {{ ref('src_occupation') }})

-- we use aggregate function max() for deduplicate, but there are more alternative codes one can use for this purpose
select
    {{ dbt_utils.generate_surrogate_key(['occupation']) }} as occupation_id,
    occupation,
    max(occupation_group) as occupation_group,
    max(occupation_field) as occupation_field
from src_occupation
group by occupation

select
    cast(permit_number as varchar) as permit_id,
    coalesce(trim(permit_type), 'Uncategorized') as permit_category,
    cast(construction_value as double) as construction_value_cad,
    cast(issue_date as date) as issued_at,
    cast(neighbourhood_id as integer) as neighbourhood_id,
    trim(work_description) as work_description
from {{ source('raw', 'raw_building_permits') }}

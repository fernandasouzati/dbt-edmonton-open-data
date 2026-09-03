select
    cast(neighbourhood_id as integer) as neighbourhood_id,
    trim(neighbourhood_name) as neighbourhood_name,
    trim(ward_name) as ward_name,
    trim(sector) as sector_name
from {{ source('raw', 'raw_neighbourhoods') }}

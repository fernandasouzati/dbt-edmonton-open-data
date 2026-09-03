select distinct neighbourhood_id 
from {{ source('raw', 'raw_311_requests') }} 
where neighbourhood_id not in (select neighbourhood_id from raw.raw_neighbourhoods )
union all
select distinct neighbourhood_id 
from {{ source('raw', 'raw_building_permits') }} 
where neighbourhood_id not in (select neighbourhood_id from raw.raw_neighbourhoods )

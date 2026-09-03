select
    {{ dbt_utils.generate_surrogate_key(['neighbourhood_id']) }} as neighbourhood_sk,
    neighbourhood_id,
    neighbourhood_name,
    ward_name,
    sector_name,
    case 
        when sector_name in ('Central', 'West') then 'Urban Core'
        when sector_name in ('South', 'North') then 'Suburban'
        else 'Outer Regional'
    end as urban_zone
from {{ ref('stg_neighbourhoods') }}

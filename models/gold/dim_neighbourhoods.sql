select
    {{ dbt_utils.generate_surrogate_key(['neighbourhood_combined']) }} as dim_neighbourhood_sk,
    neighbourhood,
    nbhd_latitude,
    nbhd_longitude,
    ward, 
    ward_latitude,
    ward_longitude,
from {{ ref('stg_dim_neighbourhoods') }}

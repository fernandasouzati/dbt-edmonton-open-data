select
    {{ dbt_utils.generate_surrogate_key(['row_num']) }} as neighbourhood_sk,
    neighbourhood,
    ward, 
    nbhd_latitude,
    nbhd_longitude,
    nbhd_location,
    ward_latitude,
    ward_longitude,
    ward_location
from {{ ref('stg_dim_neighbourhoods') }}

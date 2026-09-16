select
    {{ dbt_utils.generate_surrogate_key(['service_combined']) }} as dim_service_sk,
    service_combined,
    service_area,
    service_category,
    service_description,
    service_category_service_area,
    service_area_service_category,
    service_area_service_description
from {{ ref('stg_dim_service') }}

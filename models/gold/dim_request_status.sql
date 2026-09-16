select
    {{ dbt_utils.generate_surrogate_key(['request_status']) }} as dim_request_status_sk,
    request_status
from {{ ref('stg_dim_request_status') }}

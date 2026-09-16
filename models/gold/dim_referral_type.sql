select
    {{ dbt_utils.generate_surrogate_key(['referral_type']) }} as dim_referral_type_sk,
    referral_type
from {{ ref('stg_dim_referral_type') }}

select
    {{ dbt_utils.generate_surrogate_key(['interaction_channel']) }} as dim_interaction_channel_sk,
    interaction_channel
from {{ ref('stg_dim_interaction_channel') }}

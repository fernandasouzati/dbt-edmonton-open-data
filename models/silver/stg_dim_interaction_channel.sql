SELECT DISTINCT trim(interaction_channel) as interaction_channel
FROM {{ source('bronze', 'raw_311_requests') }}	

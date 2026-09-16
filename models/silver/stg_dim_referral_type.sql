SELECT DISTINCT coalesce(trim(referral_type),'UNKNOWN') as referral_type
FROM {{ source('bronze', 'raw_311_requests') }}	

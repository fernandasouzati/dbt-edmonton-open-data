SELECT DISTINCT trim(request_status) as request_status 
FROM {{ source('bronze', 'raw_311_requests') }}	

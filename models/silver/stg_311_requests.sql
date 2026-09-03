select
    cast(service_request_id as varchar) as request_id,
    trim(service_name) as request_type,
    cast(created_date as timestamp) as created_at,
    cast(closed_date as timestamp) as closed_at,
    trim(status_description) as status_name,
    cast(neighbourhood_id as integer) as neighbourhood_id,
    latitude,
    longitude,
    closed_date is not null as is_closed
from {{ source('raw', 'raw_311_requests') }}

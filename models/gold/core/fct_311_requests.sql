select
    r.request_id,
    n.neighbourhood_sk,
    r.neighbourhood_id,
    r.request_type,
    r.status_name,
    r.created_at,
    r.closed_at,
    r.is_closed,
    date_diff('hour', r.created_at, r.closed_at) as resolution_time_hours,
    case 
        when r.request_type = 'Pothole Repair' and date_diff('hour', r.created_at, r.closed_at) <= 48 then true
        when r.request_type != 'Pothole Repair' and date_diff('hour', r.created_at, r.closed_at) <= 120 then true
        else false
    end as is_within_sla
from {{ ref('stg_311_requests') }} r
left join {{ ref('dim_neighbourhoods') }} n 
    on r.neighbourhood_id = n.neighbourhood_id

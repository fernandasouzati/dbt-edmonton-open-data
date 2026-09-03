select * 
from {{ source('raw', 'raw_311_requests') }} 
where closed_date is not null and created_date >= closed_date

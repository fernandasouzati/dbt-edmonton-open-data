with req_summary as (
    select
        neighbourhood_id,
        count(request_id) as total_311_requests,
        count(case when not is_closed then 1 end) as open_311_requests,
        round(avg(resolution_time_hours), 2) as avg_resolution_hours
    from {{ ref('fct_311_requests') }}
    group by 1
),
permit_summary as (
    select
        neighbourhood_id,
        count(permit_id) as total_permits_issued,
        sum(construction_value_cad) as total_construction_val_cad
    from {{ ref('fct_building_permits') }}
    group by 1
)
select
    d.neighbourhood_name,
    d.ward_name,
    d.sector_name,
    coalesce(r.total_311_requests, 0) as total_311_requests,
    coalesce(r.open_311_requests, 0) as open_311_requests,
    r.avg_resolution_hours,
    coalesce(p.total_permits_issued, 0) as total_permits_issued,
    coalesce(p.total_construction_val_cad, 0.0) as total_construction_val_cad
from {{ ref('dim_neighbourhoods') }} d
left join req_summary r on d.neighbourhood_id = r.neighbourhood_id
left join permit_summary p on d.neighbourhood_id = p.neighbourhood_id

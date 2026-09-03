select
    p.permit_id,
    n.neighbourhood_sk,
    p.neighbourhood_id,
    p.permit_category,
    p.construction_value_cad,
    p.issued_at,
    case 
        when p.construction_value_cad < 50000 then 'Minor Project'
        when p.construction_value_cad between 50000 and 500000 then 'Moderate Development'
        else 'Major Development'
    end as project_tier
from {{ ref('stg_building_permits') }} p
left join {{ ref('dim_neighbourhoods') }} n
    on p.neighbourhood_id = n.neighbourhood_id

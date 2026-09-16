select
    f.request_id,
    dn.neighbourhood_sk,
    ds.dim_service_sk,
    dd.dim_date_sk,
    drs.dim_request_status_sk,
    drt.dim_referral_type_sk,
    dic.dim_interaction_channel_sk,
    f.datetime_closed,
    f.datetime_created,
    f.date_created,
    f.is_closed,
    f.count,
    date_diff('hour', f.datetime_created, f.datetime_closed) as resolution_hours,
    case when not is_closed then 1 end as open_requests,
from {{ ref('stg_fct_311_requests') }} f
inner join {{ ref('dim_neighbourhoods') }} dn
    on f.neighbourhood = dn.neighbourhood
    and f.ward = dn.ward
    and f.nbhd_latitude = dn.nbhd_latitude
    and f.nbhd_longitude = dn.nbhd_longitude
    and f.nbhd_location = dn.nbhd_location
    and f.ward_latitude = dn.ward_latitude
    and f.ward_longitude = dn.ward_longitude
    and f.ward_location = dn.ward_location
inner join {{ ref('dim_service') }} ds
    on f.service_combined = ds.service_combined
inner join {{ ref('dim_date') }} dd
    on f.date_created = dd.date_day
inner join {{ ref('dim_request_status') }} drs
    on f.request_status = drs.request_status
inner join {{ ref('dim_referral_type') }} drt
    on f.referral_type = drt.referral_type
inner join {{ ref('dim_interaction_channel') }} dic
    on f.interaction_channel = dic.interaction_channel

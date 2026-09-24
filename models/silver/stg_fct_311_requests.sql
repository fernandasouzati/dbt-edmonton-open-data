SELECT *, 
	concat('(', service_area, ') ', service_category, ' - ', service_description) as service_combined, 
	concat(neighbourhood,'(',nbhd_latitude,',',nbhd_longitude,') - ',ward,'(',ward_latitude,',',ward_longitude,')') as neighbourhood_combined
FROM (
SELECT
	row_id as request_id,
	strptime(date_closed, '%b %d, %Y %I:%M %p') AS datetime_closed,
	strptime(date_created, '%b %d, %Y %I:%M %p') AS datetime_created,
	cast(strptime(date_created, '%b %d, %Y %I:%M %p')  as date) AS date_created,
	date_closed is not null as is_closed,
	trim(request_status) as request_status,
	trim(interaction_channel) as interaction_channel,	
	coalesce(trim(referral_type),'No Referral Type') as referral_type, 
	coalesce(trim(service_area), 'No Service Area') as service_area,
	coalesce(trim(service_category), 'No Service Category') as service_category,
	coalesce(trim(service_description), 'No Service Description') as service_description,
	COALESCE(trim(neighbourhood),'(Unknown Neighbourhood)') AS neighbourhood,
	COALESCE(trim(nbhd_latitude),'(Unknown Neighbourhood)') as nbhd_latitude,
	COALESCE(trim(nbhd_longitude),'(Unknown Neighbourhood)') as nbhd_longitude,
	COALESCE(trim(ward),'(Unknown Ward)') as ward,
	COALESCE(trim(ward_latitude),'(Unknown Ward)') as ward_latitude,
	COALESCE(trim(ward_longitude),'(Unknown Ward)') as ward_longitude,
	count
FROM {{ source('bronze', 'raw_311_requests') }}
)

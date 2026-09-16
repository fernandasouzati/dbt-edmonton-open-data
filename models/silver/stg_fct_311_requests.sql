SELECT *, concat('(', service_area, ') ', service_category, ' - ', service_description) as service_combined
FROM (
SELECT
	row_id as request_id,
	strptime(date_closed, '%b %d, %Y %I:%M %p') AS datetime_closed,
	strptime(date_created, '%b %d, %Y %I:%M %p') AS datetime_created,
	cast(strptime(date_created, '%b %d, %Y %I:%M %p')  as date) AS date_created,
	trim(request_status) as request_status,
	trim(interaction_channel) as interaction_channel,	
	coalesce(trim(referral_type),'UNKNOWN') as referral_type, 
	coalesce(trim(service_area), 'Uncategorized') as service_area,
	coalesce(trim(service_category), 'Uncategorized') as service_category,
	coalesce(trim(service_description), 'Uncategorized') as service_description,
	date_closed is not null as is_closed,
	COALESCE(trim(neighbourhood),'(UNKNOWN)') AS neighbourhood,
	COALESCE(trim(ward),'(UNKNOWN)') as ward,
	COALESCE(trim(nbhd_latitude),'(UNKNOWN)') as nbhd_latitude,
	COALESCE(trim(nbhd_longitude),'(UNKNOWN)') as nbhd_longitude,
	COALESCE(trim(nbhd_location),'(UNKNOWN)') as nbhd_location,
	COALESCE(trim(ward_latitude),'(UNKNOWN)') as ward_latitude,
	COALESCE(trim(ward_longitude),'(UNKNOWN)') as ward_longitude,
	COALESCE(trim(ward_location),'(UNKNOWN)') as ward_location,
	count
FROM {{ source('bronze', 'raw_311_requests') }}
)

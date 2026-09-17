SELECT *, 
	CONCAT(neighbourhood,'(',nbhd_latitude,',',nbhd_longitude,') - ',ward,'(',ward_latitude,',',ward_longitude,')') as neighbourhood_combined
FROM (
SELECT DISTINCT
	COALESCE(trim(neighbourhood),'(Unknown Neighbourhood)') AS neighbourhood,
	COALESCE(trim(nbhd_latitude),'(Unknown Neighbourhood)') as nbhd_latitude,
	COALESCE(trim(nbhd_longitude),'(Unknown Neighbourhood)') as nbhd_longitude,
	COALESCE(trim(ward),'(Unknown Ward)') as ward,
	COALESCE(trim(ward_latitude),'(Unknown Ward)') as ward_latitude,
	COALESCE(trim(ward_longitude),'(Unknown Ward)') as ward_longitude
FROM {{ source('bronze', 'raw_311_requests') }}
)

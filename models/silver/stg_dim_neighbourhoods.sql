select row_number() OVER () AS row_num, * FROM (
SELECT DISTINCT		
	COALESCE(trim(neighbourhood),'(UNKNOWN)') AS neighbourhood,
	COALESCE(trim(ward),'(UNKNOWN)') as ward,
	COALESCE(trim(nbhd_latitude),'(UNKNOWN)') as nbhd_latitude,
	COALESCE(trim(nbhd_longitude),'(UNKNOWN)') as nbhd_longitude,
	COALESCE(trim(nbhd_location),'(UNKNOWN)') as nbhd_location,
	COALESCE(trim(ward_latitude),'(UNKNOWN)') as ward_latitude,
	COALESCE(trim(ward_longitude),'(UNKNOWN)') as ward_longitude,
	COALESCE(trim(ward_location),'(UNKNOWN)') as ward_location
FROM {{ source('bronze', 'raw_311_requests') }}
)

SELECT *, concat('(', service_area, ') ', service_category, ' - ', service_description) as service_combined
FROM (
	( 
	SELECT DISTINCT   
		'Uncategorized' AS service_area,
		'Uncategorized' AS service_category,	
		'Uncategorized' AS service_description,
		'Uncategorized  (Uncategorized)' AS service_category_service_area,
		'(Uncategorized)  Uncategorized 'AS service_area_service_category,
		'(Uncategorized)  Uncategorized' AS service_area_service_description
	FROM {{ source('bronze', 'raw_311_requests') }}
	WHERE service_description IS NULL or service_category is null or service_area is null 
	) UNION ALL (
	SELECT DISTINCT   
		trim(service_area) AS service_area,
		trim(service_category) AS service_category,	
		trim(service_description) AS service_description,
		trim(service_category_service_area) AS service_category_service_area,
		trim(service_area_service_category) AS service_area_service_category,
		trim(service_area_service_description) AS service_area_service_description
	FROM {{ source('bronze', 'raw_311_requests') }}
	WHERE NOT(service_description IS NULL or service_category is null or service_area is null )  
	ORDER BY 1,2,3
	)
)

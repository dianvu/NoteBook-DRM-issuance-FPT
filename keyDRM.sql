/* Re-format Log_BHD_MovieID `DATE` column to DATE type */
UPDATE DRM.Log_BHD_MovieID
SET `DATE` = DATE_FORMAT(STR_TO_DATE(`DATE`, '%d-%m-%Y %H:%i:%s.%f'), '%Y-%m-%d');

/* Re-format Log_Fimplus_MovieID `DATE` column to DATE type */
UPDATE DRM.Log_Fimplus_MovieID 
SET `date` = DATE_FORMAT(STR_TO_DATE(`date`, '%Y-%m-%d %H:%i:%s.%f'), '%Y-%m-%d');

/* Show Log_BHD_MovieID column data type */
SHOW COLUMNS FROM DRM.Log_BHD_MovieID;

/* Show Log_Fimplus_MovieID column data type */
SHOW COLUMNS FROM DRM.Log_Fimplus_MovieID;

/* Fimplus report on date which required DRM key */
select 
	count(distinct(lfmi.CustomerID)) as total_key,
	date,
	'Fimplus' as service_name
from DRM.Log_Fimplus_MovieID lfmi
left join
	DRM.MV_PropertiesShowVN mv on mv.id = lfmi.MovieId 
where mv.isDRM = 1
group by date
UNION
/* BHD movie report on date which required DRM key */
SELECT 	
	count(distinct(bhd.`CustomerID`)) as total_key,
	bhd.`DATE` as date, 
	'BHD' as service_name
FROM DRM.Log_BHD_MovieID bhd
left join
	DRM.MV_PropertiesShowVN mv on mv.id = bhd.MovieID 
where mv.isDRM = 1
group by date
/* Phim Goi report on date which required DRM key */
select 
	count(distinct(lgdl.CustomerID)) as total_key, 
	lgdl.`Date` as date, 
	'Phim Goi' as service_name
from DRM.Log_Get_DRM_List lgdl
left join
	DRM.Customers c on c.customerid = lgdl.CustomerID and c.mac = lgdl.Mac
left join
	DRM.CustomerService cs on cs.CustomerID = lgdl.CustomerID
group by date
order BY date DESC;
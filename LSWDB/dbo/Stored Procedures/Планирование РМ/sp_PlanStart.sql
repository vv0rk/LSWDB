/*
	добавляем рекомендованные для заявки связки
*/
CREATE PROCEDURE [dbo].[sp_PlanStart]
AS
	-- добавляем отсутствующие комплекты
	insert into dbo.rPlanRMTimeSheet( AssetId, idMaterialOriginal, isActive, Date)
	select f.AssetId, f.idMaterialOriginal, 1, '20160101'
	from fn_getFactRM() as f 
	left join fn_getcomplectsrm() as p on f.AssetId = p.AssetId and f.idMaterialOriginal = p.idMaterialOriginal
	where p.AssetId is null



RETURN 0

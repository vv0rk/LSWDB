/*
	возвращает пары AssetId, idMaterialOriginal рекомендованные для закупки
*/
CREATE FUNCTION [dbo].[fn_getComplectsRM]
(
)
RETURNS @returntable TABLE
(
	AssetId int not null,
	idMaterialOriginal int not null
)
AS
BEGIN
	INSERT @returntable
	SELECT p.AssetId, p.idMaterialOriginal
	FROM rPlanRMTimeSheet as p
	WHERE p.Date = '20160101'
	RETURN
END

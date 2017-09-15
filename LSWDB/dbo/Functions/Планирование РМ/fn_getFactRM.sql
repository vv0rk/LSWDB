/*
	возвращает пары AssetId idMaterialOriginal
	которые соответствуют требованиям для заявок
*/
CREATE FUNCTION [dbo].[fn_getFactRM]
(
)
RETURNS @returntable TABLE
(
	AssetId int,
	idMaterialOriginal int
)
AS
BEGIN
	INSERT @returntable
	select 
		p.AssetID,
		mc.IdMaterialOriginal
	from rPlanTimeSheet as p
	inner join tblAssets as a on p.AssetId = a.AssetID
	inner join tblAssetCustom as ac on a.AssetID = ac.AssetID
	inner join tsysAssetTypes as t on a.Assettype = t.AssetType
	inner join rModelLink as ml on ac.Model = ml.ModelAsset
	inner join rModelDevice as md on ml.ModelSprav = md.Model
	-- начинаем формировать комплекты
	inner join rModelComplect as mc on md.Id = mc.IdModel
	inner join rModelComplectStatus as ms on mc.IdStatus = ms.Id
	where t.AssetTypename = 'Printer' and p.ExDate = '20160101'
	-- выбираем только рекомендованные РМ у котороых в комплекте статус 'ДА'
	and ms.Status = N'ДА'
	RETURN
END

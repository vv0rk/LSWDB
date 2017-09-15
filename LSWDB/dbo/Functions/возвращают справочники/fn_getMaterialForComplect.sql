CREATE FUNCTION [dbo].[fn_getMaterialForComplect]
(
	@AssetId int = NULL
)
RETURNS @retMaterialOriginal TABLE 
(
	Id int null,
	partNumber nvarchar(100) null,
	Name nvarchar(255) null,
	Resource int null,
	IntenceOn bit null, 
	Manufacturer nvarchar(100) null
)
as 
BEGIN
	-- в этом случае выдаем материалы совместымие с устройством
	IF @AssetId is null
		begin
			return
		end 

	INSERT @retMaterialOriginal
	select distinct
		mo.Id,
		mo.PartNumber,
		mo.Name,
		mo.Resource,
		mo.IntenceOn,
		man.ShortName
	from tblAssetCustom as ac
	inner join rModelLink as ml on ac.Custom9 = ml.ModelSprav
	inner join rModelDevice as m on ml.ModelSprav = m.Model
	inner join rModelComplect as mc on m.Id = mc.IdModel
	inner join rMaterialOriginal as mo on mc.IdMaterialOriginal = mo.Id
	inner join rModelComplectStatus as ms on mc.IdStatus = ms.Id
	left join rManufacturer as man on mo.IdManufacturer = man.id
	Where ms.Status = N'ДА' and ac.AssetID = @AssetId

	return
END;
/*
	для использования в программе ВТшников
*/
CREATE FUNCTION [dbo].[fn_getComplectRMAnalog]
(
	@AssetId int = null
)
RETURNS @returntable TABLE
(
	id int,
	partNumber nvarchar(255),
	AssetId int
)
AS
BEGIN
	IF @AssetId is null
		begin
			INSERT @returntable
			select 
				ma.Id,
				ma.PartNumber,
				ac.AssetID
			from tblAssetCustom as ac
			inner join rModelDevice as md on ac.custom9 = md.Model
			inner join rModelComplect as mc on md.Id = mc.IdModel
			inner join rModelComplectStatus as ms on mc.IdStatus = ms.Id
			inner join rMaterialOriginal as mo on mc.IdMaterialOriginal = mo.Id
			inner join rMaterialAnalog as ma on mo.PartNumber = ma.PartNumber
			where ms.Status like N'ДА' 
		end
	ELSE
		begin
			INSERT @returntable
			select 
				ma.Id,
				ma.PartNumber,
				ac.AssetID
			from tblAssetCustom as ac
			inner join rModelDevice as md on ac.custom9 = md.Model
			inner join rModelComplect as mc on md.Id = mc.IdModel
			inner join rModelComplectStatus as ms on mc.IdStatus = ms.Id
			inner join rMaterialOriginal as mo on mc.IdMaterialOriginal = mo.Id
			inner join rMaterialAnalog as ma on mo.PartNumber = ma.PartNumber
			where ms.Status like N'ДА' and ac.AssetID = @AssetId
		end
	RETURN
END

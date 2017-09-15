/*
	Функция возсращает материалы которые были установлены на устройство
*/
CREATE FUNCTION [dbo].[fn_getRashod]
(
	@AssetId int = null
)
RETURNS @returntable TABLE
(
	id int not null,
	partNumber nvarchar(255) not null, 
	Name nvarchar(255) not null,
	Date datetime null,
	PrintedPages int null,
	Number int null,
	Username nvarchar(255) null
)
AS
BEGIN
		insert into @returntable
		select 
			r.Id
			, mo.PartNumber
			, mo.Name
			, r.[Date]
			, r.PrintedPages
			, r.Number
			, r.Username
		from tblAssets as a
		inner join tblAssetCustom as ac on a.AssetID = ac.AssetID
		inner join tsysAssetTypes as t on a.Assettype = t.AssetType
		inner join tblState as s on ac.State = s.State
		inner join rMaterialRashod as r on a.AssetID = r.AssetId
		inner join rMaterialOriginal as mo on r.idMaterialOriginal = mo.Id
		Where a.AssetID = @AssetId and r.isRemoved = 0;
	RETURN
END

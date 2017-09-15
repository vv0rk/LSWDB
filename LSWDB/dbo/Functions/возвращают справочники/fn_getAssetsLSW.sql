/*
	возвращает ассеты 
*/
CREATE FUNCTION [dbo].[fn_getAssetsLSW]
(
	@AssetId int = NULL
)
RETURNS @returntable TABLE
(
	AssetId int not null,
	AssetTypename nvarchar(100) not null,
	Model nvarchar(255) not null,
	AssetName nvarchar(255) not null,
	State nvarchar(255) not null
)
AS
BEGIN
	INSERT @returntable
	select 
		a.AssetID,
		t.AssetTypename,
		ac.Custom9,
		a.AssetName,
		s.Statename 
	from tblAssets as a
	inner join tblAssetCustom as ac on a.AssetID = ac.AssetID
	inner join tsysAssetTypes as t on a.Assettype = t.AssetType
	inner join tblState as s on ac.State = s.State
	Where ac.Custom9 is not null and s.Statename like N'%ctive%';

	return
END

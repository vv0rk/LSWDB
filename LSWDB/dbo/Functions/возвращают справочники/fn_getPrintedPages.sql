/*
	возвращает количество отпечатанных страниц
*/
CREATE FUNCTION [dbo].[fn_getPrintedPages]
(
	@AssetId int
)
RETURNS INT
AS
BEGIN
	declare @ret int = null;
		select @ret = ac.Printedpages
			from tblAssetCustom as ac
			inner join tblAssets as a on ac.AssetID = a.AssetID
			inner join tsysAssetTypes as t on a.Assettype = t.AssetType
		where t.AssetTypename = N'Printer'
	RETURN @ret;
END

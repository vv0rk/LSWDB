CREATE PROCEDURE [dbo].[sp_clearSelection]
AS
	update rAssetsImported 
	Set isSelected = 0
	from rAssetsImported
	Where rAssetsImported.isSelected <> 0
RETURN 0

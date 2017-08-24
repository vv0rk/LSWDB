CREATE FUNCTION [dbo].[fn_getDeviceClass]
()
RETURNS @retDevClass TABLE
(
	id int,
	idAssetType int,
	AssetTypeName nvarchar(255),
	Name nvarchar(255),
	Comment nvarchar(255)
)
AS
BEGIN
	INSERT @retDevClass
select 
	c.Id,
	c.idAssetType,
	t.AssetTypename,
	c.Name,
	c.Comment
	
from rPlanDeviceClass as c
inner join tsysAssetTypes as t on c.idAssetType = t.AssetType

	RETURN
END

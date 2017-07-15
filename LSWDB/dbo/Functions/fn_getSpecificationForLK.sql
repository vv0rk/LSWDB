
/*
	Спецификация оборудования проводимого по хранилищу
	но не получившего окончательного документального подтверждения
*/

CREATE FUNCTION [dbo].[fn_getSpecificationForLK]
(
	@idScl int = null
)
RETURNS TABLE as return 
(

select 
	ai.id
	, k.name
	, ai.inventoryNumber
	, ai.serialNumber
	, ai.assetId
	, N'НАЛИЧИЕ' as Status
	from rAssetsImported as ai
	inner join rAssetsKsu as k on ai.assetKsuId = k.id
Where ai.idScl = @idScl

union

select 
	ai.id
	, k.name
	, ai.inventoryNumber
	, ai.serialNumber
	, ai.assetId
	, N'ПЕРЕДАН' as Status
from rHJournal as j
inner join rHSclad as s on j.idScl1 = s.Id
inner join rAssetsImported as ai on j.idAsset = ai.id
inner join rAssetsKsu as k on ai.assetKsuId = k.id
Where j.idScl1 = @idScl and j.idStatus <> 2

)
GO
GRANT SELECT
    ON OBJECT::[dbo].[fn_getSpecificationForLK] TO [ie\VT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[fn_getSpecificationForLK] TO [ie\UIT_USERS]
    AS [dbo];


GO
GRANT SELECT
    ON OBJECT::[dbo].[fn_getSpecificationForLK] TO [IE\UIT_USERS_VR]
    AS [dbo];


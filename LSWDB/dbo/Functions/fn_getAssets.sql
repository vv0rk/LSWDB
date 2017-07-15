

CREATE FUNCTION [dbo].fn_getAssets
(
)
RETURNS TABLE
as return
(
select 
	a.id
	, k.code
	, k.name
	, a.inventoryNumber
	, a.serialNumber
	, k.mol
	, k.organization
	, a.assetId
	, a.idScl
	, t.TypeSclad
	, e.title
	, hs.StatusName
	
from rAssetsImported as a
inner join rAssetsKsu as k on a.assetKsuId = k.id
left join rHSclad as s on a.idScl = s.Id
left join rHScladType as t on s.idType = t.Id
left join rEmployee as e on s.idResponce = e.id
left join rHJournal as j on a.idJournal = j.Id
left join rHJStatus as hs on j.idStatus = hs.Id


)
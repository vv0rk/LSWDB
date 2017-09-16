use lansweeperdb;

go

--select 
--k.Comment,

--*
--from rAssetsKsu as k

select --top 3
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

union all

select --top 5 
	NULL as id,
	NULL as code,
	a.AssetName as name,
	ac.custom7 as inventoryNumber,
	ac.Serialnumber as serialNumber,
	N'НЕОПРЕДЕЛЕН' as mol,
	ac.Custom1 as organization,
	a.AssetID as assetId,
	NULL as idScl,
	NULL as TypeSclad,
	NULL as title,
	NULL as StatusName
from tblAssets as a
inner join tblAssetCustom as ac on a.AssetID = ac.AssetID
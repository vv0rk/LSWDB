use lansweeperdb;

go

select *
from rAssetsImported as ai
left join tblAssets as a on ai.assetId = a.AssetID
left join rHSclad as h on ai.idScl = h.Id
left join rHJournal as j on ai.id = j.idAsset
where a.AssetID is null and h.Id is null and j.id is null;

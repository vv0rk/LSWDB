use lansweeperdb;


with c as (
select 
	ac.Custom9 as tgt,
	ml.ModelSprav as src
from tblAssets as a
inner join tblAssetCustom as ac on a.AssetID = ac.AssetID
inner join tsysAssetTypes as t on a.Assettype = t.AssetType
inner join rModelLink as ml on ac.Model = ml.ModelAsset
where ac.Custom9 <> ml.ModelSprav and t.AssetTypename like N'Printer'
) update c set
tgt = src;
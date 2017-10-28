use lansweeperdb;


create unique NONCLUSTERED index [CK_rAssetsImported_AssetId] 
on [dbo].[rAssetsImported](assetId)
where assetId is not null;

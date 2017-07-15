
CREATE VIEW [dbo].[web50replastscantimes]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetName, dbo.tblAssets.Domain, dbo.tblAssets.IPAddress, 
                        dbo.tsysAssetTypes.AssetTypename AS [Asset Type], dbo.tsysAssetTypes.AssetTypeIcon10 AS icon, dbo.tblAssets.Scanserver, 
                        dbo.tblAssets.Firstseen, dbo.tblAssets.Lastseen, dbo.tblAssets.Lasttried, dbo.tblAssets.Lasttriggered, dbo.tblAssets.LastScheduled, 
                        dbo.tblAssets.LastActiveScan, dbo.tblAssets.LastIPScan, dbo.tblAssets.LastLsPush, dbo.tblAssets.ServiceVersion, 
                        dbo.tblAssets.LsPushVersion
FROM          dbo.tblAssets INNER JOIN
                        dbo.tsysAssetTypes ON dbo.tblAssets.Assettype = dbo.tsysAssetTypes.AssetType INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID
WHERE      (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssets.AssetName DESC
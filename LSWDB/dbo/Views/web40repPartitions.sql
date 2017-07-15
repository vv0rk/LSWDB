
CREATE VIEW [dbo].[web40repPartitions]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetUnique, dbo.tblAssets.AssetID, dbo.tblAssets.Domain, dbo.tsysOS.OSname, dbo.tblAssets.Description, 
                        COUNT(dbo.tblDiskPartition.AssetID) AS Partitions, dbo.tsysOS.Image AS icon
FROM          dbo.tblDiskPartition INNER JOIN
                        dbo.tblAssets ON dbo.tblDiskPartition.AssetID = dbo.tblAssets.AssetID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblAssetCustom.State = 1)
GROUP BY dbo.tblAssets.AssetUnique, dbo.tblAssets.AssetID, dbo.tblAssets.Domain, dbo.tsysOS.OSname, dbo.tblAssets.Description, dbo.tsysOS.Image, 
                        dbo.tblAssets.AssetName
HAVING       (COUNT(dbo.tblDiskPartition.AssetID) > 1)
ORDER BY dbo.tblAssets.AssetName, Partitions DESC
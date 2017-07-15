
CREATE VIEW [dbo].[web40repDatabasepath]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tsysOS.OSname, dbo.tblAssets.Domain, dbo.tblNetwork.Databasepath, 
                        dbo.tsysOS.Image AS icon
FROM          dbo.tblNetwork INNER JOIN
                        dbo.tblAssets ON dbo.tblNetwork.AssetID = dbo.tblAssets.AssetID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (NOT (dbo.tblNetwork.Databasepath = '%SystemRoot%\System32\drivers\etc')) AND (NOT (dbo.tblNetwork.Databasepath = '')) AND 
                        (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssets.AssetName

CREATE VIEW [dbo].[web40repnonintel]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.Domain, dbo.tsysOS.OSname, dbo.tsysOS.Image AS icon, dbo.tblProcessor.Manufacturer, 
                        dbo.tblProcessor.Name AS CPU
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblProcessor ON dbo.tblAssets.AssetID = dbo.tblProcessor.AssetID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblProcessor.Manufacturer <> 'GenuineIntel') AND (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssets.AssetName
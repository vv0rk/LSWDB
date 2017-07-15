
CREATE VIEW [dbo].[web40repdevicenotseen60]
AS
SELECT      TOP 1000000 dbo.tsysAssetTypes.AssetTypeIcon10 AS icon, dbo.tblAssets.AssetName, dbo.tblAssetCustom.Model, dbo.tblAssetCustom.Manufacturer, 
                        dbo.tblAssetCustom.Location, dbo.tblAssets.IPAddress, dbo.tblAssets.Lastseen, dbo.tblAssetCustom.AssetID
FROM          dbo.tblAssetCustom INNER JOIN
                        dbo.tblAssets ON dbo.tblAssetCustom.AssetID = dbo.tblAssets.AssetID INNER JOIN
                        dbo.tsysAssetTypes ON dbo.tblAssets.Assettype = dbo.tsysAssetTypes.AssetType
WHERE      (dbo.tblAssets.Lastseen < GETDATE() - 60) AND (dbo.tblAssetCustom.State = 1) AND (dbo.tblAssets.Assettype <> - 1)
ORDER BY dbo.tblAssets.AssetName
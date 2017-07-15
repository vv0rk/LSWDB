
CREATE VIEW [dbo].[web40repdevicenew24h]
AS
SELECT      TOP 1000000 dbo.tsysAssetTypes.AssetTypeIcon10 AS icon, dbo.tblAssets.AssetID, dbo.tblAssets.AssetName, dbo.tblAssetCustom.Model, 
                        dbo.tblAssetCustom.Manufacturer, dbo.tblAssetCustom.Location, dbo.tblAssets.IPAddress, dbo.tblAssets.Firstseen
FROM          dbo.tblAssetCustom INNER JOIN
                        dbo.tblAssets ON dbo.tblAssetCustom.AssetID = dbo.tblAssets.AssetID INNER JOIN
                        dbo.tsysAssetTypes ON dbo.tblAssets.Assettype = dbo.tsysAssetTypes.AssetType
WHERE      (dbo.tblAssetCustom.State = 1) AND (dbo.tblAssets.Firstseen > GETDATE() - 1) AND (dbo.tblAssets.Assettype <> - 1)
ORDER BY dbo.tblAssets.AssetName

CREATE VIEW [dbo].[web40repprintedpages]
AS
SELECT      TOP 1000000 dbo.tsysAssetTypes.AssetTypeIcon10 AS icon, dbo.tblAssets.AssetName, dbo.tblAssetCustom.Printerstatus AS Status, 
                        dbo.tblAssetCustom.Printedpages AS [Printed Pages], dbo.tblAssetCustom.Model AS [Device  model], dbo.tblAssets.Lastseen, 
                        dbo.tblAssets.AssetID
FROM          dbo.tblAssetCustom INNER JOIN
                        dbo.tblAssets ON dbo.tblAssetCustom.AssetID = dbo.tblAssets.AssetID INNER JOIN
                        dbo.tsysAssetTypes ON dbo.tblAssets.Assettype = dbo.tsysAssetTypes.AssetType
WHERE      (dbo.tblAssetCustom.Printedpages IS NOT NULL) AND (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssets.AssetName
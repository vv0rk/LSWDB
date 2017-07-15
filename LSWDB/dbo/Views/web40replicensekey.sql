
CREATE VIEW [dbo].[web40replicensekey]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tsysOS.OSname, dbo.tblSerialnumber.Product, 
                        dbo.tblSerialnumber.ProductID, dbo.tblSerialnumber.ProductKey, dbo.tsysOS.Image AS icon
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblSerialnumber ON dbo.tblAssets.AssetID = dbo.tblSerialnumber.AssetID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssets.AssetUnique, dbo.tblSerialnumber.Product
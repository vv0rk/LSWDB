
CREATE VIEW [dbo].[web40replicenseAC]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tsysOS.OSname, dbo.tsysOS.Image AS icon, 
                        dbo.tblSerialnumber.Product, dbo.tblSerialnumber.ProductKey, dbo.tblSerialnumber.ProductID
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblSerialnumber ON dbo.tblAssets.AssetID = dbo.tblSerialnumber.AssetID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblSerialnumber.Product LIKE 'Autocad%') AND (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblSerialnumber.Product, dbo.tblAssets.AssetName
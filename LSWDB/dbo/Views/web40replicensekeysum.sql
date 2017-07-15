
CREATE VIEW [dbo].[web40replicensekeysum]
AS
SELECT      TOP 1000000 dbo.tblSerialnumber.Product, COUNT(dbo.tblSerialnumber.SerialID) AS Total
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblSerialnumber ON dbo.tblAssets.AssetID = dbo.tblSerialnumber.AssetID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID
WHERE      (dbo.tblAssetCustom.State = 1)
GROUP BY dbo.tblSerialnumber.Product
ORDER BY Total DESC, dbo.tblSerialnumber.Product
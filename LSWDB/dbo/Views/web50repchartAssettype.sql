
CREATE VIEW [dbo].[web50repchartAssettype]
AS
SELECT      TOP 1000000 dbo.tsysAssetTypes.AssetTypename, COUNT(dbo.tblAssets.AssetID) AS Total
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysAssetTypes ON dbo.tblAssets.Assettype = dbo.tsysAssetTypes.AssetType
WHERE      (dbo.tblAssetCustom.State = 1)
GROUP BY dbo.tsysAssetTypes.AssetTypename
ORDER BY total DESC
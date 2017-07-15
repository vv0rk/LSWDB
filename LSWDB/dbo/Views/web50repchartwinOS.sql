
CREATE VIEW [dbo].[web50repchartwinOS]
AS
SELECT      TOP 1000000 dbo.tsysOS.OSname, COUNT(dbo.tblAssets.AssetID) AS Total
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblAssetCustom.State = 1) AND (dbo.tblAssets.Assettype = - 1)
GROUP BY dbo.tsysOS.OSname
ORDER BY total DESC
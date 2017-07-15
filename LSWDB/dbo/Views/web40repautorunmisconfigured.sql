
CREATE VIEW [dbo].[web40repautorunmisconfigured]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tsysOS.Image, dbo.tblAssets.Description, 
                        COUNT(dbo.tblAutorun.AutorunID) AS Total
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblAutorun ON dbo.tblAssets.AssetID = dbo.tblAutorun.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID
WHERE      (dbo.tblAssetCustom.State = 1)
GROUP BY dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tsysOS.Image, dbo.tblAssets.Description
HAVING       (COUNT(dbo.tblAutorun.AutorunID) > 100)
ORDER BY Total DESC
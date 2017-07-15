
CREATE VIEW [dbo].[web40repHighautorun]
AS
SELECT      TOP 1000000 dbo.tsysOS.Image AS icon, dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tsysOS.OSname, 
                        dbo.tblAssets.Description, COUNT(dbo.tblAutorun.AutorunID) AS Total
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblAutorun ON dbo.tblAssets.AssetID = dbo.tblAutorun.AssetID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblAssetCustom.State = 1)
GROUP BY dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tsysOS.OSname, dbo.tblAssets.Description, dbo.tsysOS.Image
HAVING       (COUNT(dbo.tblAutorun.AutorunID) > 25)
ORDER BY Total DESC
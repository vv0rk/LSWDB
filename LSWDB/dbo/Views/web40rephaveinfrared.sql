
CREATE VIEW [dbo].[web40rephaveinfrared]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tsysOS.OSname, dbo.tblAssets.Description, 
                        dbo.tblComputersystem.Lastchanged, dbo.tsysOS.Image AS icon, dbo.tblComputersystem.Infraredsupported
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblComputersystem ON dbo.tblAssets.AssetID = dbo.tblComputersystem.AssetID LEFT OUTER JOIN
                        dbo.tblOperatingsystem ON dbo.tblAssets.AssetID = dbo.tblOperatingsystem.AssetID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblComputersystem.Infraredsupported = 1) AND (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssets.AssetName
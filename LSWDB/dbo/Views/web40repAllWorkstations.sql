
CREATE VIEW [dbo].[web40repAllWorkstations]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tsysOS.OSname, dbo.tblAssets.Description, 
                        dbo.tblComputersystem.Lastchanged, dbo.tsysOS.Image AS icon
FROM          dbo.tblComputersystem INNER JOIN
                        dbo.tblAssets ON dbo.tblComputersystem.AssetID = dbo.tblAssets.AssetID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblComputersystem.Domainrole < 2) AND (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssets.AssetName

CREATE VIEW [dbo].[web40repmemoryno1GB]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tblAssets.Description, dbo.tsysOS.OSname, 
                        dbo.tblAssets.Memory, dbo.tblAssetCustom.Model, dbo.tblAssets.Lastseen, dbo.tsysOS.Image AS icon
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblAssetCustom.State = 1) AND (dbo.tblAssets.Memory < 1024)
ORDER BY dbo.tblAssets.AssetName
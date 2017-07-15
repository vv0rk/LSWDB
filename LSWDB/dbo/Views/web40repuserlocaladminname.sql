
CREATE VIEW [dbo].[web40repuserlocaladminname]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tsysOS.OSname, dbo.tblAssets.Description, 
                        dbo.tblUsers.Name, dbo.tsysOS.Image AS icon
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblUsers ON dbo.tblAssets.AssetID = dbo.tblUsers.AssetID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblUsers.SID LIKE '%-500') AND (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssets.AssetName
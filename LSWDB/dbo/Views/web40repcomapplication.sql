
CREATE VIEW [dbo].[web40repcomapplication]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tsysOS.OSname, dbo.tsysOS.Image AS icon, 
                        dbo.tblCOMApplication.Caption, dbo.tblCOMApplication.lastchanged
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblCOMApplication ON dbo.tblAssets.AssetID = dbo.tblCOMApplication.AssetID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssets.AssetName
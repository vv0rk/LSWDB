
CREATE VIEW [dbo].[web40repScreensaversecure]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetUnique, dbo.tblAssets.AssetID, dbo.tblAssets.Domain, dbo.tsysOS.OSname, dbo.tblAssets.Description, 
                        dbo.tsysOS.Image AS icon, dbo.tblDesktop.Name, dbo.tblDesktop.ScreenSaverExecutable, dbo.tblDesktop.ScreenSaverTimeout, 
                        dbo.tblDesktop.Lastchanged
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblDesktop ON dbo.tblAssets.AssetID = dbo.tblDesktop.AssetID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblDesktop.ScreenSaverSecure = 0) AND (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssets.AssetName
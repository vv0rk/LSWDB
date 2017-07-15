
CREATE VIEW [dbo].[web40repNotseen30days]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tsysOS.OSname, dbo.tblAssets.Description, 
                        dbo.tblAssets.Lastseen AS [Last Seen], dbo.tsysOS.Image AS icon
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblAssets.Lastseen < GETDATE() - 30) AND (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssets.Lastseen DESC, dbo.tblAssets.AssetName
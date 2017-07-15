
CREATE VIEW [dbo].[web40repcomputersnew24h]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tsysOS.OSname, dbo.tblAssets.Description, 
                        dbo.tsysOS.Image AS icon, dbo.tblAssets.Firstseen
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblAssets.Firstseen > GETDATE() - 1) AND (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssets.Firstseen DESC, dbo.tblAssets.AssetName
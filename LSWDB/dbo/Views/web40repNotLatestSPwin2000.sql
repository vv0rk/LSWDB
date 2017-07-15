
CREATE VIEW [dbo].[web40repNotLatestSPwin2000]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tsysOS.OSname, dbo.tblAssets.Description, 
                        dbo.tblAssets.SP AS [Current SP], dbo.tblAssets.Lastseen, dbo.tsysOS.Image AS icon
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblAssets.SP <> 4) AND (dbo.tsysOS.OSname = 'Win 2000' OR
                        dbo.tsysOS.OSname = 'Win 2000 S') AND (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssets.AssetName
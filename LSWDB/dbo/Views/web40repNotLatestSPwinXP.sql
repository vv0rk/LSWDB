
CREATE VIEW [dbo].[web40repNotLatestSPwinXP]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tsysOS.OSname, dbo.tblAssets.Description, 
                        dbo.tblAssets.SP AS [Current SP], dbo.tblAssets.Lastseen, dbo.tsysOS.Image AS icon
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblAssets.SP <> 3) AND (dbo.tsysOS.OSname = 'Win XP') AND (dbo.tsysOS.OScode = '5.1.2600') AND (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssets.AssetName
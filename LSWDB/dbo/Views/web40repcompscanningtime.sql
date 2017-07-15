
CREATE VIEW [dbo].[web40repcompscanningtime]
AS
SELECT      TOP 1000000 dbo.tsysOS.Image AS icon, dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tblAssets.Description, 
                        dbo.tblAssets.Lastseen, SUM(dbo.TsysLastscan.Scantime) AS Scantime
FROM          dbo.TsysLastscan INNER JOIN
                        dbo.tblAssets ON dbo.tblAssets.AssetID = dbo.TsysLastscan.AssetID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblAssetCustom.State = 1)
GROUP BY dbo.tsysOS.Image, dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tblAssets.Description, 
                        dbo.tblAssets.Lastseen
ORDER BY dbo.tblAssets.Lastseen DESC
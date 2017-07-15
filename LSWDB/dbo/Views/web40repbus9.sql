
CREATE VIEW [dbo].[web40repbus9]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tsysOS.OSname, dbo.tsysOS.Image AS icon, 
                        dbo.tblBus.DeviceID, dbo.tblBus.Lastchanged
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblBus ON dbo.tblAssets.AssetID = dbo.tblBus.AssetID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblBus.BusType = 9) AND (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssets.AssetName
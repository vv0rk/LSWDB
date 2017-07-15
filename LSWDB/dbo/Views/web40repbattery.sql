
CREATE VIEW [dbo].[web40repbattery]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tsysOS.OSname, dbo.tblBattery.DeviceID, 
                        dbo.tsysOS.Image AS icon, dbo.tblBattery.SmartBatteryVersion, dbo.tblBattery.Lastchanged
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblBattery ON dbo.tblAssets.AssetID = dbo.tblBattery.AssetID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssets.AssetName
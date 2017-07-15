

CREATE view web40repmonitorinfo
AS
SELECT TOP 1000000 tblAssets.AssetID, tblAssets.Assetname,tblAssets.Domain, tsysOS.OSname, tsysOS.Image AS icon, tblMonitor.MonitorManufacturer AS Manufacturer, tblMonitor.MonitorModel, tblMonitor.SerialNumber, tblMonitor.ManufacturedDate FROM tblAssets INNER JOIN tblMonitor ON tblMonitor.AssetID = tblAssets.AssetID INNER JOIN tblAssetCustom ON tblAssets.AssetID = tblAssetCustom.AssetID INNER JOIN  tsysOS ON tblAssets.OScode = tsysOS.OScode WHERE (tblAssetCustom.State = 1) ORDER BY tblAssets.AssetName

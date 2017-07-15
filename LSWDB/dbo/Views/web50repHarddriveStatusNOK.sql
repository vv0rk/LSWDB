﻿

CREATE VIEW [web50repHarddriveStatusNOK] AS SELECT TOP 1000000 tblAssets.AssetID, tblAssets.AssetName, tsysAssetTypes.AssetTypeIcon16 AS icon, tblFloppy.Manufacturer as [HD Manufacturer], tblFloppy.Model as [HD Model], tblFloppy.Size, tblFloppy.FirmwareRevision, tblFloppy.Status, tblAssets.Domain, tblAssets.Username, tblAssets.Userdomain, tblAssets.IPAddress, tblAssets.Description, tblAssetCustom.Manufacturer, tblAssetCustom.Model, tblAssetCustom.Location, tsysIPLocations.IPLocation, tblAssets.Firstseen, tblAssets.Lastseen FROM tblFloppy INNER JOIN tblAssets ON tblFloppy.AssetID = tblAssets.AssetID INNER JOIN tsysAssetTypes ON tblAssets.Assettype = tsysAssetTypes.AssetType INNER JOIN tblAssetCustom ON tblAssets.AssetID = tblAssetCustom.AssetID Inner Join tsysOS On tsysOS.OScode = tblAssets.OScode Left Join tsysIPLocations ON tblAssets.LocationID = tsysIPLocations.LocationID WHERE (tblFloppy.Status IS NOT NULL) AND (tblFloppy.Status <> 'OK') AND (tblAssetCustom.State = 1) ORDER BY tblAssets.AssetName
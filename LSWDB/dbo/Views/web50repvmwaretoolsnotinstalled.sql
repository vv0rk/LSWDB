﻿

CREATE VIEW [web50repvmwaretoolsnotinstalled] AS SELECT TOP 1000000 tblAssets.AssetID, tblAssets.AssetName, tblVmwareGuest.Name, tblVmwareGuest.IsRunning, tblAssets.Domain, tsysAssetTypes.AssetTypename As Type, tblAssets.IPAddress, tblAssets.Description, tblAssetCustom.Manufacturer, tblAssetCustom.Model, tblAssetCustom.Location, tsysIPLocations.IPLocation, tblAssets.Firstseen, tblAssets.Lastseen, tsysAssetTypes.AssetTypeIcon10 As icon FROM tblAssetCustom INNER JOIN tblVmwareGuest INNER JOIN tblAssets ON tblVmwareGuest.AssetID = tblAssets.AssetID ON tblAssetCustom.AssetID = tblAssets.AssetID LEFT OUTER JOIN tsysAssetTypes ON tblAssets.Assettype = tsysAssetTypes.AssetType Left Join tsysIPLocations ON tblAssets.LocationID = tsysIPLocations.LocationID WHERE (tblVmwareGuest.ToolsVersionStatus = 3) AND (tblAssetCustom.State = 1) ORDER BY tblAssets.AssetName
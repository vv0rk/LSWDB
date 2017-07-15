﻿

CREATE VIEW [web50repvmwaretoolsunmanaged] AS SELECT TOP 1000000 tblAssets.AssetID, tblAssets.AssetName, tblVmwareGuest.Name, tblVmwareGuest.IsRunning, tblAssets.Domain, tsysAssetTypes.AssetTypename As Type, tblAssets.IPAddress, tblAssets.Description, tblAssetCustom.Manufacturer, tblAssetCustom.Model, tblAssetCustom.Location, tsysIPLocations.IPLocation, tblAssets.Firstseen, tblAssets.Lastseen, tsysAssetTypes.AssetTypeIcon10 As icon FROM tblVmwareGuest INNER JOIN tblAssets ON tblVmwareGuest.AssetID = tblAssets.AssetID INNER JOIN tblAssetCustom ON tblAssets.AssetID = tblAssetCustom.AssetID LEFT OUTER JOIN tsysAssetTypes ON tblAssets.Assettype = tsysAssetTypes.AssetType Left Join tsysIPLocations ON tblAssets.LocationID = tsysIPLocations.LocationID WHERE (tblAssetCustom.State = 1) AND (tblVmwareGuest.ToolsVersionStatus = 4) ORDER BY tblAssets.AssetName
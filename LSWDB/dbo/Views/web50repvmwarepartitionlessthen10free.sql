﻿

CREATE VIEW [web50repvmwarepartitionlessthen10free] AS SELECT TOP 1000000 tblVmwareDisk.AssetID, tsysAssetTypes.AssetTypeIcon10 AS icon, tblAssets.AssetName, tblVmwareDisk.Name AS [Partition Name], tblVmwareDisk.TotalSpace, tblVmwareDisk.FreeSpace AS Free, tblVmwareDisk.Url, tblAssets.Domain, tsysAssetTypes.AssetTypename As Type, tblAssets.IPAddress, tblAssets.Description, tblAssetCustom.Manufacturer, tblAssetCustom.Model, tblAssetCustom.Location, tsysIPLocations.IPLocation, tblAssets.Firstseen, tblAssets.Lastseen FROM tblVmwareDisk INNER JOIN tblAssets ON tblVmwareDisk.AssetID = tblAssets.AssetID INNER JOIN tblAssetCustom ON tblAssets.AssetID = tblAssetCustom.AssetID INNER JOIN tsysAssetTypes ON tblAssets.Assettype = tsysAssetTypes.AssetType Left Join tsysIPLocations ON tblAssets.LocationID = tsysIPLocations.LocationID WHERE (tblVmwareDisk.FreeSpace / tblVmwareDisk.TotalSpace * 100 < 10) AND (tblAssetCustom.State = 1) ORDER BY tblAssets.AssetName
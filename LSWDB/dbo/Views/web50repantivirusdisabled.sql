﻿

CREATE VIEW [web50repantivirusdisabled] AS SELECT TOP 1000000 tsysAssetTypes.AssetTypeIcon10 AS icon, tblAssets.AssetID, tblAssets.AssetName, tblAntivirus.DisplayName AS Antivirus, tblAssets.Domain, tsysAssetTypes.AssetTypename AS Type, tblAssets.IPAddress AS [IP Address], tblAssets.Description, tblAssetCustom.Manufacturer, tblAssetCustom.Model, tblAssetCustom.Location, tsysIPLocations.IPLocation, tblAssets.Lasttried, tblAssets.Firstseen, tblAssets.Lastseen FROM tblAssets INNER JOIN tblAssetCustom ON tblAssets.AssetID = tblAssetCustom.AssetID INNER JOIN tsysAssetTypes ON tsysAssetTypes.AssetType = tblAssets.Assettype INNER JOIN tblAntivirus ON tblAssets.AssetID = tblAntivirus.AssetID Left Join tsysIPLocations ON tblAssets.LocationID = tsysIPLocations.LocationID WHERE (tblAssetCustom.State = 1) AND (tblAssets.AssetID NOT IN (SELECT DISTINCT AssetID FROM tblAntivirus WHERE (onAccessScanningEnabled <> 0))) ORDER BY tblAssets.AssetName
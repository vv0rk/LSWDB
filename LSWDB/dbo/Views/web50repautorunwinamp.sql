﻿

CREATE VIEW [web50repautorunwinamp] AS SELECT TOP 1000000 tsysOS.Image AS icon, tblAssets.AssetID, tblAssets.AssetName, tsysOS.OSname, tblAutorunUni.Caption, tblAutorun.Lastchanged, tblAssets.Domain, tblAssets.Username, tblAssets.Userdomain, tblAssets.IPAddress, tblAssets.Description, tblAssetCustom.Location, tsysIPLocations.IPLocation, tblAssets.Firstseen, tblAssets.Lastseen FROM tblAssets INNER JOIN tblAutorun ON tblAssets.AssetID = tblAutorun.AssetID INNER JOIN tblAutorunUni ON tblAutorun.AutorunUNI = tblAutorunUni.AutorunUNI INNER JOIN tblAssetCustom ON tblAssets.AssetID = tblAssetCustom.AssetID INNER JOIN tsysOS ON tblAssets.OScode = tsysOS.OScode Left Join tsysIPLocations ON tblAssets.LocationID = tsysIPLocations.LocationID WHERE (tblAutorunUni.Caption = N'Winampagent') AND (tblAssetCustom.State = 1) ORDER BY tblAssets.AssetName
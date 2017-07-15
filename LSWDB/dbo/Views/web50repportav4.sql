﻿

CREATE VIEW [web50repportav4] as SELECT TOP 1000000 tsysOS.Image As icon, tblAssets.AssetID, tblAssets.AssetName, tblPortConnector.ExternalReferenceDesignator, tblPortConnector.InternalReferenceDesignator, tblAssets.Domain, tblAssets.Username, tblAssets.Userdomain, tblAssets.IPAddress, tblAssets.Description, tblAssetCustom.Manufacturer, tblAssetCustom.Model, tblAssetCustom.Location, tsysIPLocations.IPLocation, tsysOS.OSname As OS, tblAssets.SP As SP, tblAssets.Firstseen, tblAssets.Lastseen FROM tblAssets INNER JOIN tblPortConnector ON tblAssets.AssetID = tblPortConnector.AssetID INNER JOIN tblAssetCustom ON tblAssets.AssetID = tblAssetCustom.AssetID INNER JOIN tsysOS ON tblAssets.OScode = tsysOS.OScode Left Join tsysIPLocations ON tblAssets.LocationID = tsysIPLocations.LocationID WHERE (tblAssetCustom.State = 1) AND (tblPortConnector.PortType = 4) ORDER BY tblAssets.AssetName ASC
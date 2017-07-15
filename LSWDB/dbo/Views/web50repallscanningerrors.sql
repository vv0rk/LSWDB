



/*Update reporting for LocationId*/

CREATE VIEW [web50repallscanningerrors] AS SELECT TOP 1000000 tblAssets.AssetName, tblAssets.AssetID, 'Not scanned' AS OS, tblErrors.CFGname, tsysasseterrortypes.ErrorMsg AS [ErrorType], tblErrors.ErrorText AS Message, tblErrors.Lastchanged, tblAssets.Domain, tsysAssetTypes.AssetTypename As Type, tblAssets.IPAddress, tblAssets.Description, tblAssetCustom.Manufacturer, tblAssetCustom.Model, tblAssetCustom.Location, tsysIPLocations.IPLocation, tblAssets.Firstseen, tblAssets.Lastseen,'notscanned.png' AS icon FROM tblAssets INNER JOIN tblErrors ON tblAssets.AssetID = tblErrors.AssetID INNER JOIN tblAssetCustom ON tblAssets.AssetID = tblAssetCustom.AssetID INNER JOIN tsysasseterrortypes ON tblErrors.ErrorType = tsysasseterrortypes.Errortype Left Join tsysIPLocations ON tblAssets.LocationID = tsysIPLocations.LocationID Inner Join tsysAssetTypes On tsysAssetTypes.AssetType = tblAssets.Assettype WHERE (tblAssetCustom.State = 1) AND (COALESCE (tblAssets.OScode, '') = '') ORDER BY tblErrors.Lastchanged DESC, tblAssets.AssetName
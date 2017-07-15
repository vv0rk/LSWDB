

CREATE view web40repWMIAccessDenied AS SELECT		TOP 1000000 tblerrors.AssetID, tsysAssetTypes.AssetTypeIcon10 AS icon, tblAssets.AssetName, 'WMI Access denied. Username(s) tried: ' + tblerrors.ErrorText AS Message, tblAssets.Domain, tsysAssetTypes.AssetTypename AS Type, 
						tblAssets.IPAddress AS [IP Address], tblAssets.Description, tblAssetCustom.Manufacturer, tblAssetCustom.Model,tblAssetCustom.Location, tsysIPLocations.IPLocation,
						tblerrors.Lastchanged AS [Last changed], tblAssets.Firstseen , tblAssets.Lastseen, 'red' as foregroundcolor
FROM			tblerrors INNER JOIN 
						tblAssets ON tblerrors.AssetID = tblAssets.AssetID INNER JOIN 
						tblAssetCustom ON tblAssets.AssetID = tblAssetCustom.AssetID INNER JOIN 
						tsysasseterrortypes ON tblerrors.ErrorType = tsysasseterrortypes.Errortype 
						LEFT OUTER JOIN tblOperatingsystem ON tblAssets.AssetID = tblOperatingsystem.AssetID LEFT OUTER JOIN 
						tsysIPLocations ON tblAssets.LocationID = tsysIPLocations.LocationID INNER JOIN 
						tsysAssetTypes ON tblAssets.Assettype = tsysAssetTypes.AssetType 
WHERE		(tblAssetCustom.State = 1) AND (tblOperatingsystem.AssetID IS NULL) AND (tblErrors.ErrorType = 1)
ORDER BY tblerrors.Lastchanged DESC, tblAssets.AssetName
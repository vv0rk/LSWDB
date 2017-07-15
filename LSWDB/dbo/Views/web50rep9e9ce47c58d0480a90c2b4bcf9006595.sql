﻿CREATE VIEW dbo.web50rep9e9ce47c58d0480a90c2b4bcf9006595 AS Select Top 1000000 tsysIPLocations.IPLocation, tblAssets.AssetName, tblAssets.Domain, tblAssets.IPAddress As [IP Address], 'Not scanned' As OS, tblErrors.CFGname, tsysasseterrortypes.ErrorMsg As Type, tblErrors.ErrorText As Message, tblErrors.Lastchanged, tblAssets.Lasttried, 'notscanned.png' As icon, tblAssets.AssetID As Идентификатор From tblAssets Inner Join tblErrors On tblAssets.AssetID = tblErrors.AssetID Inner Join tblAssetCustom On tblAssets.AssetID = tblAssetCustom.AssetID Inner Join tsysasseterrortypes On tblErrors.ErrorType = tsysasseterrortypes.Errortype Left Join tsysIPLocations On tblAssets.LocationID = tsysIPLocations.LocationID Inner Join tsysAssetTypes On tsysAssetTypes.AssetType = tblAssets.Assettype Order By Идентификатор, tsysIPLocations.IPLocation, tblAssets.AssetName, tblErrors.Lastchanged Desc
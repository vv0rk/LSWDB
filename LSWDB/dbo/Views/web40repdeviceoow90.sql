﻿
CREATE VIEW [dbo].[web40repdeviceoow90]
AS
SELECT      TOP 1000000 dbo.tsysAssetTypes.AssetTypeIcon10 AS icon, dbo.tblAssets.AssetName, dbo.tblAssetCustom.Model AS [Device Model], 
                        dbo.tblAssetCustom.Manufacturer AS [Device   Manufacturer], dbo.tblAssetCustom.Location, dbo.tblAssets.IPAddress, dbo.tblAssets.Lastseen, 
                        dbo.tblAssetCustom.AssetID, dbo.tblAssetCustom.Warrantydate
FROM          dbo.tblAssetCustom INNER JOIN
                        dbo.tblAssets ON dbo.tblAssetCustom.AssetID = dbo.tblAssets.AssetID INNER JOIN
                        dbo.tsysAssetTypes ON dbo.tblAssets.Assettype = dbo.tsysAssetTypes.AssetType
WHERE      (dbo.tblAssetCustom.Warrantydate > GETDATE()) AND (dbo.tblAssetCustom.State = 1) AND (dbo.tblAssetCustom.Warrantydate < GETDATE() + 90) AND 
                        (dbo.tblAssets.Assettype <> - 1)
ORDER BY dbo.tblAssets.AssetName

CREATE VIEW [dbo].[web40repIPLocationlist]
AS
SELECT      TOP 1000000 dbo.tsysAssetTypes.AssetTypeIcon10 AS icon, dbo.tblAssets.AssetName, dbo.tblAssets.Domain, 
                        dbo.tsysAssetTypes.AssetTypename AS Type, dbo.tblAssets.IPAddress AS IP, dbo.tsysIPLocations.IPLocation, dbo.tblAssets.AssetID, 
                        dbo.tblAssets.Lastseen
FROM          dbo.tblAssets LEFT OUTER JOIN
                        dbo.tsysIPLocations ON dbo.tblAssets.IPNumeric >= dbo.tsysIPLocations.StartIP AND 
                        dbo.tblAssets.IPNumeric <= dbo.tsysIPLocations.EndIP INNER JOIN
                        dbo.tsysAssetTypes ON dbo.tblAssets.Assettype = dbo.tsysAssetTypes.AssetType INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID LEFT OUTER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssets.IPNumeric
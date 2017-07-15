
CREATE VIEW [dbo].[web40repcompipaddresslist]
AS
SELECT      TOP 1000000 dbo.tblAssets.IPAddress AS IP, dbo.tsysIPLocations.IPLocation, dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, 
                        dbo.tblAssets.Domain, dbo.tsysOS.OSname, dbo.tsysOS.Image AS icon
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode LEFT OUTER JOIN
                        dbo.tsysIPLocations ON dbo.tblAssets.IPNumeric >= dbo.tsysIPLocations.StartIP AND dbo.tblAssets.IPNumeric <= dbo.tsysIPLocations.EndIP
WHERE      (dbo.tblAssetCustom.State = 1) AND (dbo.tblAssets.IPAddress <> '')
ORDER BY dbo.tblAssets.IPNumeric
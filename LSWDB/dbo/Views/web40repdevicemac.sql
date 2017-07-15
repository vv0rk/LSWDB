
CREATE VIEW [dbo].[web40repdevicemac]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetName, dbo.tblAssets.IPAddress, dbo.tblAssets.Mac, dbo.tblAssetCustom.Model, 
                        dbo.tblAssetCustom.Manufacturer, dbo.tblAssets.Lastseen
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID
WHERE      (dbo.tblAssets.IPAddress <> '') AND (dbo.tblAssetCustom.State = 1) AND (dbo.tblAssets.Assettype <> - 1) AND (dbo.tblAssets.Mac <> '')
ORDER BY dbo.tblAssets.IPNumeric
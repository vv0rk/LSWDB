
CREATE VIEW [dbo].[web40repcomputervendors]
AS
SELECT      TOP 1000000 COALESCE (dbo.tblAssetCustom.Manufacturer, N'Unknown') AS Vendor, COALESCE (dbo.tblAssetCustom.Model, N'Unknown') 
                        AS AssetModel, COUNT(dbo.tblAssets.AssetID) AS Total
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID
WHERE      (dbo.tblAssetCustom.State = 1)
GROUP BY COALESCE (dbo.tblAssetCustom.Manufacturer, N'Unknown'), COALESCE (dbo.tblAssetCustom.Model, N'Unknown')
ORDER BY Total DESC, Vendor, AssetModel
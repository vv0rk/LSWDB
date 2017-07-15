
CREATE VIEW [dbo].[web50repchartcompmodel]
AS
SELECT      TOP 1000000 LTRIM(RTRIM(COALESCE (dbo.tblAssetCustom.Manufacturer, N'') + N'  ' + COALESCE (dbo.tblAssetCustom.Model, N''))) AS Compmodel, 
                        COUNT(dbo.tblAssets.AssetID) AS Total
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID
WHERE      (dbo.tblAssetCustom.State = 1) AND (dbo.tblAssets.Assettype = - 1)
GROUP BY LTRIM(RTRIM(COALESCE (dbo.tblAssetCustom.Manufacturer, N'') + N'  ' + COALESCE (dbo.tblAssetCustom.Model, N'')))
ORDER BY Total DESC, LTRIM(RTRIM(COALESCE (dbo.tblAssetCustom.Manufacturer, N'') + N'  ' + COALESCE (dbo.tblAssetCustom.Model, N'')))
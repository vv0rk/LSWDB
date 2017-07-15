
CREATE VIEW [dbo].[web50repchartcompmanufacturer]
AS
SELECT      TOP 1000000 CASE COALESCE (tblassetcustom.Manufacturer, '') WHEN '' THEN 'Unknown' ELSE COALESCE (tblassetcustom.Manufacturer, '') 
                        END AS Compmanufacturer, COUNT(tblAssets.AssetID) AS Total
FROM          tblAssets INNER JOIN
                        tblAssetCustom ON tblAssets.AssetID = tblAssetCustom.AssetID
WHERE      (tblAssetCustom.State = 1) AND (tblAssets.Assettype = - 1)
GROUP BY CASE COALESCE (tblassetcustom.Manufacturer, '') WHEN '' THEN 'Unknown' ELSE COALESCE (tblassetcustom.Manufacturer, '') END
ORDER BY Total DESC
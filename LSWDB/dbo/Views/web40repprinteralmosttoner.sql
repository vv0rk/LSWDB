

CREATE VIEW [web40repprinteralmosttoner]
AS
SELECT        TOP (1000000) tsysAssetTypes.AssetTypeIcon10 AS icon, tblAssets.AssetName, tblAssetCustom.Manufacturer, tblAssetCustom.Model, 
                         tblAssets.AssetID, CASE WHEN tblCustDevPrinter.TonerMaximum = 0 OR tblCustDevPrinter.TonerRemaining = 0 THEN 0 ELSE FLOOR(tblCustDevPrinter.TonerRemaining / tblCustDevPrinter.TonerMaximum * 100) END AS [Remaining %], 
                         tblCustDevPrinter.TonerMaximum, tblCustDevPrinter.Tonername, tblCustDevPrinter.Lastchanged, tblAssets.IPAddress, tblAssets.Description, 
                         tblAssetCustom.Location, tsysIPLocations.IPLocation, tblAssets.Firstseen, tblAssets.Lastseen
FROM            tblCustDevPrinter INNER JOIN
                         tblAssets ON tblCustDevPrinter.AssetID = tblAssets.AssetID INNER JOIN
                         tblAssetCustom ON tblAssets.AssetID = tblAssetCustom.AssetID INNER JOIN
                         tsysAssetTypes ON tblAssets.Assettype = tsysAssetTypes.AssetType LEFT OUTER JOIN
                         tsysIPLocations ON tsysIPLocations.StartIP <= tblAssets.IPNumeric AND tsysIPLocations.EndIP >= tblAssets.IPNumeric
WHERE        tblCustDevPrinter.TonerMaximum <> 0 AND tblCustDevPrinter.TonerRemaining <> 0 AND (FLOOR(tblCustDevPrinter.TonerRemaining / (CASE WHEN tblCustDevPrinter.TonerMaximum = 0 THEN 1 ELSE tblCustDevPrinter.TonerMaximum END) * 100) <= 10) AND 
                         (FLOOR(tblCustDevPrinter.TonerRemaining / (CASE WHEN tblCustDevPrinter.TonerMaximum = 0 THEN 1 ELSE tblCustDevPrinter.TonerMaximum END) * 100) >= 0) AND (tblCustDevPrinter.TonerMaximum > 0) AND 
                         (tblAssetCustom.State = 1)
ORDER BY [Remaining %]

CREATE VIEW [dbo].[web40reptonerlevel]
AS
SELECT      TOP 1000000 dbo.tsysAssetTypes.AssetTypeIcon10 AS icon, dbo.tblAssets.AssetName, dbo.tblAssetCustom.Model AS [Device  model], 
                        dbo.tblCustDevPrinter.AssetID, FLOOR(dbo.tblCustDevPrinter.TonerRemaining / dbo.tblCustDevPrinter.TonerMaximum * 100) AS [Remaining %], 
                        dbo.tblCustDevPrinter.Tonername, dbo.tblCustDevPrinter.Lastchanged
FROM          dbo.tblCustDevPrinter INNER JOIN
                        dbo.tblAssets ON dbo.tblCustDevPrinter.AssetID = dbo.tblAssets.AssetID INNER JOIN
                        dbo.tsysAssetTypes ON dbo.tblAssets.Assettype = dbo.tsysAssetTypes.AssetType INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID
WHERE      (dbo.tblCustDevPrinter.TonerMaximum > 0) AND (dbo.tblAssetCustom.State = 1) AND 
                        (FLOOR(dbo.tblCustDevPrinter.TonerRemaining / dbo.tblCustDevPrinter.TonerMaximum * 100) >= 0)
ORDER BY FLOOR(dbo.tblCustDevPrinter.TonerRemaining / dbo.tblCustDevPrinter.TonerMaximum * 100)
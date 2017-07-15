
CREATE VIEW [dbo].[web50repcharteventlog14days]
AS
SELECT      TOP 1000000 CONVERT(nVARCHAR(10), dbo.tblNtlog.TimeGenerated, 102) AS Thedate, COUNT(dbo.tblAssets.AssetID) AS Total
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tblNtlog ON dbo.tblAssets.AssetID = dbo.tblNtlog.AssetID
WHERE      (dbo.tblAssetCustom.State = 1) AND (dbo.tblAssets.Assettype = - 1) AND (dbo.tblNtlog.Eventtype = 1) AND (dbo.tblNtlog.TimeGenerated > GETDATE() 
                        - 14)
GROUP BY CONVERT(nVARCHAR(10), dbo.tblNtlog.TimeGenerated, 102)
ORDER BY thedate DESC
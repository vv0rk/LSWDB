
CREATE VIEW [dbo].[web50repbiosage]
AS
SELECT      TOP 1000000 DATEPART(yyyy, dbo.tblBIOS.ReleaseDate) AS Biosyear, COUNT(dbo.tblAssets.AssetID) AS Total
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblBIOS ON dbo.tblAssets.AssetID = dbo.tblBIOS.AssetID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID
WHERE      (dbo.tblAssetCustom.State = 1)
GROUP BY DATEPART(yyyy, dbo.tblBIOS.ReleaseDate)
ORDER BY DATEPART(yyyy, dbo.tblBIOS.ReleaseDate)

CREATE VIEW [dbo].[web50repchartwinlang]
AS
SELECT      TOP 1000000 dbo.tblLanguages.Language, COUNT(dbo.tblAssets.AssetID) AS Total
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tblOperatingsystem ON dbo.tblAssets.AssetID = dbo.tblOperatingsystem.AssetID INNER JOIN
                        dbo.tblLanguages ON dbo.tblOperatingsystem.OSLanguage = dbo.tblLanguages.LanguageCode
WHERE      (dbo.tblAssetCustom.State = 1) AND (dbo.tblAssets.Assettype = - 1)
GROUP BY dbo.tblLanguages.Language
ORDER BY total DESC

CREATE VIEW [dbo].[web40replanguagetotal]
AS
SELECT      TOP 1000000 dbo.tblAssets.Domain, dbo.tblLanguages.Language AS [OS Language], COUNT(dbo.tblAssets.AssetID) AS Total
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblOperatingsystem ON dbo.tblAssets.AssetID = dbo.tblOperatingsystem.AssetID LEFT OUTER JOIN
                        dbo.tblLanguages ON dbo.tblLanguages.LanguageCode = dbo.tblOperatingsystem.OSLanguage INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblAssetCustom.State = 1)
GROUP BY dbo.tblAssets.Domain, dbo.tblLanguages.Language
ORDER BY dbo.tblAssets.Domain, total DESC
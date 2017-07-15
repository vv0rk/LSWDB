
CREATE VIEW [dbo].[web40repnonenglish]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tsysOS.OSname, dbo.tblAssets.Description, 
                        dbo.tblLanguages.Language, dbo.tblAssets.Lastseen AS [Last Seen], dbo.tsysOS.Image AS icon
FROM          dbo.tblAssets LEFT OUTER JOIN
                        dbo.tblOperatingsystem ON dbo.tblAssets.AssetID = dbo.tblOperatingsystem.AssetID LEFT OUTER JOIN
                        dbo.tblLanguages ON dbo.tblLanguages.LanguageCode = dbo.tblOperatingsystem.OSLanguage INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblOperatingsystem.OSLanguage <> 1033) AND (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssets.Domain, dbo.tblAssets.Lastseen DESC
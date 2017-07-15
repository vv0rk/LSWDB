
CREATE VIEW [dbo].[web40repdnserror]
AS
SELECT      TOP 1000000 dbo.tblErrors.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tblErrors.ErrorText, MAX(dbo.tblErrors.Lastchanged) 
                        AS [Last changed]
FROM          dbo.tblErrors INNER JOIN
                        dbo.tblAssets ON dbo.tblErrors.AssetID = dbo.tblAssets.AssetID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID
WHERE      (dbo.tblAssetCustom.State = 1)
GROUP BY dbo.tblErrors.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tblErrors.ErrorText
HAVING       (dbo.tblErrors.ErrorText LIKE '%dns redirected%')
ORDER BY [Last changed] DESC
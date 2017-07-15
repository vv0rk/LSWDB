
CREATE VIEW [dbo].[web40repSharedFolder]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tblAssets.Description, dbo.tsysOS.OSname, 
                        dbo.tblSharesUni.Name, dbo.tblSharesUni.Path, dbo.tblShares.Lastchanged, dbo.tsysOS.Image AS icon
FROM          dbo.tblShares INNER JOIN
                        dbo.tblAssets ON dbo.tblShares.AssetID = dbo.tblAssets.AssetID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode INNER JOIN
                        dbo.tblSharesUni ON dbo.tblShares.ShareUniqueID = dbo.tblSharesUni.ShareUniqueID
WHERE      (dbo.tblAssetCustom.State = 1) AND (dbo.tblSharesUni.Type = 0) AND (NOT (dbo.tblSharesUni.Name LIKE N'%$'))
ORDER BY dbo.tblAssets.AssetName
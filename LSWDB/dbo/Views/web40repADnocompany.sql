
CREATE VIEW [dbo].[web40repADnocompany]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tsysOS.OSname, dbo.tblAssets.IPAddress, 
                        COALESCE (dbo.tblADComputers.Company, N'') AS Company, dbo.tsysOS.Image AS icon, dbo.tblADComputers.Lastchanged
FROM          dbo.tblAssets INNER JOIN
                        dbo.tblADComputers ON dbo.tblAssets.AssetID = dbo.tblADComputers.AssetID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (COALESCE (dbo.tblADComputers.Company, N'') = '') AND (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssets.AssetName
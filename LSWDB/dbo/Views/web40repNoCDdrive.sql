
CREATE VIEW [dbo].[web40repNoCDdrive]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tsysOS.OSname, dbo.tblAssetCustom.Model, 
                        dbo.tblAssets.Description, dbo.tsysOS.Image AS icon
FROM          dbo.tblAssets LEFT OUTER JOIN
                        dbo.tblCDROMDrive ON dbo.tblAssets.AssetID = dbo.tblCDROMDrive.AssetID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblCDROMDrive.AssetID IS NULL) AND (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssets.AssetName
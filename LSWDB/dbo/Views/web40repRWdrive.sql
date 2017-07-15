
CREATE VIEW [dbo].[web40repRWdrive]
AS
SELECT      TOP 1000000 dbo.tblAssets.AssetID, dbo.tblAssets.AssetUnique, dbo.tblAssets.Domain, dbo.tsysOS.OSname, dbo.tblAssets.Description, 
                        dbo.tblCDROMDrive.Caption, dbo.tsysOS.Image AS icon
FROM          dbo.tblCDROMDrive INNER JOIN
                        dbo.tblAssets ON dbo.tblCDROMDrive.AssetID = dbo.tblAssets.AssetID INNER JOIN
                        dbo.tblAssetCustom ON dbo.tblAssets.AssetID = dbo.tblAssetCustom.AssetID INNER JOIN
                        dbo.tsysOS ON dbo.tblAssets.OScode = dbo.tsysOS.OScode
WHERE      (dbo.tblCDROMDrive.Capabilities LIKE N'%[4]%') AND (dbo.tblAssetCustom.State = 1)
ORDER BY dbo.tblAssets.AssetName